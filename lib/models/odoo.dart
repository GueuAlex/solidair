import 'package:odoo/odoo.dart';

class OdooInit {
  final odoo = Odoo(
    Connection(
      url: Url(Protocol.http, "194.163.136.227", 8079),
      db: 'solidair',
    ),
  );

  login() async {
    print('object');
    //print(await odoo.session.stream.length);
    UserLoggedIn user = await odoo.connect(Credential("solidair", "solidair"));
    print(user.name);
    print(user.name);
    String tableName = "res.users";
    int id = 1;
    await odoo.read(tableName, id);
    //print(odoo.)
  }
}
