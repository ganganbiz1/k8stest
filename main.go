package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	// echoのインスタンスを生成
	e := echo.New()

	// ミドルウェアを設定
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, `ok`)
	})
	e.GET("/test", func(c echo.Context) error {
		return c.String(http.StatusOK, `testOK`)
	})
	// サーバーをポート番号指定で起動
	e.Logger.Fatal(e.Start(":80"))
}
