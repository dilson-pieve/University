#include <bits/stdc++.h>

using namespace std;

class Node {
    public:
        int data;
        Node *left;
        Node *right;

        Node(int d){
            data = d;
            left = NULL;
            right= NULL;
        }
};

class Solution {

    public:

        Node *insert(Node *root, int data) {
            if(root == NULL)
                return new Node(data);

            else
            {
                if(data <= root->data)
                    root->left = insert(root->left, data);
                else root->right = insert(root->right, data);


                return root;
            }
        }

        int getHeight(Node *root) {
            if(root == NULL)
                return -1;

            int l = getHeight(root->left);
            int r = getHeight(root->right);

            if(l>r) return (l+1);
            else return (r+1);
        }

        //BFS and print a tree by level

        void levelOrder(Node * root) {
                queue<Node *> q;
                
                if(root)
                    q.push(root);

                while(!q.empty()){
                    Node *v = q.front();
                    q.pop();

                    cout << v->data << " ";
                    if(v->left != NULL)
                        q.push(v->left);
                    if(v->right != NULL)
                        q.push(v->right);

                }
        }

        Node* removeDuplicates(Node *head) {
            if (head == NULL || head->next == NULL)
                return head;
             
            if(head->data == head->next->data){
                head->next = head->next->next;
                  removeDuplicates(head);
            }else removeDuplicates(head->next);
            
            return head;
        }
    
};

int main(){
  
    Solution myTree;
    Node *root = NULL;

    int t;
    cin >> t;

    while(t--){
        int data;
        cin >> data;

        root = myTree.insert(root, data);
    }
    int height = myTree.getHeight(root);

    cout << height;

    return 0;
}