
let path=require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const CleanWebpackPlugin = require('clean-webpack-plugin')
module.exports={
    entry:'./src/index.js',       //入口
    output:{
        filename:'build.[hash:8].js',       //文件名  
        path:path.resolve('./build')     //打包的路径  （绝对路径）
    },      //出口
    devServer:{
        contentBase:'./build',
        port:3000,
        compress:true,//服务器压缩
        open:true       //自动打开
    },   //开发服务器
    module:{},      //模块配置
    plugins:[
        new CleanWebpackPlugin(['./build']),
        //打包HTML插件
        new HtmlWebpackPlugin({
            template:'./src/index.html',
            title:'hahahah',
            hash:true,      //JS后面带上一段数字  （清空缓存）
          /*   minify:{
                removeAttributeQuotes:true,      //删除双引号
                collapseWhitespace :true         //删掉空行（变成一行）
            } */
        })
    ],     //插件配置
    mode:'development',         //可以更改模式
    resolve:{}      //配置解析
    
}