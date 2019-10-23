#include <iostream>
 
using namespace std;
 
class Retangulo {
    private:
        int largura, comprimento;
    public:
        Retangulo();
        Retangulo(int c, int l);
     
        int getLarg();
        int getComp();
        void setLarg(int l);
        void setComp(int c);
        bool is_valid(int c, int l);
     
        int area();
        int perimetro();
        bool isQuad();
        void matrix(char borda[], char preenchimento[]);
 
};

// ****BUILD*****//
Retangulo::Retangulo(){
    this->largura = 1;
    this->comprimento = 1;
}
Retangulo::Retangulo(int c, int l){
    if(is_valid(c, l)){
        this->largura = l;
        this->comprimento = c;
    }
    else{
        this->largura = 1;
        this->comprimento = 1;
    }
}

// ****GET*****//
int Retangulo::getLarg(){
    return largura;
}
int Retangulo::getComp(){
    return comprimento;
}

// ****SET*****//
void Retangulo::setComp(int c){
    this->comprimento = c;
}
void Retangulo::setLarg(int l){
    this->largura = l;
}

//****VALIDAR*****//
bool Retangulo::is_valid(int c, int l){
    return (c>=0 && c<=20 && l>=0 && c<=20);
}

//****CÁLCULOS*****//
int Retangulo::area(){
    int a = largura;
    int b = comprimento;
 
    return a*b;
}
int Retangulo::perimetro(){
    int a = largura;
    int b = comprimento;
 
    return 2*(a + b);
}
bool Retangulo::isQuad(){
    int a = largura;
    int b = comprimento;
 
    return a == b;
}

//****MATRIX*****//
void Retangulo::matrix(char borda[], char preenchimento[]){
    int lin = largura;
    int col = comprimento;
 
    for(int i=0; i<lin; i++){
        for(int j=0; j<col; j++){
            if(i == 0 || j == 0 || i == lin-1 || j == col-1)
                cout << borda[0];
            else cout << preenchimento[0];
        }
        cout << endl;
    }
}
 
/* TESTE */

int main() {
   
    int c, l;
 
    Retangulo ret;
    cout << "Comp. inicial = " << ret.getComp() << endl;
    cout << "Larg. inicial = " << ret.getLarg() << endl;
 
    cout << endl;
    cout << "Digite um  comp.: "; cin >> c;
    cout << "Digite uma larg.: "; cin >> l;
 
    while(!ret.is_valid(c, l)){
        cout << "Escreva novamente" << endl;
        cout << "Digite um  comp.: "; cin >> c;
        cout << "Digite uma larg.: "; cin >> l;
    }
    cout << endl;

    ret.setLarg(l); 
    ret.setComp(c);
 
    cout << "Comp atual = " << ret.getComp() << endl;
    cout << "Larg atual = " << ret.getLarg() << endl;
 
    if(ret.isQuad())
        cout << "Sim, eh um QUADRADO" << endl;
    else cout << "Não eh um QUADRADO" << endl;
 
    cout << "Area = " << ret.area() << " perimetro = " << ret.perimetro() << endl << endl;
 
    char borda[3], preenchimento[3], op[3];
    cout << "Digite char da borda: "; cin >> borda;
    cout << "Preencher a matrix [Y/n]: "; cin >> op;
 
    if(op[0] == 'Y'){
        cout << "Digite char do preenchimento: "; cin >> preenchimento;
    }else preenchimento[0] = ' ';
 
    cout << endl << endl;

    ret.matrix(borda, preenchimento);

    cout << endl << endl;
 
    cout << "Digite outra larg.: "; cin >> l;
    cout << "Digite outro comp.: "; cin >> c;
   
    Retangulo ret2(c, l);
    cout << "Comp2 ret2 = " << ret2.getComp() << endl;
    cout << "Larg2 ret2 = " << ret2.getLarg() << endl;

    if(ret.isQuad())
        cout << "Sim, eh um QUADRADO" << endl;
    else cout << "Nao eh um QUADRADO" << endl;
 
 
  return 0;
}