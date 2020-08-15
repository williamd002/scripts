 Dim message, sapi
      message=InputBox("What do you want me to say?","William Puchy Sppeak Command")
     Set sapi=CreateObject("sapi.spvoice")
     sapi.Speak message