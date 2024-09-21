<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

<!-- https://youtu.be/c2M-rlkkT5o?t=2292 -->
<!-- https://chatgpt.com/c/66ec7f5d-9be0-8003-b191-2caf5254ee87 -->

# ***Comparison Operators en MongoDB***

Los operadores son con $

Insertamos datos

db.students.insertOne({"name": "Spongebob", age: 30, gpa: 3.2})

db.students.insertMany([
  {name: "Patrick", age: 38, gpa: 1.5},
  {name: "Sandy", age: 27, gpa: 4.0},
  {name: "Gary", age: 18, gpa: 2.5}
])

db.students.insertOne(
    {
        name: "Larry",
        age: 32,
        gpa: 2.8,
        fullTime: false,
        register: new Date(),
        graduationDate: null,
        courses: ["Biology", "Chemistry", "Calculus"],
        address: {
                    street: "123. Fake St.",
                    city: "Bikini Bottom",
                    zip: 1234
                 }
    }
)

ahora si

$ne hace

school> db.students.find({name: {$ne: "Spongebob"}})
[
  {
    _id: ObjectId('66ef1df4485b3d91eb964039'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb96403a'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb96403b'),
    name: 'Gary',
    age: 18,
    gpa: 2.5
  },
  {
    _id: ObjectId('66ef1dfe485b3d91eb96403c'),
    name: 'Larry',
    age: 32,
    gpa: 2.8,
    fullTime: false,
    register: ISODate('2024-09-21T19:26:54.025Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123. Fake St.', city: 'Bikini Bottom', zip: 1234 }
  }
]

$lt

school> db.students.find({age: {$lt: 20}})
[
  {
    _id: ObjectId('66ef1df4485b3d91eb96403b'),
    name: 'Gary',
    age: 18,
    gpa: 2.5
  }
]

$lte

school> db.students.find({age: {$lte: 27}})
[
  {
    _id: ObjectId('66ef1df4485b3d91eb96403a'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb96403b'),
    name: 'Gary',
    age: 18,
    gpa: 2.5
  }
]

$gt
school> db.students.find({age: {$gt: 27}})
[
  {
    _id: ObjectId('66ef1def485b3d91eb964038'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb964039'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5
  },
  {
    _id: ObjectId('66ef1dfe485b3d91eb96403c'),
    name: 'Larry',
    age: 32,
    gpa: 2.8,
    fullTime: false,
    register: ISODate('2024-09-21T19:26:54.025Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123. Fake St.', city: 'Bikini Bottom', zip: 1234 }
  }
]

$gte

school> db.students.find({age: {$gte: 27}})
[
  {
    _id: ObjectId('66ef1def485b3d91eb964038'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb964039'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb96403a'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  },
  {
    _id: ObjectId('66ef1dfe485b3d91eb96403c'),
    name: 'Larry',
    age: 32,
    gpa: 2.8,
    fullTime: false,
    register: ISODate('2024-09-21T19:26:54.025Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123. Fake St.', city: 'Bikini Bottom', zip: 1234 }
  }
]

dobla condicion

school> db.students.find({gpa: {$gte: 3, $lte: 4}})
[
  {
    _id: ObjectId('66ef1def485b3d91eb964038'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb96403a'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  }
]

$in

school> db.students.find({name: {$in: ["Spongebob", "Patrick", "Sandy"]}})
[
  {
    _id: ObjectId('66ef1def485b3d91eb964038'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb964039'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb96403a'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  }
]

$nin

school> db.students.find({name: {$nin: ["Spongebob", "Patrick", "Sandy"]}})
[
  {
    _id: ObjectId('66ef1df4485b3d91eb96403b'),
    name: 'Gary',
    age: 18,
    gpa: 2.5
  },
  {
    _id: ObjectId('66ef1dfe485b3d91eb96403c'),
    name: 'Larry',
    age: 32,
    gpa: 2.8,
    fullTime: false,
    register: ISODate('2024-09-21T19:26:54.025Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123. Fake St.', city: 'Bikini Bottom', zip: 1234 }
  }
]
