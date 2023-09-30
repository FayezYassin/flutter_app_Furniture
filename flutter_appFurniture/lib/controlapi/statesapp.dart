import 'package:flutter_appltessst/models/Storemodel.dart';
import 'package:flutter_appltessst/models/Salamodel.dart';

abstract class Statesapp {}

class Initoapp extends Statesapp {}

class getdatsucsse extends Statesapp {}

class getdataerror extends Statesapp {}

class getdataloading extends Statesapp {}

//////////////////////   login ////////
///
class changeispassowrdstat extends Statesapp {}

class Logihnsucsse extends Statesapp {}

class Loginerror extends Statesapp {}

class Loginloading extends Statesapp {}

////////////////////////  hall /////////////////

class addhall extends Statesapp {}

class delethall extends Statesapp {}

class updathallstat extends Statesapp {}

class errorhall extends Statesapp {}

/////////////////////////  search hall  /////////

class loadinghall extends Statesapp {}

class sucssesfulysearch extends Statesapp {
   sucssesfulysearch();
}

class errorsearch extends Statesapp {}

/////////////////////////  search Stor  /////////

class addstorstat extends Statesapp {}

class deletestorstat extends Statesapp {}

class updatstorstat extends Statesapp {}

class errorstor extends Statesapp {}

class sucssesfulysearchstor extends Statesapp {
  List<Storemodel> search = [];
  sucssesfulysearchstor({required this.search});

}

class loadbeststor_stat extends Statesapp {}

class successflybeststor_stat extends Statesapp {}

class errorstor_stat extends Statesapp {}




