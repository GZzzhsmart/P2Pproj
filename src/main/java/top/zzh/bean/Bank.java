package top.zzh.bean;

public class Bank {

    private Long id;
    private String bankName;
    private String deposit;


    public Bank() {
    }

    public Bank(Long id, String bankName, String deposit) {
        this.id = id;
        this.bankName = bankName;
        this.deposit = deposit;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getDeposit() {
        return deposit;
    }

    public void setDeposit(String deposit) {
        this.deposit = deposit;
    }
}
