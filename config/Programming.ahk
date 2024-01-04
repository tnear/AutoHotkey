#Requires AutoHotkey v2
#SingleInstance Force

#HotIf !WinActive('ahk_exe WINWORD.exe')
    ::cppForNested::
    (
        for (int row = 0; row < data.size(); ++row)
        {
            for (int col = 0; col < data[0].size(); ++col)
            {

            }
        }
    )

    ::cppRaii::
    (
        class RAIIDeleter
        {
        public:
            RAIIDeleter(function<void(void)> onCleanup)
                : _onCleanup(onCleanup)
            {}

            ~RAIIDeleter()
            {
                _onCleanup(); // use destructor to ensure onCleanup is always called
            }

        private:
            function<void(void)> _onCleanup;
        };

        // usage
        RAIIDeleter d([&]() { cleanupFcn(args); });
    )

    ::cppHashFunction::
    (
        // use std::hash to create a custom hash function
        auto customHashFcn = [](const pair<int, int> &p) -> size_t
        {
            auto h1 = hash<int>{}(p.first);
            auto h2 = hash<int>{}(p.second);
            return h1 ^ (h2 << 1); // bit shift and xor to combine both values
        };

        // create a typedef to simplify syntax
        using MapWithCustomHasher = unordered_map<pair<int, int>, int, function<size_t(const pair<int, int> &)>>;

        // create a map using the custom hash function (plus initial bucket count)
        MapWithCustomHasher mapCustom(0, customHashFcn);
    )

    ::cppHeapFunction::
    (
        // compare pair<int, int>
        auto fcn = [](pair<int, int> &left, pair<int, int> &right)
        {
            return left.first > right.first;
        };

        //             <data type>     vector<data type>      <comp fcn type>        <fcn>
        priority_queue<pair<int, int>, vector<pair<int, int>>, decltype(fcn)> minHeap(fcn);
    )

    ::cppLinearIndex::
    (
        int subscriptToLinearIndex(int row, int col, int numCols)
        {
            // convert matrix[row][col] to single dimension, ex:
            // [0 1 2 3 4]
            // [5 6 7 8 9] ...
            return col + row * numCols;
        }

        pair<int, int> linearIndexToSubscript(int linearIndex, int numCols)
        {
            // inverse of subscriptToLinearIndex, ex: idx=7 returns row=1, col=2
            // [0 1 2 3 4]
            // [5 6 7 8 9] ...
            int row = linearIndex / numCols;
            int col = linearIndex % numCols;
            return {row, col};
        }
    )

    ::cppPrintMatrix::
    (
        void printMatrix(const vector<vector<int>> &v)
        {
            for (int row = 0; row < v.size(); ++row)
            {
                for (int col = 0; col < v[0].size(); ++col)
                    cout << v[row][col] << " ";
                cout << endl;
            }
        }
    )

    ::cppRemoveDuplicates::
    (
        vec.erase(unique(vec.begin(), vec.end()), vec.end());
    )

    ::cppTrieNode::
    (
        class TrieNode
        {
        public:
            TrieNode(bool isWord)
                : isWord(isWord)
            {
            }

            bool isWord = false;
            unordered_map<char, TrieNode *> children;
        };
    )

    ::cppTrieInsert::
    (
        void insert(const string &word)
        {
            TrieNode *current = _rootNode;

            for (char c : word)
            {
                // check if char exists in current node
                bool exists = current->children.contains(c);
                if (!exists)
                {
                    // char has not been inserted yet, create new node
                    current->children[c] = new TrieNode{false};
                }

                // update pointer by following child
                current = current->children[c];
            }

            // reached end of string, mark this as word
            current->isWord = true;
        }
    )

    ::cppMinHeap::
    (
        priority_queue<int, vector<int>, greater<int>> minHeap;
    )

    ::cppGraphNode::
    (
        class GraphNode
        {
        public:
            GraphNode(int value)
                : value(value)
            {
            }

            void addEdge(GraphNode *nodeToConnect)
            {
                adjacencyList.insert(nodeToConnect);
            }

            int value = 0;
            unordered_set<GraphNode*> adjacencyList;
        };
    )

    ::cppSortDescending::
    (
        // use '>' to put larger elements first
        ranges::sort(vec, greater<int>());
    )

    ::cppUnionFind::
    (
        class UnionFind
        {
        public:
            UnionFind(int n)
                : _parent(n), _rank(n, 1)
            {
                // by default, every node is its own parent
                // in a disconnected component
                for (int i = 0; i < n; ++i)
                    _parent[i] = i;
            }

            // return root of n
            int find(int n)
            {
                // path compression
                while (n != _parent[n])
                {
                    // update parents as you iterate so that
                    // subsequent calls are faster
                    _parent[n] = _parent[_parent[n]];
                    n = _parent[n];
                }

                return n;
            }

            // union (combine) components belonging to n1 and n2
            void unionSets(int n1, int n2)
            {
                int p1 = find(n1);
                int p2 = find(n2);
                if (p1 == p2)
                    return; // already in same connected component

                // always merge the small rank into the big rank for better performance
                // this keeps the tree height shallow
                if (_rank[p1] > _rank[p2])
                {
                    // p1 bigger, so merge p2 into p1
                    _rank[p1] += _rank[p2];
                    _parent[p2] = p1;
                }
                else
                {
                    // p2 bigger, merge p1 into p2
                    _rank[p2] += _rank[p1];
                    _parent[p1] = p2;
                }
            }

            vector<int> _parent;
            vector<int> _rank;
        };
    )
#HotIf
