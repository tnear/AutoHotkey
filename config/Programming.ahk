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
            bool unionSets(int n1, int n2)
            {
                int p1 = find(n1);
                int p2 = find(n2);
                if (p1 == p2)
                    return false; // already in same connected component

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
                return true;
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

return result.substr(0, result.size() - separator.size());
}
    )

    ::cppStringSplit::
    (
// ex: "a;b;c" -> ["a", "b", "c"] for ";" separator
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
        // ex: stringReplace("test testing", "test", "build") => "build building"
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

    ::cppStringTrim::
    (
        string& trim(string &str)
        {
            str.erase(str.find_last_not_of(' ') + 1); // suffix spaces
            str.erase(0, str.find_first_not_of(' ')); // prefix spaces
            return str;
        }
    )

    ::cppOmpTask::
    (
        // parallel function:
        //     #pragma omp task shared(ret) firstprivate(args)
        //         ret = recurse(args)
        //     #pragma omp task ...
        //         ret = recurse(args)
        //     #pragma omp taskwait
        // driver function:
        //     #pragma omp parallel
        //         #pragma omp single
        //             call parallel function
        // critical section:
        // #pragma omp critical
        // {
        //     // update shared state, container, etc.
        // }
    )

    ::cppCycleDetection::
    (
        // check if current path contains node
        //     has cycle
        // check if visited before
        //     no cycle
        // visit node (both current path and all visited)
        // for each neighbor:
        //     if hasCycle(child)
        //         has cycle
        // remove from current path (backtrack)
        //  1 --> 2
        //   \    |
        //    \   v
        //     -> 3
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

    ::cppDijkstra::
    (
        // init distances to inf
        // zero distance to src
        // min heap containing {weight, node} (using std::greater)
        // add src to heap
        // while heap has data:
        //     pop top
        //     visit add neighbors of current
        //     newWeight = currentWeight + neighborWeight
        //     compare newWeight to distances[neighbor]:
        //         update weight if better
        //         add neighbor to heap
    )

    ::cppPrim::
    (
        // choose any start node (mst must visit all nodes)
        // create min heap of {dist, node} (use std::greater)
        // init heap to all src's neighbor distances
        // init visited set to source
        // while not all nodes have been visited:
        //     get current (pop top)
        //     add current to visited
        //     iterate through all unvisited nodes:
        //         compute distance from 'current' to unvisitedNode
        //         add to {distance, unvisitedNode} to heap
    )

    ::cppPrint::
    (
        template <typename, typename = void_t<>>
        struct has_mapped_type : false_type {};

        template <typename T>
        struct has_mapped_type<T, void_t<typename T::mapped_type>> : true_type {};

        // print function for set, map, unordered_set, unordered_map
        template <typename T>
        void print(const T &container)
        {
            cout << "{ ";
            for (const auto &element : container)
            {
                // check for map type
                if constexpr (has_mapped_type<T>::value)
                    cout << "(" << element.first << ": " << element.second << ") ";
                else
                    cout << element << " "; // for sets, directly print the element
            }
            cout << "}\n";
        }

        // specialization for vector
        template <typename T>
        void print(const vector<T> &vec)
        {
            cout << "[ ";
            for (const auto &elem : vec)
            {
                cout << elem << " ";
            }
            cout << "]\n";
        }

        // specialization for 2D vectors
        template <typename T>
        void print(const vector<vector<T>> &vec)
        {
            cout << "2D:\n";
            for (int i = 0; i < vec.size(); ++i)
            {
                cout << to_string(i) << ": ";
                print(vec[i]); // call print() specialization for 1D vector
            }
            cout << '\n';
        }
    )

    ::cppInterval::
    (
        // sort intervals by start time
        // set current to be first interval
        // iterate from idx=1 to end:
        //     check if current overlaps:
        //         expand current start/stop
        //     otherwise: update current
    )

    ::cppSystemDesign::
    (
        - Requirements list
        - Rate limiter. DoS attacks and accidental API usages
        - Load balancer. User authentication, triaging
        - Capacity. DAU, bandwidth, qps
        - API for requirements
        - Message queue. Scale each side independently
        - Replication: reliability, fault-tolerance, and performance
        - Sharding + sharding key
        - Consistency. Ensure all nodes agree
        - Caching. Avoid database hits
        - Logging and metrics. Ex: latency, CPU usage, message queue size, cache hit rate, etc.
            - Machine learning analytics
            - Security
    )

    ::cppQuick::
    (
        // ex: [1  4  2  5  3]
        //     c,v         p,r      c=current, v=pivotPtr, p=pivotValue, r=right
        // 1 < 3, so swap c&v and increment v
        //     [1  4  2  5  3]
        //        c,v      p,r
        // 4 > 3, so do nothing
        //     [1  4  2  5  3]
        //         v  c    p,r
        // c < 3, so swap c&v and increment v
        //     [1  2  4  5  3]
        //            v  c p,r
        // 5 > 3 so do nothing
        // lastly, swap pivot value its proper place by swapping v,p:
        //     [1 2 *3* 5 4]
        // return v=pivotPtr so that recursive calls solve [L, v-1] and [v+1, R]
    )

    ::cppFile::
    (
        bool writeStringsToFile(const vector<string> &lines, const string &fileName)
        {
            // open a file in write mode
            ofstream outFile(fileName);

            if (!outFile.is_open())
                return false; // cannot be opened

            // write lines
            for (const string &line : lines)
                outFile << line << endl;

            // close file when done
            outFile.close();
            return true;
        }

        vector<string> readLinesFromFile(const string &fileName)
        {
            // open file
            ifstream inFile(fileName);

            if (!inFile.is_open())
                return {}; // could not open file

            vector<string> lines;
            string line;
            // read each line
            while (getline(inFile, line))
            {
                lines.push_back(line);
            }

            // close file when done
            inFile.close();
            return lines;
        }
    )

    ::cppBound::
    (
        // lower_bound returns iterator to 1st elem NOT considered to go before VAL
        // upper_bound returns iterator to 1st elem which goes after VAL
    )

    ::cpp4Dirs::
    (
        vector<pair<int, int>> dirs = {{-1, 0}, {1, 0}, {0, 1}, {0, -1}};
    )

    ::cpp8Dirs::
    (
        vector<pair<int, int>> dirs = {{-1, -1}, {0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}};
    )
#HotIf
