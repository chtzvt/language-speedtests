package main

import (
    "fmt"
)

func main() {
    prime := 600851475143
    i := 2

    for i <= prime {
        if prime%i == 0 {
            prime = prime / i
            i = i - 1
        }
        i += 1
    }

    fmt.Println(i)
}
