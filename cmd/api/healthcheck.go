package main

import (
	"net/http"
)

func (app *application) healthCheck(w http.ResponseWriter, req *http.Request) {
	env := envelope{
		"status":      "available",
		"environment": app.config.env,
		"version":     version,
	}

	err := app.writeHttpRespJson(w, http.StatusOK, env, nil)
	if err != nil {
		app.serverErrorResponse(w, req, err)
	}
}
