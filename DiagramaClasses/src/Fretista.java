import java.util.ArrayList;
import java.util.List;

public class Fretista extends Usuario {
    // atributos
    public List<Veiculo> veiculos = new ArrayList<>();
    public List<Frete> fretes = new ArrayList<>();
    //public int qtdFretesConcluidos;

    //public Fretista() {
      //  this.qtdFretesConcluidos = 0;
    //}

    // metodos
    public void adicionarVeiculo(Veiculo newVeiculo) {
        veiculos.add(newVeiculo);
    }

    public void removerVeiculo(Veiculo veiculo) {
        veiculos.remove(veiculo);
    }
    public void novoFrete(Frete frete) {
        fretes.add(frete);
    }

    public long getQtdFretesConcluidos() {
        /*
        int quantidade = 0;

        for (Frete frete : fretes) {
            if (frete.getStatusFrete().equals(StatusFrete.CONCLUIDO))
                quantidade++;
        }

        return quantidade;
        // /*
        while (itr.hasNext()) {
            if (itr.next().getStatusFrete().equals(StatusFrete.CONCLUIDO))
                quantidade++;
        }

        */
        return this.fretes.stream().filter(f -> f.getStatusFrete().equals(StatusFrete.CONCLUIDO)).count();
        // */
    }
}
