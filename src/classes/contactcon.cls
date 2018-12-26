public class contactcon {

public contact con{get; set;}
public boolean diplayblock{get; set;}
public contactcon(){
//con= new contact(lastname='3456');
con = [select id, lastname from contact limit 1];
diplayblock=false;
}
public pageReference getclickme(){
diplayblock=true;
return null;
}
}