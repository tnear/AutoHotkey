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
        struct CustomComparator
        {
            // functor to compare two values. this returns which value goes on *bottom*
            bool operator()(Data &left, Data &right)
            {
                return left.x > right.x;
            };
        };

        //           <dtype> vector<dtype> <comparator>
        priority_queue<Data, vector<Data>, CustomComparator> minHeap;
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
                : parent(n), rank(n, 1)
            {
                // by default, every node is its own parent
                // in a disconnected component
                for (int i = 0; i < n; ++i)
                    parent[i] = i;
            }

            // return root of n
            int find(int n)
            {
                // path compression
                while (n != parent[n])
                {
                    // update parents as you iterate so that
                    // subsequent calls are faster
                    parent[n] = parent[parent[n]];
                    n = parent[n];
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
                if (rank[p1] > rank[p2])
                {
                    // p1 bigger, so merge p2 into p1
                    rank[p1] += rank[p2];
                    parent[p2] = p1;
                }
                else
                {
                    // p2 bigger, merge p1 into p2
                    rank[p2] += rank[p1];
                    parent[p1] = p2;
                }
            }

            vector<int> parent;
            vector<int> rank;
        };
    )

    ::cppSortedIndexes::
    (
        template <typename T>
        vector<int> sortedIndexes(const vector<T> &input)
        {
            vector<int> output(input.size());
            // create [0, 1, 2, 3, ..., N-1]
            iota(output.begin(), output.end(), 0);

            // sort indexes by comparing input *values*
            sort(output.begin(), output.end(), [&](int leftIdx, int rightIdx)
            {
                return input[leftIdx] < input[rightIdx];
            });

            return output;
        }
    )

    ::cppStringJoin::
    (
        string join(const vector<string> &input, const string &separator)
        {
            string result;
            for (int i = 0; i < input.size(); ++i)
            {
                result += input[i];
                result += separator;
            }

            result = result.substr(0, result.size() - separator.size());
            return result;
        }
    )

    ::cppStringSplit::
    (
        vector<string> split(const string &input, const string &separator)
        {
            vector<string> result;
            int start = 0;
            int end = input.find(separator);

            while (end != string::npos)
            {
                result.push_back(input.substr(start, end - start));
                start = end + separator.length();
                end = input.find(separator, start);
            }

            result.push_back(input.substr(start, end));
            return result;
        }
    )

    ::cppStringReplace::
    (
        // ex: sr("test testing", "test", "build") => "build building"
        string stringReplace(const string &source, const string &from, const string &to)
        {
            string ret = source;
            size_t start_pos = 0;
            while ((start_pos = ret.find(from, start_pos)) != string::npos)
            {
                ret.replace(start_pos, from.length(), to);
                start_pos += to.length(); // handles case where 'to' is a substring of 'from'
            }
            return ret;
        }
    )

    ::cppOmpTask::
    (
        int _sumTree(TreeNode* node)
        {
            if (node == nullptr)
                return 0;

            int leftSum = 0, rightSum = 0;

            // shared() is used so that the result exists beyond the scope
            // firstprivate is used to preserve node value in omp
            #pragma omp task shared(leftSum) firstprivate(node)
            {
                leftSum = _sumTree(node->left);
            }

            #pragma omp task shared(rightSum) firstprivate(node)
            {
                rightSum = _sumTree(node->right);
            }

            #pragma omp taskwait // wait for tasks to complete

            // combine this node result with child results
            return node->value + leftSum + rightSum;
        }

        int sumTree(TreeNode *node)
        {
            int totalSum = 0;

            // create one parallel region to use for *all* recursive calls
            #pragma omp parallel
            {
                #pragma omp single // ensure block is only called once
                totalSum = _sumTree(node);
            }

            return totalSum;
        }
    )

    ::cppPrintContainer::
    (
        template <typename T>
        void printContainer(T &container)
        {
            for (auto it = begin(container); it != end(container); ++it)
                cout << *it << " ";

            cout << "\n";
        }
    )

    ::cppCycleDetection::
    (
        bool cycleDetection(GraphNode *node, unordered_set<GraphNode *> &allVisitedNodes,
                            unordered_set<GraphNode *> &currentPath)
        {
            if (currentPath.contains(node))
                return true; // found back edge in current path, therefore it has a cycle
            else if (allVisitedNodes.contains(node))
                return false; // visited before and did not find a cycle, return early

            // visit current
            allVisitedNodes.insert(node);
            currentPath.insert(node);

            // recursively call children
            for (GraphNode *child : node->adjacencyList)
            {
                if (cycleDetection(child, allVisitedNodes, currentPath))
                    return true; // one cycle is enough
            }

            /*
            1 --> 2
             \    |
              \   v
               -> 3
            */
            currentPath.erase(node); // backtrack
            return false;
        }
    )

    ::cppBellmanFord::
    (
        // init distances to inf
        // init src distance to zero
        // for num steps (often V-1):
        //     get each node and edge:
        //         if distances[src] != inf:
        //             if distances[src] + weight < distances[dst]:
        //                 distances[dst] = distances[src] + weight 
    )
#HotIf
