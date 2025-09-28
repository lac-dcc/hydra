; ModuleID = 'telecom_CRC32.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@crc_32_tab = internal global [256 x i64] [i64 0, i64 1996959894, i64 3993919788, i64 2567524794, i64 124634137, i64 1886057615, i64 3915621685, i64 2657392035, i64 249268274, i64 2044508324, i64 3772115230, i64 2547177864, i64 162941995, i64 2125561021, i64 3887607047, i64 2428444049, i64 498536548, i64 1789927666, i64 4089016648, i64 2227061214, i64 450548861, i64 1843258603, i64 4107580753, i64 2211677639, i64 325883990, i64 1684777152, i64 4251122042, i64 2321926636, i64 335633487, i64 1661365465, i64 4195302755, i64 2366115317, i64 997073096, i64 1281953886, i64 3579855332, i64 2724688242, i64 1006888145, i64 1258607687, i64 3524101629, i64 2768942443, i64 901097722, i64 1119000684, i64 3686517206, i64 2898065728, i64 853044451, i64 1172266101, i64 3705015759, i64 2882616665, i64 651767980, i64 1373503546, i64 3369554304, i64 3218104598, i64 565507253, i64 1454621731, i64 3485111705, i64 3099436303, i64 671266974, i64 1594198024, i64 3322730930, i64 2970347812, i64 795835527, i64 1483230225, i64 3244367275, i64 3060149565, i64 1994146192, i64 31158534, i64 2563907772, i64 4023717930, i64 1907459465, i64 112637215, i64 2680153253, i64 3904427059, i64 2013776290, i64 251722036, i64 2517215374, i64 3775830040, i64 2137656763, i64 141376813, i64 2439277719, i64 3865271297, i64 1802195444, i64 476864866, i64 2238001368, i64 4066508878, i64 1812370925, i64 453092731, i64 2181625025, i64 4111451223, i64 1706088902, i64 314042704, i64 2344532202, i64 4240017532, i64 1658658271, i64 366619977, i64 2362670323, i64 4224994405, i64 1303535960, i64 984961486, i64 2747007092, i64 3569037538, i64 1256170817, i64 1037604311, i64 2765210733, i64 3554079995, i64 1131014506, i64 879679996, i64 2909243462, i64 3663771856, i64 1141124467, i64 855842277, i64 2852801631, i64 3708648649, i64 1342533948, i64 654459306, i64 3188396048, i64 3373015174, i64 1466479909, i64 544179635, i64 3110523913, i64 3462522015, i64 1591671054, i64 702138776, i64 2966460450, i64 3352799412, i64 1504918807, i64 783551873, i64 3082640443, i64 3233442989, i64 3988292384, i64 2596254646, i64 62317068, i64 1957810842, i64 3939845945, i64 2647816111, i64 81470997, i64 1943803523, i64 3814918930, i64 2489596804, i64 225274430, i64 2053790376, i64 3826175755, i64 2466906013, i64 167816743, i64 2097651377, i64 4027552580, i64 2265490386, i64 503444072, i64 1762050814, i64 4150417245, i64 2154129355, i64 426522225, i64 1852507879, i64 4275313526, i64 2312317920, i64 282753626, i64 1742555852, i64 4189708143, i64 2394877945, i64 397917763, i64 1622183637, i64 3604390888, i64 2714866558, i64 953729732, i64 1340076626, i64 3518719985, i64 2797360999, i64 1068828381, i64 1219638859, i64 3624741850, i64 2936675148, i64 906185462, i64 1090812512, i64 3747672003, i64 2825379669, i64 829329135, i64 1181335161, i64 3412177804, i64 3160834842, i64 628085408, i64 1382605366, i64 3423369109, i64 3138078467, i64 570562233, i64 1426400815, i64 3317316542, i64 2998733608, i64 733239954, i64 1555261956, i64 3268935591, i64 3050360625, i64 752459403, i64 1541320221, i64 2607071920, i64 3965973030, i64 1969922972, i64 40735498, i64 2617837225, i64 3943577151, i64 1913087877, i64 83908371, i64 2512341634, i64 3803740692, i64 2075208622, i64 213261112, i64 2463272603, i64 3855990285, i64 2094854071, i64 198958881, i64 2262029012, i64 4057260610, i64 1759359992, i64 534414190, i64 2176718541, i64 4139329115, i64 1873836001, i64 414664567, i64 2282248934, i64 4279200368, i64 1711684554, i64 285281116, i64 2405801727, i64 4167216745, i64 1634467795, i64 376229701, i64 2685067896, i64 3608007406, i64 1308918612, i64 956543938, i64 2808555105, i64 3495958263, i64 1231636301, i64 1047427035, i64 2932959818, i64 3654703836, i64 1088359270, i64 936918000, i64 2847714899, i64 3736837829, i64 1202900863, i64 817233897, i64 3183342108, i64 3401237130, i64 1404277552, i64 615818150, i64 3134207493, i64 3453421203, i64 1423857449, i64 601450431, i64 3009837614, i64 3294710456, i64 1567103746, i64 711928724, i64 3020668471, i64 3272380065, i64 1510334235, i64 755167117], align 16
@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"%08lX %7ld %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1.3 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external global ptr, align 8
@.str.2.4 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @updateCRC32(i8 noundef zeroext %arg, i64 noundef %arg1) #0 {
bb:
  %i = zext i8 %arg to i64
  %i2 = xor i64 %arg1, %i
  %i3 = and i64 %i2, 255
  %i4 = getelementptr inbounds [256 x i64], ptr @crc_32_tab, i64 0, i64 %i3
  %i5 = load i64, ptr %i4, align 8
  %i6 = lshr i64 %arg1, 8
  %i7 = xor i64 %i5, %i6
  ret i64 %i7
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crc32file(ptr noundef %arg, ptr noundef %arg2, ptr noundef %arg3) #0 {
bb:
  store i64 0, ptr %arg3, align 8
  %i = call noalias ptr @fopen(ptr noundef %arg, ptr noundef @.str)
  %i4 = icmp eq ptr %i, null
  br i1 %i4, label %bb5, label %bb6

bb5:                                              ; preds = %bb
  call void @perror(ptr noundef %arg)
  br label %bb28

bb6:                                              ; preds = %bb
  br label %bb7

bb7:                                              ; preds = %bb10, %bb6
  %.01 = phi i64 [ 4294967295, %bb6 ], [ %i20, %bb10 ]
  %i8 = call i32 @getc(ptr noundef %i)
  %i9 = icmp ne i32 %i8, -1
  br i1 %i9, label %bb10, label %bb21

bb10:                                             ; preds = %bb7
  %i11 = load i64, ptr %arg3, align 8
  %i12 = add nsw i64 %i11, 1
  store i64 %i12, ptr %arg3, align 8
  %i13 = trunc i32 %i8 to i8
  %i14 = zext i8 %i13 to i64
  %i15 = xor i64 %.01, %i14
  %i16 = and i64 %i15, 255
  %i17 = getelementptr inbounds [256 x i64], ptr @crc_32_tab, i64 0, i64 %i16
  %i18 = load i64, ptr %i17, align 8
  %i19 = lshr i64 %.01, 8
  %i20 = xor i64 %i18, %i19
  br label %bb7, !llvm.loop !8

bb21:                                             ; preds = %bb7
  %i22 = call i32 @ferror(ptr noundef %i) #3
  %i23 = icmp ne i32 %i22, 0
  br i1 %i23, label %bb24, label %bb21.bb25_crit_edge

bb21.bb25_crit_edge:                              ; preds = %bb21
  br label %bb25

bb24:                                             ; preds = %bb21
  call void @perror(ptr noundef %arg)
  store i64 -1, ptr %arg3, align 8
  br label %bb25

bb25:                                             ; preds = %bb21.bb25_crit_edge, %bb24
  %i26 = call i32 @fclose(ptr noundef %i)
  %i27 = xor i64 %.01, -1
  store i64 %i27, ptr %arg2, align 8
  br label %bb28

bb28:                                             ; preds = %bb25, %bb5
  %.0 = phi i32 [ -1, %bb5 ], [ 0, %bb25 ]
  ret i32 %.0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare void @perror(ptr noundef) #1

declare i32 @getc(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @ferror(ptr noundef) #2

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @crc32buf(ptr noundef %arg, i64 noundef %arg3) #0 {
bb:
  br label %bb4

bb4:                                              ; preds = %bb5, %bb
  %.02 = phi i64 [ 4294967295, %bb ], [ %i13, %bb5 ]
  %.01 = phi i64 [ %arg3, %bb ], [ %i15, %bb5 ]
  %.0 = phi ptr [ %arg, %bb ], [ %i16, %bb5 ]
  %i = icmp ne i64 %.01, 0
  br i1 %i, label %bb5, label %bb17

bb5:                                              ; preds = %bb4
  %i6 = load i8, ptr %.0, align 1
  %i7 = zext i8 %i6 to i64
  %i8 = xor i64 %.02, %i7
  %i9 = and i64 %i8, 255
  %i10 = getelementptr inbounds [256 x i64], ptr @crc_32_tab, i64 0, i64 %i9
  %i11 = load i64, ptr %i10, align 8
  %i12 = lshr i64 %.02, 8
  %i13 = xor i64 %i11, %i12
  %i15 = add i64 %.01, -1
  %i16 = getelementptr inbounds i8, ptr %.0, i32 1
  br label %bb4, !llvm.loop !10

bb17:                                             ; preds = %bb4
  %i18 = xor i64 %.02, -1
  ret i64 %i18
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main1(i32 noundef %arg, ptr noundef %arg3, i32 noundef %arg4) #0 {
bb:
  %i = alloca i64, align 8
  %i5 = alloca i64, align 8
  br label %bb6

bb6:                                              ; preds = %bb20, %bb
  %.02 = phi i32 [ 0, %bb ], [ %i13, %bb20 ]
  %.01 = phi ptr [ %arg3, %bb ], [ %i10, %bb20 ]
  %.0 = phi i32 [ %arg, %bb ], [ %i7, %bb20 ]
  %i7 = add nsw i32 %.0, -1
  %i8 = icmp sgt i32 %i7, 0
  br i1 %i8, label %bb9, label %bb21

bb9:                                              ; preds = %bb6
  %i10 = getelementptr inbounds ptr, ptr %.01, i32 1
  %i11 = load ptr, ptr %i10, align 8
  %i12 = call i32 @crc32file(ptr noundef %i11, ptr noundef %i, ptr noundef %i5)
  %i13 = or i32 %.02, %i12
  %i14 = icmp ne i32 %arg4, 0
  br i1 %i14, label %bb15, label %bb9.bb20_crit_edge

bb9.bb20_crit_edge:                               ; preds = %bb9
  br label %bb20

bb15:                                             ; preds = %bb9
  %i16 = load i64, ptr %i, align 8
  %i17 = load i64, ptr %i5, align 8
  %i18 = load ptr, ptr %i10, align 8
  %i19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i64 noundef %i16, i64 noundef %i17, ptr noundef %i18)
  br label %bb20

bb20:                                             ; preds = %bb9.bb20_crit_edge, %bb15
  br label %bb6, !llvm.loop !11

bb21:                                             ; preds = %bb6
  %i22 = icmp ne i32 %.02, 0
  %i23 = zext i1 %i22 to i32
  ret i32 %i23
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg2) #0 {
bb:
  %i = alloca i64, align 8
  %i3 = call noalias ptr @fopen(ptr noundef @.str.2, ptr noundef @.str.1.3)
  %i4 = icmp eq ptr %i3, null
  br i1 %i4, label %bb5, label %bb8

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @stderr, align 8
  %i7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i6, ptr noundef @.str.2.4)
  br label %bb23

bb8:                                              ; preds = %bb
  %i9 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i3, ptr noundef @.str.3, ptr noundef %i)
  %i10 = call i32 @fclose(ptr noundef %i3)
  br label %bb11

bb11:                                             ; preds = %bb14, %bb8
  %.01 = phi i64 [ 0, %bb8 ], [ %i15, %bb14 ]
  %i12 = load i64, ptr %i, align 8
  %i13 = icmp slt i64 %.01, %i12
  br i1 %i13, label %bb14, label %bb22

bb14:                                             ; preds = %bb11
  %i15 = add nsw i64 %.01, 1
  %i17 = icmp eq i64 %i15, %i12
  %i18 = zext i1 %i17 to i32
  %i19 = call i32 @main1(i32 noundef %arg, ptr noundef %arg2, i32 noundef %i18)
  br label %bb11, !llvm.loop !12

bb22:                                             ; preds = %bb11
  br label %bb23

bb23:                                             ; preds = %bb22, %bb5
  %.0 = phi i32 [ 1, %bb5 ], [ 0, %bb22 ]
  ret i32 %.0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5, !6, !7}

!0 = !{!"clang version 18.1.8 (https://github.com/llvm/llvm-project.git 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 1, !"ThinLTO", i32 0}
!7 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
