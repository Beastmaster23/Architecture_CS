#include <stdio.h>
int power(int x, int i){
    int j=0, prev=x;    
    //if(i==0)return 1;

    while(j<i){
        x*=prev;
        j++;
    }
    return x;
}

void fillarray(int x, int a[], int n){
    int i=0;
    while(i<n){
        a[i]=power(x, i);
        i++;
    }
}
void fillarray2(int x, int a[], int n){
    int i=1;
    a[0]=x;
    while(i<n){
        a[i]=a[i-1]*x;
        i++;
    }
}
int compare(int a[], int b[], int n){
    int i=0;
    while(i<n){
        if(a[i]!=b[i])return 0;
        i++;
    }
    return 1;
}

int main(int argc, char const *argv[])
{
    int array[]={5, 4, 3, 2, 1, 7, 8, 9, 6, 10};
    int array2[]={5, 4, 3, 2, 1, 7, 8, 9, 6, 10};
    int i;
    fillarray(3, array, 10);
    fillarray2(3, array2, 10);
    for(i=0;i<10;i++){
        printf("%d ", array[i]);
    }
    printf("\n");
    for(i=0;i<10;i++){
        printf("%d ", array2[i]);
    }
    printf("\n");

    printf("%d\n", compare(array, array2, 10));
    return 0;
}
