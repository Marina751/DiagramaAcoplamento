import java.util.List;

public class Fretista extends Usuario {
    // atributos
    public List<Veiculo> veiculos;
    public List<Frete> fretes;

    // metodos
    public void adicionarVeiculo(Veiculo newVeiculo) {
        veiculos.add(newVeiculo);
    }
}
