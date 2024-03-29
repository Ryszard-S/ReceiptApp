const receipts = [
  {
    id: 41,
    shop: {
      id: 24,
      name: 'Adidas'
    },
    date: '2022-06-15',
    items: [
      {
        id: 24,
        name: 'dfsg',
        price: '432.43',
        category: {
          id: 22,
          name: 'new'
        }
      }
    ]
  },
  {
    id: 42,
    shop: {
      id: 24,
      name: 'Adidas'
    },
    date: '2022-06-15',
    items: [
      {
        id: 25,
        name: 'dfsg',
        price: '432.43',
        category: {
          id: 22,
          name: 'new'
        }
      },
      {
        id: 26,
        name: 'gfhj1',
        price: '123.00',
        category: {
          id: 23,
          name: 'newcategory'
        }
      },
      {
        id: 27,
        name: 'rteqw',
        price: '234.23',
        category: {
          id: 25,
          name: 'or not !'
        }
      }
    ]
  },
  {
    id: 43,
    shop: {
      id: 101,
      name: 'Douglas'
    },
    date: '2022-06-06',
    items: [
      {
        id: 28,
        name: 'qwert',
        price: '11.11',
        category: {
          id: 22,
          name: 'new'
        }
      },
      {
        id: 29,
        name: 'asdf',
        price: '1234.12',
        category: {
          id: 25,
          name: 'or not !'
        }
      }
    ]
  }
]

const categries = [
  {
    id: 22,
    name: 'new'
  },
  {
    id: 23,
    name: 'newcategory'
  },
  {
    id: 25,
    name: 'or not !'
  }
]
// console.log(receipts, categries)
let x = []
let y = []
categries.forEach((category) => {
  y.push({ name: category.name, sum: 0 })
})
// console.log(y)

//sum of all items in category
receipts.forEach((receipt) => {
  receipt.items.forEach((item) => {
    y.forEach((category) => {
      if (item.category.name === category.name) {
        category.sum += +item.price
      }
    })
  })
})
console.log(y)

let z = (rec, cat) => {
  let y = []
  cat.forEach((category) => {
    y.push({ name: category.name, sum: 0 })
  })
  rec.forEach((receipt) => {
    receipt.items.forEach((item) => {
      y.forEach((category) => {
        if (item.category.name === category.name) {
          category.sum += +item.price
        }
      })
    })
  })
  return y
}

// console.log('z', z(receipts, categries))

// Generate rgba random color for each category
let colors = []
categries.forEach((category) => {
  colors.push(`rgba(${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, 0.5)`)
})
console.log(colors)

const rndClr = () => `rgba(${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, 0.5)`

const qwe = categries.map(() => rndClr())
console.log(qwe)

let arr = ['Ala', 'Maciek', 34, 'Tadek', 'Mbrcia', 'Marcia', 1.32]
console.log(arr.sort())

const arr3 = [
  { name: 'new', sum: 875.97 },
  { name: 'newcategory', sum: 123 },
  { name: 'a;q', sum: 234.23 },
  { name: 'or not !', sum: 1468.35 }
]

// sort arr3 by sum
arr3.sort((a, b) => a.sum - b.sum)
console.log(arr3)
// sort arr3 by name
arr3.sort((a, b) => a.name.localeCompare(b.name))
console.log(arr3)

// sort arr3 by name or sum
arr3.sort((a, b) => {
  if (a.name === b.name) {
    return a.sum - b.sum
  } else {
    return a.name.localeCompare(b.name)
  }
}
)
console.log(arr3)

