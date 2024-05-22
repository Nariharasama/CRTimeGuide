@Entry
@Component
struct Widget2X2Card {
  @LocalStorageProp('StartStation') StartStation: string = '点击设置';
  @LocalStorageProp('EndStation') EndStation: string = '点击设置';
  @LocalStorageProp('Train1') Train1: string = 'G----';
  @LocalStorageProp('Train1Time') Train1Time: string = '00:00';
  @LocalStorageProp('Train1TimeLeft') Train1TimeLeft: string = '00:00:00';
  build() {
    Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center}){
      //top
      Flex({direction:FlexDirection.Row}){
        //topleft
        Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center,justifyContent:FlexAlign.Center}){
          //Halfleft
          Row(){
              //startstation
            Text("始发")
              .fontColor("#000000")
              .fontFamily("sans-serif")
              .fontSize(12)
              .lineHeight(16)
              .fontWeight(400)
            Blank()
            Text(this.StartStation)
              .fontColor("#535a92")
              .fontFamily("sans-serif")
              .fontSize(12)
              .lineHeight(16)
              .fontWeight(400)
              .flexGrow(1)
          }
          .width("100%")
          .height("50%")

          Row(){
            //startstation
            Text("终到")
              .fontColor("#000000")
              .fontFamily("sans-serif")
              .fontSize(12)
              .lineHeight(16)
              .fontWeight(400)

            Blank()
            Text(this.EndStation)
              .fontColor("#535a92")
              .fontFamily("sans-serif")
              .fontSize(12)
              .lineHeight(16)
              .fontWeight(400)
              .flexGrow(1)
          }
          .width("100%")
          .height("50%")
        }
        .height("100%")
        .width("70%")
        //topright
        Flex({alignItems:ItemAlign.Center,justifyContent:FlexAlign.Center}){
          Image("common/images/swap_vert.svg")
            .width(24)
            .height(26)
        }
        .height("100%")
        .width("30%")
      }
      .height("50%")
      .width("100%")

      Flex({direction:FlexDirection.Row}){
        Rect({height:"90%",width:2}).fill(Color.Blue)
        Rect({height:"90%",width:4}).fill(Color.Transparent)
        //down right
        Flex({direction:FlexDirection.Column}){
          //halfright
          Row(){
            Text(this.Train1Time+"发")
              .fontColor("#000000")
              .fontSize(12)
              .fontFamily("sans-serif")
              .fontWeight(400)
              .width("50%")


            Text(this.Train1)
              .fontColor("#535a92")
              .fontSize(12)
              .fontFamily("sans-serif")
              .fontWeight(400)
          }
          .width("100%")
          .height("30%")

          Text(this.Train1TimeLeft)
            .fontColor("#000000")
            .fontFamily("sans-serif")
            .fontWeight(400)
            .fontSize(24)
            .margin({top:8})
            .width("100%")
        }
        .height("100%")
        .flexGrow(1)

      }
      .width("100%")
      .height("50%")
    }
    .height("100%")
    .width("100%")
    .padding(16)
    .onClick(() => {
      console.info('postCardAction to EntryAbility');
      postCardAction(this, {
        'action': 'router',
        'abilityName': 'EntryAbility', // 只能跳转到当前应用下的UIAbility
        'params': {
          'detail': 'RouterFromCard'
        }
      });
    })

  }
}