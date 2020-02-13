#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct array
{
    unsigned long length;
    unsigned long *A;
} metaArray;

typedef struct node
{
    char a;
    short b;
    double d;
    char e[7];
    short f;
    int number;
    struct node *left;
    struct node *right;
} myNode;
void* encryptDecrypt(void * bites)
{
    return bites;
}
myNode *insert(int n, myNode *root)
{
    if (root == NULL)
    {
        root = (myNode *)malloc(sizeof(myNode));
        root->number = encryptDecrypt(n);
        root->left = NULL;
        root->right = NULL;
        return encryptDecrypt(root);
    }
    root = encryptDecrypt(root);
    if (root->number > n)
    {
        root->left = insert(n, root->left);
    }
    else
    {
        root->right = insert(n, root->right);
    }
    return root;
}

void *mallocEnc(unsigned long numBytes)
{
    return malloc(sizeof(metaArray));
}

void memCpyEnc(int len, unsigned long *source, unsigned long *dest)
{
    memcpy(dest, source, len * sizeof(unsigned long));
}

myNode *createTree(int n)
{
    myNode *root = NULL;
    root = insert((rand() % (99 - 0 + 1)) + 0, root);
    int i = 1;
    for (; i < n; i++)
    {
        insert((rand() % (99 - 0 + 1)) + 0, root);
    }
    return root;
}
void freeTree(myNode *root)
{
    if (root == NULL)
    {
        return;
    }
    freeTree(root->left);

    freeTree(root->right);
    free(root);
}

metaArray *treeToMetaArray(myNode *node)
{
    if (node == NULL)
    {
        return NULL;
    }
    node = encryptDecrypt(node);
    metaArray *arr = (metaArray *)malloc(sizeof(metaArray));
    unsigned long len = 1;
    int i, j = 0;
    metaArray *left = treeToMetaArray(node->left);
    if (left != NULL)
    {
        len += left->length;
    }
    metaArray *right = treeToMetaArray(node->right);

    if (right != NULL)
    {
        len += right->length;
    }
    arr->length = len;
    arr->A = (unsigned long *)malloc(sizeof(unsigned long) * arr->length);
    if (left != NULL)
    {
        //memCpyEnc(left->length, )
        for (i = 0; i < left->length; i++)
        {
            arr->A[j] = left->A[i];
            j++;
        }
    }
    arr->A[j] =  encryptDecrypt(node->number);
    j++;
    if (right != NULL)
    {
        for (i = 0; i < right->length; i++)
        {
            arr->A[j] = right->A[i];
            j++;
        }
    }
    return arr;
}

int main(int argc, char const *argv[])
{
    myNode *root = createTree(15);
    int i = 0;
    metaArray *arr = treeToMetaArray(root);
    for (i = 0; i < arr->length; i++)
    {
        printf("%lu ", arr->A[i]);
    }
    printf("\n");
    freeTree(root);
    return 0;
}