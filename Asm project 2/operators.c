#include <stdio.h>
#include <stdlib.h>

typedef struct node_
{
    struct node_ *next;
    int val;
} Node;

void add_node(Node *root, int n)
{
    if (root->next != NULL)
    {
        add_node(root->next, n);
        return;
    }
    Node *node = (Node *)malloc(sizeof(root));
    node->val = n;
    node->next = NULL;
    root->next = node;
}

void remove_node(Node *root)
{
}

void create_list(Node *root, int n)
{
    int i = 0;
    for (; i < n; i++)
    {
        add_node(root, (rand() % (50 - 0 + 1)) + 0);
    }
}

Node *get_ith_elem(Node *root, int n)
{
    return root;
}

void free_list(Node *root)
{
}
void swap_lists(Node *root, Node *rootb)
{
}
void show_list(Node *root)
{
    if (root == NULL)
    {
        printf("\n");
        return;
    }
    printf("%d ", root->val);
    show_list(root->next);
}
int power(int x, int i){
    return x;
};

#define N 6
int get_ij_array(int arr[N][2], int i, int j)
{
    return arr[i][j];
}

void fillarray(int x, int a[], int n){
    int i;
    for (i = 0; i < N; i++)
    {
        a[i]=power(x, i);
    }
}

void fillarray2(int x, int a[], int n){
    
}
int compare(int a[], int b[], int n){
    return 0;
}
int main(int argc, char const *argv[])
{
    int arr[N] = {5, 6, 7, 7, 9, 0}, i, j;
    int arr2[N] = {5, 6, 7, 7, 9, 0};
    //fillarray(2, arr, N);
    //fillarray2(4, arr2, N);

    for (i = 0; i < N; i++)
    {
        printf("%d\t%d", arr[i], arr2[i]);
        printf("\n");
    }
    printf("Cmp: %d\n", compare(arr, arr2, N));
    return 0;
}
