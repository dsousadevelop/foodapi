package router

import (
	"github.com/gin-gonic/gin"
)

func Gerar() *gin.Engine {
	r := gin.Default()
	return r
}
