package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	uuid "github.com/satori/go.uuid"

	_ "github.com/mattn/go-sqlite3"
)

func main() {
	var err error

	const dbname = "test.db"

	var db *sql.DB
	if db, err = sql.Open("sqlite3", dbname); err != nil {
		log.Fatal(err)
	}
	defer func() {
		if err = db.Close(); err != nil {
			log.Fatal(err)
		}
	}()

	http.HandleFunc("/", HelloServer)
	if err = http.ListenAndServe(":3000", nil); err != nil {
		log.Fatal(err)
	}
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	if _, err := fmt.Fprintf(w, "Hello, %s!", uuid.NewV4().String()); err != nil {
		log.Fatal(err)
	}
}
