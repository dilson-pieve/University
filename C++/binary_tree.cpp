#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ELEM 20 //add binary tree

typedef struct no{
	int elem;
	struct no *left, *right;
}noArv;

/* procura valor */

int search(noArv *r, int valor) {
	if(r==NULL){
		printf("\nnot found\n");
		return 0;
	}else{
		if(valor < r->elem)
			search(r->left,valor);
		else{
			if(valor > r->elem)
				search(r->right,valor);
			else{
				printf("\n#found\n");
				return r->elem;
			}
		}
	}

}

/* altura da árvore */

int height(noArv *n){
	if(n==NULL){
		return -1;
	}
	int l = height(n->left);
	int r = height(n->right);
	
	if( l > r) 
		 return (l+1);
	else return (r+1);
}

/* nó menor valor */

noArv *minValor(noArv *r) {
	noArv *atual = r;

	while(atual->left!=NULL)
		atual=atual->left;
	return atual;
}

/* remove valor */

noArv *remover(noArv *r, int valor) {
	if(r==NULL){
		return r;
	}else{
		if(valor < r->elem)
			r->left = remover(r->left,valor);
		else{
			if(valor > r->elem){
				r->right = remover(r->right,valor);
			}else{
				if(r->left == NULL){
					noArv *aux = r->right;
					free(r);
					return aux; 
				}else{
						if(r->right==NULL){
							noArv *aux = r->left;
							free(r);
							return aux;
						}
		
				}						
				noArv *temp = minValor(r->right);
				r->elem = temp->elem;
				r->right= remover(r->right, temp->elem);
			}
		} 
	}
	return r;
}

/* insere */

noArv *insere(noArv *r, int valor){
	if(r==NULL){
		noArv *novo = (noArv *) malloc(sizeof(noArv));
		novo->elem = valor;
		novo->left = NULL;
		novo->right= NULL;
		return novo;
	}else{
		if(valor < r->elem)
			r->left = insere(r->left,valor);
		else
			if(valor > r->elem)
				r->right = insere(r->right,valor);
	}
	return r;
}

void menu(){
	printf("1)REMOVE:\n");
	printf("2)SEARCH:\n");
	printf("3)HEIGHT:\n");
	printf("4)inOrdem:\n");
	printf("5)preOrdem:\n");
	printf("6)posOrdem:\n");
	printf("7)OUT:\n");
}

/* percorrer e mostrar elementos árvore */

void inOrdem(noArv *r){
	if(r!=NULL){
		inOrdem(r->left);
		printf("%d ", r->elem);
		inOrdem(r->right);
	}
}
void preOrdem(noArv *r){
	if(r!=NULL){
		printf("%d ", r->elem);
		preOrdem(r->left);
		preOrdem(r->right);
	}
}
void posOrdem(noArv *r){
	if(r!=NULL){
		posOrdem(r->left);
		posOrdem(r->right);
		printf("%d ", r->elem);
	}
}

/* criar teste */

int main(){

	int aux,i,op;
	srand(time(NULL));

	noArv *root = NULL;
	
	//random 
	
	for(i=0; i<ELEM; i++){
		aux = rand()%100;
		root = insere(root,aux);
	}
	
	printf("\n");
	inOrdem(root);
	printf("\n");
	
	while(op!=7){
		printf("\n");
		menu();

		printf("\nChoose:");
		scanf("%d",&op);
		
		if(op==0) break;

		switch(op){
			case 1:
				printf("\nDelete:");
				scanf("%d",&aux);
				root = remover(root,aux);
			break;
			case 2:
				printf("\nFind:");
				scanf("%d",&aux);
				printf(" %d\n", search(root,aux));
			break;
			case 3:
				printf("Height = %d\n",height(root));
			break;
			case 4:
				inOrdem(root); printf("\n");
			break;
			case 5:
				preOrdem(root); printf("\n");
			break;
			case 6:
				posOrdem(root);	printf("\n");
			break;
		}
	}
	

	return 0;
}