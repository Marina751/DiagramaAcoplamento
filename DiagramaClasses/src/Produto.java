public class Produto {
    // atributos
    public CategoriaProduto categoria;
    public final int largura, altura, comprimento;
    public final double peso;

    // construtor
    public Produto(int largura, int altura, int comprimento,
                   double peso, CategoriaProduto categoria) {

        this.largura = largura;
        this.altura = altura;
        this.comprimento = comprimento;
        this.categoria = categoria;
        this.peso = peso;
    }

    // metodos
    public double getVolume() {
        return (largura * altura * comprimento);
    }
    // ...
}
