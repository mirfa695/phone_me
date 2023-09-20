// void main(){
//
//   List<Map<String,dynamic>>newlist=[
//     {'name':"Arun","age":22},{"name":"Deep","age":45},
//     {"name":"Vipin","age":45}];
//
//   print(newlist);
//   var newOne= newlist.map((e)=>Dummy(name:e["name"],age: e["age"])).toList();
//   print(newOne[0].name);
//   print(newOne);
// }
//
//
// class Dummy{
//   String? name;
//   int? age;
//   Dummy({this.name,this.age});
// }