import router from '@ohos.router';


@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Flex({direction:FlexDirection.Column}) {
      Stack() {
        Flex({direction:FlexDirection.Column}){
          //顶部标题
          Flex({alignItems:ItemAlign.Center}){
            Text("CR列车时刻表")
              .padding({left:16})
              .fontFamily("sans-serif")
              .fontColor("#ffffff")
              .fontSize(24)
              .fontWeight(500)
              .lineHeight(32)
              .height(40)
          }
          .flexGrow(0)
          .height(80)
          .width("100%")
          //主要内容容器
          Flex({direction:FlexDirection.Column}){
            Text("相关信息")
              .fontFamily("sans-serif")
              .fontColor("#000000")
              .fontSize(14)
              .fontWeight(500)
              .lineHeight(20)
              .height(40)
              .padding({top:20})
            //内容文档
            Flex({direction:FlexDirection.Column}){
              Scroll(){
                Column(){
                  Text("如何使用本软件（服务卡片）")
                    .fontColor("#000000")
                    .fontFamily("sans-serif")
                    .fontSize(16)
                    .lineHeight(20)
                    .fontWeight(500)
                    .textAlign(TextAlign.Start)
                    .width("100%")

                  Text("1.在列车情报页面输入出发车站和到达车站，点击设置保存当前车站设置并更新服务卡片。右侧转换按钮可以切换始发终到站。")
                    .fontColor("#000000")
                    .fontFamily("sans-serif")
                    .fontSize(12)
                    .lineHeight(16)
                    .fontWeight(400)
                    .width("100%")
                    .textAlign(TextAlign.Start)
                    .margin({top:8})
                  Text("2.服务卡片信息中左侧的颜色条表示列车剩余的座位数，绿色表示座位有大量空余，橙色表示座位紧张，红色表示暂无余座。该座位数只会统计设置中座席等级的座位数，例如在设置中设置为二等座，则只统计二等座的数量，请根据您所购买的定期/定次票的种类在设置中进行设定。服务卡片中右侧的按钮可以切换出发和终点站。")
                    .fontColor("#000000")
                    .fontFamily("sans-serif")
                    .fontSize(12)
                    .lineHeight(16)
                    .fontWeight(400)
                    .width("100%")
                    .textAlign(TextAlign.Start)
                    .margin({top:8})
                  Text("3.由于目前国铁定次/定期票仅支持高速铁路列车，故列车信息中仅显示列车种别为G/C，D和S的列车。 右边的倒计时显示的是目前距发车的剩余时间，请在合理估计进站检票时间后选择预乘坐的列车。")
                    .fontColor("#000000")
                    .fontFamily("sans-serif")
                    .fontSize(12)
                    .lineHeight(16)
                    .fontWeight(400)
                    .width("100%")
                    .textAlign(TextAlign.Start)
                    .margin({top:8})

                  Text("关于国铁列车")
                    .fontColor("#000000")
                    .fontFamily("sans-serif")
                    .fontSize(16)
                    .lineHeight(20)
                    .fontWeight(500)
                    .textAlign(TextAlign.Start)
                    .width("100%")
                    .margin({top:16})

                  Text("1.关于不同列车种别：G字头列车通常为长途快速列车运行速度在300km/h以上，由于国铁会优先售卖长途票，故该种别列车座席会较为紧张；C字头列车为短途城际列车，停站多，速度在200km/h左右，由于该种别列车车次多且仅服务小范围都市圈，故常有余席；D字头列车为低速长途高速铁路，速度和停车站与C字头列车相似，但行程较长故也易于出现座席紧张的问题；S字头列车为国铁在部分城市圈设置的通勤专用列车，这些列车有固定的停车站和时间，不售卖普通车票也不在时刻表内显示。乘坐这些列车请至查询当地时间表。")
                    .fontColor("#000000")
                    .fontFamily("sans-serif")
                    .fontSize(12)
                    .lineHeight(16)
                    .fontWeight(400)
                    .width("100%")
                    .textAlign(TextAlign.Start)
                    .margin({top:8})
                  Text("2.关于定期/定次票：12306提供定期/定次票的购买服务，购买后有效期内乘坐满足条件的列车无需购票，直接身份证或其他有效证件进检票口后系统会自动分配剩余的座位并将座位号发至提前登记的手机号。")
                    .fontColor("#000000")
                    .fontFamily("sans-serif")
                    .fontSize(12)
                    .lineHeight(16)
                    .fontWeight(400)
                    .width("100%")
                    .textAlign(TextAlign.Start)
                    .margin({top:8})

                }
                .width("100%")
                .backgroundColor("fbf8ff")
                .borderRadius(24)
                .margin({top:16})
                .padding(16)

              }
              .width("100%")
              .height("100%")
              .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
              .scrollBar(BarState.On) // 滚动条常驻显示
              .scrollBarColor(Color.Gray) // 滚动条颜色
              .scrollBarWidth(8) // 滚动条宽度
              .edgeEffect(EdgeEffect.Spring)
            }
            .flexGrow(1)
            .width("100%")
            .margin({top:8})




          }
          .backgroundColor("#EFEDF4")
          .width("100%")
          .flexGrow(1)
          .borderRadius({topLeft:24,topRight:24})
          .padding({left:16,right:16})
        }
        .height("100%")
        .width("100%")

      }
      .width('100%')
      .flexGrow(1)
      .backgroundColor("#535A92")


      //底部菜单栏
      Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceEvenly,alignItems:ItemAlign.Center}){
        Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center}){
          Image("/pages/common/images/tram.svg")
          Text("列车情报")
            .fontFamily("sans-serif")
            .fontColor("#5B5D72")
            .fontSize(14)
            .fontWeight(500)
            .lineHeight(20)
            .textAlign(TextAlign.Center)
            .height(40)
        }
        .width(60)
        .height(60)
        .onClick(()=>router.pushUrl({url:'pages/Index'}))

        Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center}){
          Image("/pages/common/images/info-on.svg")
          Text("相关信息")
            .fontFamily("sans-serif")
            .fontColor("#535A92")
            .fontSize(14)
            .fontWeight(500)
            .lineHeight(20)
            .textAlign(TextAlign.Center)
            .height(40)
        }
        .width(60)
        .height(60)
        .onClick(()=>router.pushUrl({url:'pages/info'}))

        Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center}){
          Image("/pages/common/images/settings.svg")
          Text("软件设置")
            .fontFamily("sans-serif")
            .fontColor("#5B5D72")
            .fontSize(14)
            .fontWeight(500)
            .lineHeight(20)
            .textAlign(TextAlign.Center)
            .height(40)
        }
        .width(60)
        .height(60)
        .onClick(()=>router.pushUrl({url:'pages/settings'}))
      }
      .width('100%')
      .height(80)
      .flexGrow(0)
    }
    .height('100%')
  }
}