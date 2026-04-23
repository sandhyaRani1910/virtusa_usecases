import java.util.Scanner;

public class MainApp {
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("\n======welcome to FinSafe-your personal Finance Manager======");
        System.out.println("\nEnter name of account holder : ");
        String name=sc.nextLine();
        System.out.println("Enter initial balance : ");
        double bal=sc.nextDouble();
        Account acc=new Account(name,bal);
        System.out.println("Successfully created account for "+name);
        System.out.println("\n------------------------------------");
        while(true){
            System.out.println("select an option from the below list:");
            System.out.println("--------------------------------------");
            System.out.println("1.Deposit Amount\n2.Withdraw Amount\n3.show Transaction History\n4.Check current Balance\n5. To Exit");
            System.out.print("Enter your Choice: ");
            int choice=sc.nextInt();
            System.out.println("--------------------------------------");
            try{
                switch(choice){
                    case 1:
                        System.out.print("Enter Amount to deposit: ");
                        acc.deposit(sc.nextDouble());
                        System.out.println("\n--------------------------------------");
                        break;
                     case 2:
                        System.out.println("Enter Amount to withdraw: ");
                        acc.withdraw(sc.nextDouble());
                        System.out.println("\n--------------------------------------");
                        break;
                    case 3:
                        acc.showHistory();
                        break;
                    case 4:
                        System.out.println("Your current Balance is:"+acc.getBalance());
                        System.out.println("\n--------------------------------------");
                        break;
                    case 5:
                        System.out.println("Exited successfully");
                        System.out.println("Thank you for using FinSafe");
                        return;
                    default:
                        System.out.println("wrong choice! please enter a correct option");
                    
                }
            }catch(InsufficientFundsException e){
                System.out.println(e.getMessage());

            }catch(IllegalArgumentException e){
                System.out.println(e.getMessage());
            }
            catch(Exception e){
                System.out.println("Error occurred");
            }
        }
    }    
}