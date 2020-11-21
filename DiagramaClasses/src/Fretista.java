import java.util.*;

public class Fretista extends PessoaFisica {//Usuario {
    // atributos
    // o que um fretista tem que um cliente nao tem?
    public final List<Veiculo> veiculos = new ArrayList<>();

    public Localizacao atualLocalizacao;
    public final Calendar nascimento;
    public final String cnh, sobrenome;
    public String cidade, bairro;

    public Fretista(int dia, int mes, int ano, String cnh, String sobrenome, String cidade, String bairro) {
        this.nascimento = new GregorianCalendar(ano, mes, dia);
        this.sobrenome = sobrenome;
        this.cidade = cidade;
        this.bairro = bairro;
        this.cnh = cnh;
    }
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

    // o que podemos fazer com o fretista?
    public long getQtdFretesConcluidos() {
        return this.fretes.stream().
                filter(f -> f.getStatusFrete().equals(StatusFrete.CONCLUIDO)).count();
    }
}
