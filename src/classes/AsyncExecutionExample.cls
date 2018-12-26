public class AsyncExecutionExample implements Queueable {
    string accName ='';
    public AsyncExecutionExample(string accountname){
        this.accName=accountname;
    }
    
     public void execute(QueueableContext context) {
          Account a = new Account(Name=accName,Phone='(415) 556-1212');
          insert a; 
     }
}