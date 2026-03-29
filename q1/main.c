#include <stdio.h>
#include <stdlib.h>

struct Node {
int val;
struct Node* left;
struct Node* right;
};

struct Node* make_node(int val);
struct Node* insert(struct Node* root, int val);
struct Node* get(struct Node* root, int val);
int getAtMost(int val, struct Node* root);

// helper to print inorder (should be sorted if BST is correct)
void inorder(struct Node* root) {
if (root == NULL) return;
inorder(root->left);
printf("%d ", root->val);
inorder(root->right);
}

int main() {
struct Node* root = NULL;
// Insert values
int arr[] = {2, 3, 6, 1, 7, 5};
int n = sizeof(arr) / sizeof(arr[0]);

for (int i = 0; i < n; i++) {
    root = insert(root, arr[i]);
}

printf("Inorder traversal (should be sorted):\n");
inorder(root);
printf("\n\n");

// Test get
int search_vals[] = {4, 6, 7 ,5};
for (int i = 0; i < 4; i++) {
    struct Node* res = get(root, search_vals[i]);
    if (res != NULL)
        printf("Found %d\n", res->val);
    else
        printf("%d not found\n", search_vals[i]);
}

printf("\n");

// Test getAtMost
int queries[] = {3, 8, 1, 50};
for (int i = 0; i < 4; i++) {
    int ans = getAtMost(queries[i], root);
    printf("getAtMost(%d) = %d\n", queries[i], ans);
}

return 0;
}
