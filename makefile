CC=cc
CCFLAGS=-g -Wall -ftree-vectorize -pipe -Wno-psabi -DOSIP_MT
CCFLAGS+=-DSTANDALONE -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DTARGET_POSIX -D_LINUX -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -U_FORTIFY_SOURCE -Wall -g -DHAVE_LIBOPENMAX=2 -DOMX -DOMX_SKIP64BIT -ftree-vectorize -pipe -DUSE_EXTERNAL_OMX -DHAVE_LIBBCM_HOST -DUSE_EXTERNAL_LIBBCM_HOST -DUSE_VCHIQ_ARM -Wno-psabi
CCFLAGS+=-I/opt/vc/src/hello_pi/libs/ilclient -I/opt/vc/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux

LDFLAGS=-leXosip2 -losip2 -losipparser2  -lasound -lcamkit -lasound
LDFLAGS+=-L/opt/vc/lib/ -lGLESv2 -lEGL -lopenmaxil -lbcm_host -lvcos -lvchiq_arm  -lpthread  -lrt -lm -L/opt/vc/src/hello_pi/libs/ilclient -L/opt/vc/src/hello_pi/libs/vgfont

OBJS=sip.o omx_decode.o video_rtp_send.o video_rtp_recv.o audio_rtp_recv.o  audio_rtp_send.o queue.o g711.o g711codec.o rtpavcsend.o  omxcam/debug.o omxcam/video.o omxcam/h264.o omxcam/core.o omxcam/error.o omxcam/still.o omxcam/camera.o omxcam/dump_omx.o omxcam/version.o omxcam/event.o omxcam/jpeg.o omxcam/utils.o

TARGET=sipclient

all:: $(TARGET)

%.o: %.c
	@rm -f $@
	$(CC) $(CCFLAGS) $(LDFLAGS) -c $< -o $@ -Wno-deprecated-declarations

$(TARGET): $(OBJS)
	$(CC) $(CCFLAGS) -o $@ $(OBJS) $(LDFLAGS)
	
clean::
	rm -f $(OBJS) $(TARGET)
	

