import java.util.ArrayList;
public class Account{

    private String name;
    private double balance;
    private ArrayList<Double> history;

    public Account(String name,double balance){
        this.name=name;
        this.balance=balance;
        history=new ArrayList<>();
    }

    public void deposit(double amt){
        if(amt<=0){
            throw new IllegalArgumentException("Amount must be greater than zero");
        }
        balance+=amt;
        addToHistory(amt);
        System.out.println("Amount deposited successfully");
    }

    public void withdraw(double amt)throws InsufficientFundsException{
        if(amt<=0){
            throw new IllegalArgumentException("Amount to be withdrawn must be greater than zero");
        }
        if(amt>balance){
            throw new InsufficientFundsException("Insufficient Balance.\nAvailable balance is :"+balance);
        }
        balance -= amt;
        addToHistory(-amt);
        System.out.println("withdrawal of "+amt+" done successfully");
    }

    private void addToHistory(double amt){
        if(history.size()==5){
            history.remove(0);
        }
        history.add(amt);
    }

    public void showHistory(){
        System.out.println("\n======== Mini Statement ========");
        if(history.isEmpty()){
            System.out.println("No transactions found");
            return;
        }
        for(double t:history){
            if(t>0)
                System.out.println("Credited:"+t);
            else
                System.out.println("Debited:"+Math.abs(t));
     
        }
        System.out.println("\n======================================");
    }
    
    public double getBalance(){
        return balance;
    }

}
    

