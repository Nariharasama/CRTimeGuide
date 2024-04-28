@Entry
@Component
struct Widget2X4Card {
  @LocalStorageProp('StartStation') StartStation: string = '点击设置';
  @LocalStorageProp('EndStation') EndStation: string = '点击设置';
  @LocalStorageProp('Train1') Train1: string = 'G----';
  @LocalStorageProp('Train1Time') Train1Time: string = '00:00';
  @LocalStorageProp('Train1TimeLeft') Train1TimeLeft: string = '00:00:00';
  @LocalStorageProp('Train2') Train2: string = 'G----';
  @LocalStorageProp('Train2Time') Train2Time: string = '00:00';
  @LocalStorageProp('Train2TimeLeft') Train2TimeLeft: string = '00:00:00';
  @LocalStorageProp('Train3') Train3: string = 'G----';
  @LocalStorageProp('Train3Time') Train3Time: string = '00:00';
  @LocalStorageProp('Train3TimeLeft') Train3TimeLeft: string = '00:00:00';
  build() {
    Flex({direction:FlexDirection.Row,alignItems:ItemAlign.Center}){
      Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center}){
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

      }.height("100%").width("50%")


      Flex({direction:FlexDirection.Column,alignItems:ItemAlign.Center}){
        Flex({direction:FlexDirection.Row}){
          //down right
          Flex({direction:FlexDirection.Column}){
            //halfright
            Row(){
              Text(this.Train2Time+"发")
                .fontColor("#000000")
                .fontSize(12)
                .fontFamily("sans-serif")
                .fontWeight(400)
                .width("50%")


              Text(this.Train2)
                .fontColor("#535a92")
                .fontSize(12)
                .fontFamily("sans-serif")
                .fontWeight(400)
            }
            .width("100%")
            .height("30%")

            Text(this.Train2TimeLeft)
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

        Flex({direction:FlexDirection.Row}){
          //down right
          Flex({direction:FlexDirection.Column}){
            //halfright
            Row(){
              Text(this.Train3Time+"发")
                .fontColor("#000000")
                .fontSize(12)
                .fontFamily("sans-serif")
                .fontWeight(400)
                .width("50%")


              Text(this.Train3)
                .fontColor("#535a92")
                .fontSize(12)
                .fontFamily("sans-serif")
                .fontWeight(400)
            }
            .width("100%")
            .height("30%")

            Text(this.Train3TimeLeft)
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

      }.height("100%").width("50%")

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