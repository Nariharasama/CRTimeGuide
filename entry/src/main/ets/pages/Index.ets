import router from '@ohos.router';
import formProvider from '@ohos.app.form.formProvider';
import formBindingData from '@ohos.app.form.formBindingData';
import NotificationManager from '@ohos.notificationManager';

@Component
@Entry
struct Index {
  @State StartStation:string="Nan";
  @State EndStation:string="Nan";
  @State stations:string[][]=globalThis.stations;
  @State onchosecard:number=-1;

  ToSec(timeStr){
    const timeRegex = /^(\d{2}):(\d{2})$/;
    const matches = timeRegex.exec(timeStr);
    if (matches === null) {
      return null;
    }
    let hours = parseInt(matches[1], 10);
    let minutes = parseInt(matches[2], 10);
    let full=0;
    full=hours*3600+minutes*60
    return full
  }
  ToSec3(timeStr){
    const timeRegex = /^(\d{2}):(\d{2}):(\d{2})$/;
    const matches = timeRegex.exec(timeStr);
    if (matches === null) {
      return null;
    }
    let hours = parseInt(matches[1], 10);
    let minutes = parseInt(matches[2], 10);
    let sec = parseInt(matches[3], 10);
    let full=0;
    full=hours*3600+minutes*60+sec
    return full
  }

  ToString(nowall,trainall){
    let dif=trainall-nowall
    let hour=Math.floor(dif/3600);
    let min=Math.floor((dif-hour*3600)/60);
    let sec=dif-hour*3600-min*60;
    let hourstr='';
    let minstr='';
    let secstr='';
    if(hour<10){
      hourstr="0"+hour;
    }
    else {
      hourstr=hour.toString();
    }
    if(min<10){
      minstr="0"+min;
    }
    else {
      minstr=min.toString();
    }
    if(sec<10){
      secstr="0"+sec;
    }
    else {
     secstr=sec.toString();
    }
    return(hourstr+":"+minstr+":"+secstr)
  }

  update(){
    let updata:string[][]=[['G6552','08:06','nan','08:24','nan','08:46','nan','09:09','09:43','nan','nan','nan'],
      ['G6582','08:27','nan','08:45','nan','nan','nan','nan','nan','nan','09:11','09:30'],
      ['G6510','09:21','nan','09:39','nan','nan','nan','nan','nan','10:02','nan','10:21'],
      ['G306','09:48','nan','10:06','nan','nan','nan','nan','nan','10:27','nan','10:46'],
      ['G6554','09:53','10:07','10:17','nan','10:40','10:54','nan','11:41','nan','nan','nan'],
      ['G6540','10:03','nan','nan','nan','nan','nan','nan','nan','nan','nan','10:51'],
      ['G2964','10:08','nan','10:26','nan','nan','nan','nan','nan','10:47','nan','11:06'],
      ['G6048','10:18','nan','10:36','nan','nan','nan','nan','nan','10:57','nan','11:16'],
      ['G6528','10:28','10:42','10:52','nan','nan','nan','nan','nan','11:15','nan','11:34'],
      ['G6534','10:42','nan','11:00','11:12','nan','nan','nan','nan','nan','nan','11:39'],
      ['G80','11:00','nan','11:18','nan','nan','nan','nan','nan','nan','nan','11:50'],
      ['G6584','11:12','nan','11:30','nan','nan','nan','nan','nan','nan','nan','12:05'],
      ['G6546','11:17','nan','11:35','11:51','12:06','12:20','12:33','13:07','nan','nan','nan'],
      ['G320','11:55','nan','12:13','nan','nan','nan','nan','nan','12:34','nan','12:53'],
      ['G408','12:06','nan','12:24','nan','nan','nan','nan','nan','12:44','nan','13:03'],
      ['G6556','12:22','12:36','12:46','nan','13:08','13:22','nan','14:08','nan','nan','nan'],
      ['G6516','12:27','12:41','12:51','nan','nan','nan','nan','nan','13:11','nan','13:30'],
      ['G6530','13:23','13:37','13:49','nan','nan','nan','nan','nan','nan','14:18','14:33'],
      ['G6536','13:46','14:00','14:10','nan','nan','nan','nan','nan','14:36','nan','14:55'],
      ['G6558','14:20','nan','14:38','nan','15:00','nan','15:21','15:56','nan','nan','nan'],
      ['G6542','15:08','15:22','15:37','nan','nan','nan','nan','nan','nan','16:04','16:19'],
      ['G418','15:34','nan','15:52','nan','nan','nan','nan','nan','16:15','nan','16:34'],
      ['G6548','15:53','nan','16:11','nan','16:32','nan','16:54','17:28','nan','nan','nan'],
      ['G6580','16:13','nan','16:31','nan','nan','nan','nan','nan','16:53','nan','17:12'],
      ['G6512','16:19','nan','16:37','nan','nan','nan','nan','nan','16:58','nan','17:17'],
      ['G6586','16:30','nan','16:48','nan','nan','nan','nan','nan','17:09','nan','17:34'],
      ['G6560','16:42','16:56','17:06','nan','17:28','nan','17:50','18:24','nan','nan','nan'],
      ['G6526','17:02','nan','nan','nan','nan','nan','nan','nan','nan','nan','17:50'],
      ['G6538','17:07','17:21','17:31','nan','nan','nan','nan','nan','nan','17:55','18:17'],
      ['G6114','17:18','nan','17:36','nan','nan','nan','nan','nan','nan','nan','18:10'],
      ['G6562','18:23','nan','18:41','nan','19:02','nan','19:23','19:57','nan','nan','nan'],
      ['G6502','18:56','nan','19:14','nan','nan','nan','nan','nan','19:36','nan','19:55'],
      ['G6514','19:06','nan','19:24','nan','nan','nan','nan','nan','19:46','nan','20:05'],
      ['G6550','19:45','nan','20:03','20:19','20:31','20:48','nan','21:29','nan','nan','nan'],
      ['G6588','20:01','20:15','20:25','nan','nan','nan','nan','nan','20:47','nan','21:06'],
      ['G6564','21:00','nan','21:20','nan','21:41','nan','nan','22:30','nan','nan','nan'],
      ['G6506','22:10','22:24','22:34','nan','nan','nan','nan','nan','nan','nan','23:07']];
    let downdata:string[][]=[['G6539','07:04','07:17','NAN','NAN','NAN','NAN','NAN','07:36','07:48','07:59','08:15'],
      ['G6505','08:16','08:29','08:40','NAN','NAN','NAN','NAN','NAN','09:04','NAN','09:25'],
      ['G6551','NAN','NAN','NAN','07:57','NAN','NAN','08:45','NAN','09:09','NAN','09:31'],
      ['G6527','08:52','NAN','09:09','NAN','NAN','NAN','NAN','09:24','09:39','09:51','10:07'],
      ['G6579','09:05','09:18','NAN','NAN','NAN','NAN','NAN','09:37','09:49','10:01','10:17'],
      ['G6501','09:34','NAN','NAN','NAN','NAN','NAN','NAN','NAN','10:05','NAN','10:27'],
      ['G6503','10:02','NAN','NAN','NAN','NAN','NAN','NAN','NAN','NAN','NAN','10:47'],
      ['G6581','09:50','NAN','10:07','NAN','NAN','NAN','NAN','NAN','10:26','NAN','10:52'],
      ['G6545','NAN','NAN','NAN','09:14','09:43','NAN','10:07','10:19','10:36','NAN','10:57'],
      ['G6113','10:31','NAN','NAN','NAN','NAN','NAN','NAN','NAN','11:02','NAN','11:23'],
      ['G6511','10:42','NAN','NAN','NAN','NAN','NAN','NAN','NAN','11:13','NAN','11:34'],
      ['G6553','NAN','NAN','NAN','10:08','NAN','10:45','11:01','NAN','11:26','11:37','11:54'],
      ['G6515','10:57','NAN','11:14','NAN','NAN','NAN','NAN','11:29','11:43','NAN','12:05'],
      ['G6541','11:27','NAN','11:44','NAN','NAN','NAN','NAN','NAN','12:09','12:23','12:40'],
      ['G6529','11:55','NAN','12:12','NAN','NAN','NAN','NAN','NAN','12:37','NAN','13:00'],
      ['G6583','12:26','NAN','NAN','NAN','NAN','NAN','NAN','NAN','12:57','NAN','13:20'],
      ['G6535','12:16','NAN','12:33','NAN','NAN','NAN','NAN','NAN','12:53','13:05','13:25'],
      ['G6555','NAN','NAN','NAN','12:00','12:29','12:42','12:58','NAN','13:22','13:34','13:50'],
      ['G6525','13:53','NAN','14:10','NAN','NAN','NAN','NAN','NAN','14:30','NAN','14:53'],
      ['G417','14:20','NAN','NAN','NAN','NAN','NAN','NAN','NAN','14:50','NAN','15:13'],
      ['G6547','NAN','NAN','NAN','13:36','14:05','NAN','14:29','14:41','15:03','15:14','15:30'],
      ['G6533','15:00','NAN','NAN','NAN','NAN','NAN','NAN','NAN','15:30','NAN','15:52'],
      ['G319','14:55','NAN','NAN','NAN','NAN','NAN','NAN','NAN','15:36','NAN','15:58'],
      ['G6557','NAN','NAN','NAN','14:28','14:57','NAN','15:21','NAN','15:45','16:01','16:18'],
      ['G6537','15:27','15:40','15:55','NAN','NAN','NAN','NAN','NAN','16:14','NAN','16:36'],
      ['G407','16:01','NAN','NAN','NAN','NAN','NAN','NAN','NAN','16:30','NAN','16:54'],
      ['G6559','NAN','NAN','NAN','16:15','16:44','NAN','17:08','NAN','17:34','17:46','18:02'],
      ['G79','17:41','NAN','NAN','NAN','NAN','NAN','NAN','NAN','18:10','NAN','18:31'],
      ['G6513','17:46','NAN','18:03','NAN','NAN','NAN','NAN','NAN','18:22','NAN','18:44'],
      ['G2963','17:58','NAN','NAN','NAN','NAN','NAN','NAN','NAN','18:28','18:39','18:55'],
      ['G6585','17:52','18:05','18:19','NAN','NAN','NAN','NAN','NAN','18:39','18:55','19:11'],
      ['G6549','NAN','NAN','NAN','17:50','NAN','NAN','18:37','NAN','19:01','NAN','19:25'],
      ['G6561','NAN','NAN','NAN','18:45','19:14','19:27','19:43','NAN','20:06','NAN','20:31'],
      ['G6509','20:26','NAN','20:43','NAN','NAN','NAN','NAN','NAN','21:02','NAN','21:23'],
      ['G305','20:43','NAN','NAN','NAN','NAN','NAN','NAN','NAN','21:17','21:29','21:45'],
      ['G6563','NAN','NAN','NAN','20:50','21:19','21:32','21:53','NAN','22:17','22:29','22:45'],
      ['G6047','19:01','NAN','NAN','NAN','NAN','NAN','NAN','NAN','19:31','NAN','12:43']
    ];
    globalThis.startstation=this.StartStation;
    globalThis.endstation=this.EndStation;
    if(globalThis.formId!==undefined&&globalThis.formId!=="0") {
      let startId = 0;
      let endId = 0;
      let startSC='';
      let endSC='';
      switch (globalThis.startstation) {
        case "xianggangxijiulong": {
          startId = 1;
          startSC="香港西九龙"
          break;
        }
        case "futian": {
          startId = 2;
          startSC="福田"
          break;
        }
        case "shenzhenbei": {
          startId = 3;
          startSC="深圳北"
          break;
        }
        case "guangmingcheng": {
          startId = 4;
          startSC="光明城"
          break;
        }
        case "dongguannan": {
          startId = 5;
          startSC="东莞南"
          break;
        }
        case "changping": {
          startId = 6;
          startSC="常平"
          break;
        }
        case "dongguan": {
          startId = 7;
          startSC="东莞"
          break;
        }
        case "guangzhoudong": {
          startId = 8;
          startSC="广州东"
          break;
        }
        case "humen": {
          startId = 9;
          startSC="虎门"
          break;
        }
        case "qingsheng": {
          startId = 10;
          startSC="庆盛"
          break;
        }
        case "guangzhounan": {
          startId = 11;
          startSC="广州南"
          break;
        }
      }
      switch (globalThis.endstation) {
        case "xianggangxijiulong": {
          endId = 1;
          endSC="香港西九龙"
          break;
        }
        case "futian": {
          endId = 2;
          endSC="福田"
          break;
        }
        case "shenzhenbei": {
          endId = 3;
          endSC="深圳北"
          break;
        }
        case "guangmingcheng": {
          endId = 4;
          endSC="光明城"
          break;
        }
        case "dongguannan": {
          endId = 5;
          endSC="东莞南"
          break;
        }
        case "changping": {
          endId = 6;
          endSC="常平"
          break;
        }
        case "dongguan": {
          endId = 7;
          endSC="东莞"
          break;
        }
        case "guangzhoudong": {
          endId = 8;
          endSC="广州东"
          break;
        }
        case "humen": {
          endId = 9;
          endSC="虎门"
          break;
        }
        case "qingsheng": {
          endId = 10;
          endSC="庆盛"
          break;
        }
        case "guangzhounan": {
          endId = 11;
          endSC="广州南"
          break;
        }
      }
      if(globalThis.formIdall.indexOf(globalThis.formId)==-1){
        globalThis.formIdall.push(globalThis.formId)
        globalThis.startIds.push(startId)
        globalThis.endIds.push(endId)
        globalThis.stations.push([startSC,endSC])
        globalThis.publishon.push(0)
        this.stations=globalThis.stations
        console.log("allID"+globalThis.formIdall)
      }
      else{
        globalThis.startIds[globalThis.formIdall.indexOf(globalThis.formId)]=startId
        globalThis.endIds[globalThis.formIdall.indexOf(globalThis.formId)]=endId
        globalThis.stations[globalThis.formIdall.indexOf(globalThis.formId)]=[startSC,endSC]
        this.stations=globalThis.stations
      }

      let date = new Date();
      let nowhour = date.getHours();
      let nowminutes = date.getMinutes();
      let nowseconds = date.getSeconds();
      let nowall = 3600 * nowhour + 60 * nowminutes + nowseconds;
      let nowstart = 0;
      let train = ['', '', ''];
      let time = ['', '', ''];
      let timeleft = ['', '', '']
      let num = 0;
      num = 0;
      if (startId != 0 && endId != 0) {
        if (startId < endId) {
          for (let i = 0;i < updata.length; i++) {
            if (updata[i][startId] != "nan") {
              nowstart = this.ToSec(updata[i][startId]);
              if (nowstart >= nowall && num < 3 && updata[i][endId] != "nan") {
                train[num] = updata[i][0];
                time[num] = updata[i][startId];
                timeleft[num] = this.ToString(nowall, nowstart);
                num += 1;
              }
            }

          }
        }
        if (startId > endId) {
          for (let i = 0;i < downdata.length; i++) {
            if (downdata[i][12-startId] != "NAN") {
              nowstart = this.ToSec(downdata[i][12-startId]);
              if (nowstart >= nowall && num < 3 && downdata[i][12-endId] != "NAN") {
                train[num] = downdata[i][0];
                time[num] = downdata[i][12-startId];
                timeleft[num] = this.ToString(nowall, nowstart);
                num += 1;
              }
            }

          }
        }
      }
      let formData = {
        "StartStation": startSC,
        "EndStation": endSC, // 和卡片布局中对应
        "Train1": train[0],
        "Train2": train[1],
        "Train3": train[2],
        "Train1Time": time[0],
        "Train2Time": time[1],
        "Train3Time": time[2],
        "Train1TimeLeft": timeleft[0],
        "Train2TimeLeft": timeleft[1],
        "Train3TimeLeft": timeleft[2],
      };
      let formMsg = formBindingData.createFormBindingData(formData)
      formProvider.updateForm(globalThis.formId, formMsg)
      let cult=0


      if(globalThis.intervalnum!=undefined){
        clearInterval(globalThis.intervalnum)
      }
      let timeId=setInterval(()=>{
        for(let i=0;i<globalThis.formIdall.length;i++){
          let curformid=globalThis.formIdall[i]
          startId=globalThis.startIds[i]
          endId=globalThis.endIds[i]
          let date = new Date();
          let nowhour = date.getHours();
          let nowminutes = date.getMinutes();
          let nowseconds = date.getSeconds();
          let nowall = 3600 * nowhour + 60 * nowminutes + nowseconds;
          let nowstart = 0;
          let train = ['', '', ''];
          let time = ['', '', ''];
          let timeleft = ['', '', '']
          let num = 0;
          num = 0;
          if (startId != 0 && endId != 0) {
            if (startId < endId) {
              for (let j = 0;j < updata.length; j++) {
                if (updata[j][startId] != "nan") {
                  nowstart = this.ToSec(updata[j][startId]);
                  if (nowstart >= nowall && num < 3 && updata[j][endId] != "nan") {
                    train[num] = updata[j][0];
                    time[num] = updata[j][startId];
                    timeleft[num] = this.ToString(nowall, nowstart);
                    num += 1;
                    //notification
                    if(nowstart-nowall==globalThis.publishtime*60&&globalThis.publishon[i]==1){
                      let notificationRequest = {
                        content: {
                          contentType: NotificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
                          normal: {
                            title: "列车将在"+globalThis.publishtime+"分钟后发车",
                            text: '从'+this.stations[i][0]+"开往"+this.stations[i][1]+"的"+updata[j][0]+"列车即将发车，请提前做好准备",
                          }
                        }
                      }

                      NotificationManager.publish(notificationRequest);
                    }
                  }
                }

              }
            }
            if (startId > endId) {
              for (let j = 0;j < downdata.length; j++) {
                if (downdata[j][12-startId] != "NAN") {
                  nowstart = this.ToSec(downdata[j][12-startId]);
                  if (nowstart >= nowall && num < 3 && downdata[j][12-endId] != "NAN") {
                    train[num] = downdata[j][0];
                    time[num] = downdata[j][12-startId];
                    timeleft[num] = this.ToString(nowall, nowstart);
                    num += 1;
                    //notification
                    if(nowstart-nowall==globalThis.publishtime*60&&globalThis.publishon[i]==1){
                      let notificationRequest = {
                        content: {
                          contentType: NotificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
                          normal: {
                            title: "列车将在"+globalThis.publishtime+"分钟后发车",
                            text: '从'+this.stations[i][0]+"开往"+this.stations[i][1]+"的"+downdata[j][0]+"列车即将发车，请提前做好准备",
                          }
                        }
                      }

                      NotificationManager.publish(notificationRequest);
                    }
                  }
                }

              }
            }
          }
          let formData = {
            "Train1": train[0],
            "Train2": train[1],
            "Train3": train[2],
            "Train1Time": time[0],
            "Train2Time": time[1],
            "Train3Time": time[2],
            "Train1TimeLeft": timeleft[0],
            "Train2TimeLeft": timeleft[1],
            "Train3TimeLeft": timeleft[2],
          };
          let formMsg = formBindingData.createFormBindingData(formData)
          formProvider.updateForm(curformid, formMsg)

        }
      },1000)
      globalThis.intervalnum=timeId
    }
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

            Text("已经设置的卡片")
              .fontFamily("sans-serif")
              .fontColor("#000000")
              .fontSize(14)
              .fontWeight(500)
              .lineHeight(20)
              .height(40)
              .padding({top:20})

            List(){
              ForEach(this.stations,(item,key)=>{

                ListItem(){
                  Row(){
                    Text("No."+(key+1))
                      .fontColor("#000000")
                      .fontFamily("sans-serif")
                      .fontSize(12)
                      .lineHeight(16)
                      .fontWeight(400)
                      .width(30)
                      .margin(4)

                    Text("始发:"+item[0])
                      .fontColor("#000000")
                      .fontFamily("sans-serif")
                      .fontSize(12)
                      .lineHeight(16)
                      .fontWeight(400)
                      .width(100)
                      .margin(4)

                    Text("终到:"+item[1])
                      .fontColor("#000000")
                      .fontFamily("sans-serif")
                      .fontSize(12)
                      .lineHeight(16)
                      .fontWeight(400)
                      .width(100)
                      .margin(4)

                    Blank()

                    Toggle({ type: ToggleType.Switch, isOn: false })
                      .flexGrow(0)
                      .onChange((ison)=>{
                        if(ison){
                          let updata:string[][]=[['G6552','08:06','nan','08:24','nan','08:46','nan','09:09','09:43','nan','nan','nan'],
                            ['G6582','08:27','nan','08:45','nan','nan','nan','nan','nan','nan','09:11','09:30'],
                            ['G6510','09:21','nan','09:39','nan','nan','nan','nan','nan','10:02','nan','10:21'],
                            ['G306','09:48','nan','10:06','nan','nan','nan','nan','nan','10:27','nan','10:46'],
                            ['G6554','09:53','10:07','10:17','nan','10:40','10:54','nan','11:41','nan','nan','nan'],
                            ['G6540','10:03','nan','nan','nan','nan','nan','nan','nan','nan','nan','10:51'],
                            ['G2964','10:08','nan','10:26','nan','nan','nan','nan','nan','10:47','nan','11:06'],
                            ['G6048','10:18','nan','10:36','nan','nan','nan','nan','nan','10:57','nan','11:16'],
                            ['G6528','10:28','10:42','10:52','nan','nan','nan','nan','nan','11:15','nan','11:34'],
                            ['G6534','10:42','nan','11:00','11:12','nan','nan','nan','nan','nan','nan','11:39'],
                            ['G80','11:00','nan','11:18','nan','nan','nan','nan','nan','nan','nan','11:50'],
                            ['G6584','11:12','nan','11:30','nan','nan','nan','nan','nan','nan','nan','12:05'],
                            ['G6546','11:17','nan','11:35','11:51','12:06','12:20','12:33','13:07','nan','nan','nan'],
                            ['G320','11:55','nan','12:13','nan','nan','nan','nan','nan','12:34','nan','12:53'],
                            ['G408','12:06','nan','12:24','nan','nan','nan','nan','nan','12:44','nan','13:03'],
                            ['G6556','12:22','12:36','12:46','nan','13:08','13:22','nan','14:08','nan','nan','nan'],
                            ['G6516','12:27','12:41','12:51','nan','nan','nan','nan','nan','13:11','nan','13:30'],
                            ['G6530','13:23','13:37','13:49','nan','nan','nan','nan','nan','nan','14:18','14:33'],
                            ['G6536','13:46','14:00','14:10','nan','nan','nan','nan','nan','14:36','nan','14:55'],
                            ['G6558','14:20','nan','14:38','nan','15:00','nan','15:21','15:56','nan','nan','nan'],
                            ['G6542','15:08','15:22','15:37','nan','nan','nan','nan','nan','nan','16:04','16:19'],
                            ['G418','15:34','nan','15:52','nan','nan','nan','nan','nan','16:15','nan','16:34'],
                            ['G6548','15:53','nan','16:11','nan','16:32','nan','16:54','17:28','nan','nan','nan'],
                            ['G6580','16:13','nan','16:31','nan','nan','nan','nan','nan','16:53','nan','17:12'],
                            ['G6512','16:19','nan','16:37','nan','nan','nan','nan','nan','16:58','nan','17:17'],
                            ['G6586','16:30','nan','16:48','nan','nan','nan','nan','nan','17:09','nan','17:34'],
                            ['G6560','16:42','16:56','17:06','nan','17:28','nan','17:50','18:24','nan','nan','nan'],
                            ['G6526','17:02','nan','nan','nan','nan','nan','nan','nan','nan','nan','17:50'],
                            ['G6538','17:07','17:21','17:31','nan','nan','nan','nan','nan','nan','17:55','18:17'],
                            ['G6114','17:18','nan','17:36','nan','nan','nan','nan','nan','nan','nan','18:10'],
                            ['G6562','18:23','nan','18:41','nan','19:02','nan','19:23','19:57','nan','nan','nan'],
                            ['G6502','18:56','nan','19:14','nan','nan','nan','nan','nan','19:36','nan','19:55'],
                            ['G6514','19:06','nan','19:24','nan','nan','nan','nan','nan','19:46','nan','20:05'],
                            ['G6550','19:45','nan','20:03','20:19','20:31','20:48','nan','21:29','nan','nan','nan'],
                            ['G6588','20:01','20:15','20:25','nan','nan','nan','nan','nan','20:47','nan','21:06'],
                            ['G6564','21:00','nan','21:20','nan','21:41','nan','nan','22:30','nan','nan','nan'],
                            ['G6506','22:10','22:24','22:34','nan','nan','nan','nan','nan','nan','nan','23:07']];
                          let downdata:string[][]=[['G6539','07:04','07:17','NAN','NAN','NAN','NAN','NAN','07:36','07:48','07:59','08:15'],
                            ['G6505','08:16','08:29','08:40','NAN','NAN','NAN','NAN','NAN','09:04','NAN','09:25'],
                            ['G6551','NAN','NAN','NAN','07:57','NAN','NAN','08:45','NAN','09:09','NAN','09:31'],
                            ['G6527','08:52','NAN','09:09','NAN','NAN','NAN','NAN','09:24','09:39','09:51','10:07'],
                            ['G6579','09:05','09:18','NAN','NAN','NAN','NAN','NAN','09:37','09:49','10:01','10:17'],
                            ['G6501','09:34','NAN','NAN','NAN','NAN','NAN','NAN','NAN','10:05','NAN','10:27'],
                            ['G6503','10:02','NAN','NAN','NAN','NAN','NAN','NAN','NAN','NAN','NAN','10:47'],
                            ['G6581','09:50','NAN','10:07','NAN','NAN','NAN','NAN','NAN','10:26','NAN','10:52'],
                            ['G6545','NAN','NAN','NAN','09:14','09:43','NAN','10:07','10:19','10:36','NAN','10:57'],
                            ['G6113','10:31','NAN','NAN','NAN','NAN','NAN','NAN','NAN','11:02','NAN','11:23'],
                            ['G6511','10:42','NAN','NAN','NAN','NAN','NAN','NAN','NAN','11:13','NAN','11:34'],
                            ['G6553','NAN','NAN','NAN','10:08','NAN','10:45','11:01','NAN','11:26','11:37','11:54'],
                            ['G6515','10:57','NAN','11:14','NAN','NAN','NAN','NAN','11:29','11:43','NAN','12:05'],
                            ['G6541','11:27','NAN','11:44','NAN','NAN','NAN','NAN','NAN','12:09','12:23','12:40'],
                            ['G6529','11:55','NAN','12:12','NAN','NAN','NAN','NAN','NAN','12:37','NAN','13:00'],
                            ['G6583','12:26','NAN','NAN','NAN','NAN','NAN','NAN','NAN','12:57','NAN','13:20'],
                            ['G6535','12:16','NAN','12:33','NAN','NAN','NAN','NAN','NAN','12:53','13:05','13:25'],
                            ['G6555','NAN','NAN','NAN','12:00','12:29','12:42','12:58','NAN','13:22','13:34','13:50'],
                            ['G6525','13:53','NAN','14:10','NAN','NAN','NAN','NAN','NAN','14:30','NAN','14:53'],
                            ['G417','14:20','NAN','NAN','NAN','NAN','NAN','NAN','NAN','14:50','NAN','15:13'],
                            ['G6547','NAN','NAN','NAN','13:36','14:05','NAN','14:29','14:41','15:03','15:14','15:30'],
                            ['G6533','15:00','NAN','NAN','NAN','NAN','NAN','NAN','NAN','15:30','NAN','15:52'],
                            ['G319','14:55','NAN','NAN','NAN','NAN','NAN','NAN','NAN','15:36','NAN','15:58'],
                            ['G6557','NAN','NAN','NAN','14:28','14:57','NAN','15:21','NAN','15:45','16:01','16:18'],
                            ['G6537','15:27','15:40','15:55','NAN','NAN','NAN','NAN','NAN','16:14','NAN','16:36'],
                            ['G407','16:01','NAN','NAN','NAN','NAN','NAN','NAN','NAN','16:30','NAN','16:54'],
                            ['G6559','NAN','NAN','NAN','16:15','16:44','NAN','17:08','NAN','17:34','17:46','18:02'],
                            ['G79','17:41','NAN','NAN','NAN','NAN','NAN','NAN','NAN','18:10','NAN','18:31'],
                            ['G6513','17:46','NAN','18:03','NAN','NAN','NAN','NAN','NAN','18:22','NAN','18:44'],
                            ['G2963','17:58','NAN','NAN','NAN','NAN','NAN','NAN','NAN','18:28','18:39','18:55'],
                            ['G6585','17:52','18:05','18:19','NAN','NAN','NAN','NAN','NAN','18:39','18:55','19:11'],
                            ['G6549','NAN','NAN','NAN','17:50','NAN','NAN','18:37','NAN','19:01','NAN','19:25'],
                            ['G6561','NAN','NAN','NAN','18:45','19:14','19:27','19:43','NAN','20:06','NAN','20:31'],
                            ['G6509','20:26','NAN','20:43','NAN','NAN','NAN','NAN','NAN','21:02','NAN','21:23'],
                            ['G305','20:43','NAN','NAN','NAN','NAN','NAN','NAN','NAN','21:17','21:29','21:45'],
                            ['G6563','NAN','NAN','NAN','20:50','21:19','21:32','21:53','NAN','22:17','22:29','22:45'],
                            ['G6047','19:01','NAN','NAN','NAN','NAN','NAN','NAN','NAN','19:31','NAN','12:43']
                          ];
                          globalThis.publishon[key]=1
                          let i=key
                          let startId=globalThis.startIds[i]
                          let endId=globalThis.endIds[i]
                          let date = new Date();
                          let nowhour = date.getHours();
                          let nowminutes = date.getMinutes();
                          let nowseconds = date.getSeconds();
                          let nowall = 3600 * nowhour + 60 * nowminutes + nowseconds;
                          let nowstart = 0;
                          let num = 0;
                          num = 0;
                          if (startId != 0 && endId != 0) {
                            if (startId < endId) {
                              for (let j = 0;j < updata.length; j++) {
                                if (updata[j][startId] != "nan") {
                                  nowstart = this.ToSec(updata[j][startId]);
                                  if (nowstart >= nowall && num < 3 && updata[j][endId] != "nan") {
                                    num += 1;
                                    //notification
                                    if(nowstart-nowall<=globalThis.publishtime*60){
                                      let notificationRequest = {
                                        Id:nowstart,
                                        content: {
                                          contentType: NotificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
                                          normal: {
                                            title: "列车将在"+Math.floor((nowstart-nowall)/60)+"分钟后发车",
                                            text: '从'+this.stations[i][0]+"开往"+this.stations[i][1]+"的"+updata[j][0]+"列车即将发车，请提前做好准备",
                                          }
                                        }
                                      }
                                      NotificationManager.publish(notificationRequest);
                                    }
                                  }
                                }

                              }
                            }
                            if (startId > endId) {
                              for (let j = 0;j < downdata.length; j++) {
                                if (downdata[j][12-startId] != "NAN") {
                                  nowstart = this.ToSec(downdata[j][12-startId]);
                                  if (nowstart >= nowall && num < 3 && downdata[j][12-endId] != "NAN") {
                                    num += 1;
                                    //notification
                                    if(nowstart-nowall<=globalThis.publishtime*60){
                                      let notificationRequest = {
                                        Id:nowstart,
                                        content: {
                                          contentType: NotificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
                                          normal: {
                                            title: "列车将在"+Math.floor((nowstart-nowall)/60)+"分钟后发车",
                                            text: '从'+this.stations[i][0]+"开往"+this.stations[i][1]+"的"+downdata[j][0]+"列车即将发车，请提前做好准备",
                                          }
                                        }
                                      }

                                      NotificationManager.publish(notificationRequest);
                                    }
                                  }
                                }

                              }
                            }
                          }
                        }
                        else{
                          globalThis.publishon[key]=0
                        }
                      })

                    Button("修改")
                      .backgroundColor("#535a92")
                      .fontColor("ffffff")
                      .width(64)
                      .height(40)
                      .onClick(()=>{globalThis.formId=globalThis.formIdall[key]})

                  }.height("100%").width("100%")
                }.width("100%").height(56)

              })
            }.width("100%").flexGrow(1).height(400)



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