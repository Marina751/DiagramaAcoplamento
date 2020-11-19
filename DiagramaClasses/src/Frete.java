import java.util.ArrayList;
import java.util.List;

public class Frete {
    // atributos
    private Localizacao localOrigem, localDestino, localAtual;
    private StatusFrete statusFrete;
    private List<Produto> produtos = new ArrayList<>();

    // construtor
    public Frete() {
        this.statusFrete = StatusFrete.AGUARDANDO_CONFIRMACAO;
    }

    // metodos
    public void adicionarProduto(Produto produto) {
        this.produtos.add(produto);
    }

    public void removerProduto(Produto produto) {
        this.produtos.remove(produto);
    }

    public void setStatusFrete(StatusFrete statusFrete) {
        this.statusFrete = statusFrete;
    }

    public StatusFrete getStatusFrete() {
        return this.statusFrete;
    }
}
