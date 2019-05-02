package main

import (
	"log"
	"net/http"

	"github.com/go-chi/chi"
)

func main() {
	log.Println("Service started")
	r := chi.NewRouter()
	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("welcome"))
	})
	http.ListenAndServe(":3000", r)
}
