package main

import (
	"bufio"
	"log"
	"os"
)

func main() {
	log.SetFlags(0)

	f, err := os.Open("data/05")
	if err != nil { log.Fatal(err) }
	defer f.Close()

	scanner := bufio.NewScanner(f)
	for scanner.Scan() {
		line := scanner.Text()
		log.Println(line)
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
}
