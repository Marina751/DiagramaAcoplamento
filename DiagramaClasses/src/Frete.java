import java.util.List;

public class Frete {
    // atributos
    public Localizacao localOrigem, localDestino, localAtual;
    public StatusFrete statusFrete;
    public List<Produto> produtos;

    // metodos
    public void setStatusFrete(StatusFrete statusFrete) {
        this.statusFrete = statusFrete;
    }

    public StatusFrete getStatusFrete() {
        return statusFrete;
    }
}
