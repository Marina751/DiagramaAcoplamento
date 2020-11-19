import java.util.List;

public class Fretista extends Usuario {
    // atributos
    public List<Veiculo> veiculos;

    // metodos
    public void adicionarVeiculo(Veiculo newVeiculo) {
        veiculos.add(newVeiculo);
    }
}
