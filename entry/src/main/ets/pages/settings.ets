import router from '@ohos.router';


@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State time: number = globalThis.publishtime

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
            Text("软件设置")
              .fontFamily("sans-serif")
              .fontColor("#000000")
              .fontSize(14)
              .fontWeight(500)
              .lineHeight(20)
              .height(40)
              .padding({top:20})
            //设置区
            Column(){
              Flex({direction:FlexDirection.Row}){
                Text("一等座模式（未开启时为二等座）")
                  .fontFamily("sans-serif")
                  .fontColor("#000000")
                  .fontSize(10)
                  .fontWeight(400)
                  .lineHeight(20)
                  .height(40)
                  .flexGrow(1)

                Toggle({ type: ToggleType.Switch, isOn: false })
                  .flexGrow(0)
              }.width("100%").height(40)

              Row(){
                Text("通知时间/分钟")
                  .fontFamily("sans-serif")
                  .fontColor("#000000")
                  .fontSize(10)
                  .fontWeight(400)
                  .lineHeight(20)
                  .height(40)
                  .width(80)

                TextInput({text:globalThis.publishtime})
                  .type(InputType.Number)
                  .onChange((value)=>{
                    this.time=parseInt(value)
                  }).width(80)

                Blank()

                Button("确定修改")
                  .onClick(()=>{globalThis.publishtime=this.time})
                  .backgroundColor("#535a92")
                  .fontColor("ffffff")
              }.width("100%").height(40)

            }

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
          Image("/pages/common/images/info.svg")
          Text("相关信息")
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
        .onClick(()=>router.pushUrl({url:'pages/info'}))

        Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center}){
          Image("/pages/common/images/settings-on.svg")
          Text("软件设置")
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
        .onClick(()=>router.pushUrl({url:'pages/settings'}))
      }
      .width('100%')
      .height(80)
      .flexGrow(0)
    }
    .height('100%')
  }
}