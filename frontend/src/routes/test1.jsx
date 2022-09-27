import React, { useEffect } from 'react'

const Test1 = () => {
  useEffect(() => {
    console.log(process.env.REACT_CHECK)
    const x = Boolean(Number(process.env.REACT_CHECK))
    console.log(typeof x, x)
  }, [])
  return (
    <div>
      Test1
      <h1>This is test One !</h1>
    </div>
  )
}

export default Test1
