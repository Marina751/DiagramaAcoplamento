import java.util.ArrayList;
import java.util.List;

public class Fretista extends Usuario {
    // atributos
    // o que um fretista tem que um cliente nao tem?
    public List<Veiculo> veiculos = new ArrayList<>();
    public List<Frete> fretes = new ArrayList<>();
    /*
    public List<ClienteAntigo> clienteAntigo = new ArrayList<>();
    public List<ClienteBloqueado> clienteBloqueado = new ArrayList<>();
    */
    // metodos
    // o que o fretista pode fazer?
    public void adicionarVeiculo(Veiculo newVeiculo) {
        veiculos.add(newVeiculo);
    }
    public void removerVeiculo(Veiculo veiculo) {
        veiculos.remove(veiculo);
    }
    public void aceitarFrete(Frete frete) {
        fretes.add(frete);
    }
    /*
    public void bloquearClienteAntigo(ClienteBloqueado clienteBloqueado) {
        clientebloqueado.add(clienteBloqueado);
        clienteAntigo.remove(clienteBloqueado);
    }
    */
    // o que podemos fazer com o fretista?
    public long getQtdFretesConcluidos() {
        /* Solucao 1:

        int quantidade = 0;
        for (Frete frete : fretes) {
            if (frete.getStatusFrete().equals(StatusFrete.CONCLUIDO))
                quantidade++;
        }

        Solucao 2:
        Iterator<Frete> itr = fretes.iterator();
        while (itr.hasNext()) {
            if (itr.next().getStatusFrete().equals(StatusFrete.CONCLUIDO))
                quantidade++;
        }*/

        // Solucao 3:
        return this.fretes.stream().filter(f -> f.getStatusFrete().equals(StatusFrete.CONCLUIDO)).count();
    }
}
