% Example Usage:
% List of symbol frequencies
symbol_frequencies(SymbolFrequencies) :- SymbolFrequencies = [a-5, b-9, c-12, d-13, e-16, f-45].

% Run huffman_coding/2 with symbol frequencies
:- symbol_frequencies(SymbolFrequencies),
   huffman_coding(SymbolFrequencies, HuffmanCodes),
   write('Huffman Codes: '), writeln(HuffmanCodes).

% huffman_coding/2 takes a list of symbols and their frequencies
% and returns the Huffman code for each symbol in the form of a list of pairs.
huffman_coding(SymbolFrequencies, HuffmanCodes) :-
    build_huffman_tree(SymbolFrequencies, Tree),
    build_huffman_codes(Tree, HuffmanCodes).

% build_huffman_tree/2 builds a Huffman tree from a list of symbol frequencies.
build_huffman_tree(SymbolFrequencies, Tree) :-
    map_list_to_nodes(freq_node, SymbolFrequencies, Nodes),
    build_huffman_tree(Nodes, Tree).

build_huffman_tree([Node], Node).
build_huffman_tree(Nodes, Tree) :-
    sort_nodes(Nodes, SortedNodes),
    combine_nodes(SortedNodes, CombinedNodes),
    build_huffman_tree(CombinedNodes, Tree).

sort_nodes(Nodes, SortedNodes) :-
    keysort(Nodes, SortedNodes).

combine_nodes([Node1, Node2 | Rest], [combined(Node1, Node2, Freq) | Rest]) :-
    frequency(Node1, Freq1),
    frequency(Node2, Freq2),
    Freq is Freq1 + Freq2.

frequency(Node, Freq) :-
    Node = freq(_, Freq).

% build_huffman_codes/2 builds Huffman codes from a Huffman tree.
build_huffman_codes(Tree, HuffmanCodes) :-
    build_huffman_codes(Tree, [], HuffmanCodes).

build_huffman_codes(leaf(Symbol, _), [(Symbol, [])]) :- !.
build_huffman_codes(combined(Left, Right, _), Codes) :-
    build_huffman_codes(Left, LeftCodes),
    build_huffman_codes(Right, RightCodes),
    append_codes(LeftCodes, [0], LeftWithCode),
    append_codes(RightCodes, [1], RightWithCode),
    append(LeftWithCode, RightWithCode, Codes).

% append_codes/3 appends a code to each symbol in a list of codes.
append_codes([], _, []).
append_codes([(Symbol, Code)|Rest], AppendCode, [(Symbol, NewCode)|NewRest]) :-
    append(Code, AppendCode, NewCode),
    append_codes(Rest, AppendCode, NewRest).

% map_list_to_nodes/3 maps a list of pairs to a list of nodes.
map_list_to_nodes(Func, Pairs, Nodes) :-
    maplist(map_pair_to_node(Func), Pairs, Nodes).

% map_pair_to_node/3 applies the given function to a pair and creates a node.
map_pair_to_node(Func, Pair, Node) :-
    Pair = Key-Value,
    call(Func, Key, Value, Node).

% freq_node/3 creates a node from a symbol and its frequency.
freq_node(Symbol, Frequency, freq(Symbol, Frequency)).

% huffman_code_for_symbol/3 retrieves the Huffman code for a given symbol.
huffman_code_for_symbol(Symbol, HuffmanCodes, Code) :-
    member((Symbol, Code), HuffmanCodes).

% Example Usage:
% Retrieve and print the Huffman code for the symbol 'a'.
:- huffman_code_for_symbol(a, HuffmanCodes, Code),
   format('Huffman code for symbol a: ~w~n', [Code]).
