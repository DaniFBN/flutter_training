// Type1 typeWithoutScope = Type2();

// String? whatever;

// void dartPromotion() {
//   Type1 type = Type2();

//   final a = whatever;
//   if (a != null) {
//     print(a + '');
//   }

//   // void subMethod() {
//   //   if (type is Type2) {
//   //     type.type2();
//   //   } else if (type is Type3) {
//   //     type.type3();
//   //   }
//   // }

//   if (type is Type2) {
//     type.type2();
//   } else if (type is Type3) {
//     type.type3();
//   }

//   if (typeWithoutScope is Type2) {
//     typeWithoutScope.type2();
//   } else if (type is Type3) {
//     typeWithoutScope.type3();
//   }

//   if (typeWithoutScope is Type2) {
//     (typeWithoutScope as Type2).type2();
//   } else if (typeWithoutScope is Type3) {
//     // Da erro porque ta fora do escopo
//     // typeWithoutScope.type3();
//   }

//   final type2 = typeWithoutScope;
//   if (type2 is Type2) {
//     type2.type2();
//   } else if (type2 is Type3) {
//     type2.type3();
//   }

//   switch (type) {
//     case Type2():
//       type.type2();
//     case Type3():
//       type.type3();
//   }
// }

// abstract interface class Type1 {
//   void type1() {}
// }

// class Type2 extends Type1 {
//   void type2() {
//     print('type2');
//   }
// }

// class Type3 extends Type1 {
//   void type3() {
//     print('type3');
//   }
// }
