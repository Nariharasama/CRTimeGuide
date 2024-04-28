import router from '@ohos.router';
import formProvider from '@ohos.app.form.formProvider';
import formBindingData from '@ohos.app.form.formBindingData';

@Component
@Entry
struct Index {
  @State StartStation:string="Nan";
  @State EndStation:string="Nan";
  update(){
    globalThis.startstation=this.StartStation;
    globalThis.endstation=this.EndStation;
    if(globalThis.formId!==undefined&&globalThis.formId!=="0"){
      let formData = {
        "StartStation":globalThis.startstation,
        "EndStation":globalThis.endstation,// 和卡片布局中对应
      };
      let formMsg = formBindingData.createFormBindingData(formData)
      formProvider.updateForm(globalThis.formId, formMsg).then((data) => {
        console.info('updateForm success.' + JSON.stringify(data));
      }).catch((error) => {
        console.error('updateForm failed:' + JSON.stringify(error));
      })
    }

  }


  updateCard(){

    globalThis.startstation=this.StartStation;
    globalThis.endstation=this.EndStation;
    let obj = {
      "StartStation": globalThis.startstation,
      "EndStation":globalThis.endstation
    };
    let formData = formBindingData.createFormBindingData(obj);
    let Ids=globalThis.formIds;
    console.log("updateIds"+Ids);
    console.log("updateId"+globalThis.formId);
    for(let i of Ids){
      formProvider.updateForm(i,formData);
    }
    formProvider.updateForm(globalThis.formId,formData);
  }


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
            Text("车站设置")
              .fontFamily("sans-serif")
              .fontColor("#000000")
              .fontSize(14)
              .fontWeight(500)
              .lineHeight(20)
              .height(40)
              .padding({top:20})
            //车站设置区
            Flex({direction:FlexDirection.Row}){
              //左侧车站输入
              Flex({direction:FlexDirection.Column}){
                //Start Title
                Flex({alignItems:ItemAlign.Center}){
                  Image("/pages/common/images/starticon.svg")
                    .width(24)
                    .height(24)
                  Text("始发站")
                    .fontColor("#000000")
                    .fontFamily("sans-serif")
                    .fontSize(12)
                    .lineHeight(16)
                    .fontWeight(500)
                    .width(42)
                    .margin({left:4})
                }
                .width("100%")
                .height(32)

                //Statrt Input
                TextInput({placeholder:"请设置车站",text:this.StartStation})
                .fontColor("#5a5d72")
                .fontFamily("sans-serif")
                .fontSize(10)
                .fontWeight(400)
                .width("100%")
                  .borderRadius(4)
                .height(48)
                .onChange((value: string) => {
                  this.StartStation = value
                })

                //divider
                Flex(){
                }
                .width("100%")
                .borderStyle(BorderStyle.Solid)
                .borderColor("#767680")
                .borderWidth({top:1})
                .height(4)
                .margin({top:4})


                //End Title
                Flex({alignItems:ItemAlign.Center}){
                  Image("/pages/common/images/endicon.svg")
                    .width(24)
                    .height(24)
                  Text("终到站")
                    .fontColor("#000000")
                    .fontFamily("sans-serif")
                    .fontSize(12)
                    .lineHeight(16)
                    .fontWeight(500)
                    .width(42)
                    .margin({left:4})
                }
                .width("100%")
                .height(32)

                //End Input
                TextInput({placeholder:"请设置车站",text:this.EndStation})
                  .fontColor("#5a5d72")
                  .fontFamily("sans-serif")
                  .fontSize(10)
                  .fontWeight(400)
                  .width("100%")
                  .borderRadius(4)
                  .height(48)
                  .onChange((value: string) => {
                    this.EndStation = value
                  })

              }
              .height("100%")
              .flexGrow(1)

              //icon-area
              Flex({justifyContent:FlexAlign.Center,alignItems:ItemAlign.Center}){
                Image("/pages/common/images/swap_vert.svg")
                  .width(24)
                  .height(24)
              }
              .width(32)
              .flexGrow(0)
              .height("100%")

            }
            .backgroundColor("#fbf8ff")
            .height(200)
            .width("100%")
            .borderRadius(24)
            .margin({top:16})
            .padding(16)

            Button("设置并保存")
            .backgroundColor("#535a92")
            .fontColor("ffffff")
            .width("100%")
            .height(40)
              .onClick(()=>{this.update();})
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
          Image("/pages/common/images/tram-on.svg")
          Text("列车情报")
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
        .onClick(()=>router.pushUrl({url:'pages/index'}))

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