/**
 * @author Afli  Ramzi
 * @noteapi les  classes pour le  mapping
 */

class Medication {
      int id=0;
         String  name="" ;
       String  description="" ;
       String scheduleList  = ""  ;


     Medication( int  id ,String  name , String description  ,String schedule) {
       this.id=id;
       this.name=name ;
      this.description=description  ;
      this.scheduleList=schedule ;
     }

     String get  _name =>  name ;
     String get  _description => description ;
     String  get _schedule =>scheduleList  ;
      set _name(String name)  {
       this.name=name ;
     }
       set _description(String description)  {
        this.description=description ;
      }

       set _schedule( String schedule)  {
        this.scheduleList=schedule ;
      }
set _i(int id ) {
        this.id=id ;
}



    }
List<Medication> timedUpMedicaiton(List<Medication> medications) {
  List<Medication> med=[];
  medications.forEach((element) {
    if (element._schedule==DateTime.now()){
      med.add(element);
      }
  });
  return med;
}


//cette  methode pour  generalise  la format du date sur  24 hrs pas sur 12 hrs


int  timeConverter(String  time ){
  String x=time[time.length-2]+time[time.length-1] ;
  int  hrs=0 ;
  if(x=="PM" && time[1]!=":") {
    hrs=int.parse(time[0]+time[1]) +12 ;
  }else if (x=="PM" && time[1]==":"){
    hrs=int.parse(time[0]) +12 ;
  }else if (x=="AM" && time[1]!=":") {
    hrs = int.parse(time[0]+time[1]) ;
  }else if (x=="AM" && time[1]==":") {
    hrs=int.parse(time[0]) ;
  }
  return hrs ;
}
