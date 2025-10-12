; ModuleID = 'telecom_CRC32.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@crc_32_tab = internal unnamed_addr constant [256 x i64] [i64 0, i64 1996959894, i64 3993919788, i64 2567524794, i64 124634137, i64 1886057615, i64 3915621685, i64 2657392035, i64 249268274, i64 2044508324, i64 3772115230, i64 2547177864, i64 162941995, i64 2125561021, i64 3887607047, i64 2428444049, i64 498536548, i64 1789927666, i64 4089016648, i64 2227061214, i64 450548861, i64 1843258603, i64 4107580753, i64 2211677639, i64 325883990, i64 1684777152, i64 4251122042, i64 2321926636, i64 335633487, i64 1661365465, i64 4195302755, i64 2366115317, i64 997073096, i64 1281953886, i64 3579855332, i64 2724688242, i64 1006888145, i64 1258607687, i64 3524101629, i64 2768942443, i64 901097722, i64 1119000684, i64 3686517206, i64 2898065728, i64 853044451, i64 1172266101, i64 3705015759, i64 2882616665, i64 651767980, i64 1373503546, i64 3369554304, i64 3218104598, i64 565507253, i64 1454621731, i64 3485111705, i64 3099436303, i64 671266974, i64 1594198024, i64 3322730930, i64 2970347812, i64 795835527, i64 1483230225, i64 3244367275, i64 3060149565, i64 1994146192, i64 31158534, i64 2563907772, i64 4023717930, i64 1907459465, i64 112637215, i64 2680153253, i64 3904427059, i64 2013776290, i64 251722036, i64 2517215374, i64 3775830040, i64 2137656763, i64 141376813, i64 2439277719, i64 3865271297, i64 1802195444, i64 476864866, i64 2238001368, i64 4066508878, i64 1812370925, i64 453092731, i64 2181625025, i64 4111451223, i64 1706088902, i64 314042704, i64 2344532202, i64 4240017532, i64 1658658271, i64 366619977, i64 2362670323, i64 4224994405, i64 1303535960, i64 984961486, i64 2747007092, i64 3569037538, i64 1256170817, i64 1037604311, i64 2765210733, i64 3554079995, i64 1131014506, i64 879679996, i64 2909243462, i64 3663771856, i64 1141124467, i64 855842277, i64 2852801631, i64 3708648649, i64 1342533948, i64 654459306, i64 3188396048, i64 3373015174, i64 1466479909, i64 544179635, i64 3110523913, i64 3462522015, i64 1591671054, i64 702138776, i64 2966460450, i64 3352799412, i64 1504918807, i64 783551873, i64 3082640443, i64 3233442989, i64 3988292384, i64 2596254646, i64 62317068, i64 1957810842, i64 3939845945, i64 2647816111, i64 81470997, i64 1943803523, i64 3814918930, i64 2489596804, i64 225274430, i64 2053790376, i64 3826175755, i64 2466906013, i64 167816743, i64 2097651377, i64 4027552580, i64 2265490386, i64 503444072, i64 1762050814, i64 4150417245, i64 2154129355, i64 426522225, i64 1852507879, i64 4275313526, i64 2312317920, i64 282753626, i64 1742555852, i64 4189708143, i64 2394877945, i64 397917763, i64 1622183637, i64 3604390888, i64 2714866558, i64 953729732, i64 1340076626, i64 3518719985, i64 2797360999, i64 1068828381, i64 1219638859, i64 3624741850, i64 2936675148, i64 906185462, i64 1090812512, i64 3747672003, i64 2825379669, i64 829329135, i64 1181335161, i64 3412177804, i64 3160834842, i64 628085408, i64 1382605366, i64 3423369109, i64 3138078467, i64 570562233, i64 1426400815, i64 3317316542, i64 2998733608, i64 733239954, i64 1555261956, i64 3268935591, i64 3050360625, i64 752459403, i64 1541320221, i64 2607071920, i64 3965973030, i64 1969922972, i64 40735498, i64 2617837225, i64 3943577151, i64 1913087877, i64 83908371, i64 2512341634, i64 3803740692, i64 2075208622, i64 213261112, i64 2463272603, i64 3855990285, i64 2094854071, i64 198958881, i64 2262029012, i64 4057260610, i64 1759359992, i64 534414190, i64 2176718541, i64 4139329115, i64 1873836001, i64 414664567, i64 2282248934, i64 4279200368, i64 1711684554, i64 285281116, i64 2405801727, i64 4167216745, i64 1634467795, i64 376229701, i64 2685067896, i64 3608007406, i64 1308918612, i64 956543938, i64 2808555105, i64 3495958263, i64 1231636301, i64 1047427035, i64 2932959818, i64 3654703836, i64 1088359270, i64 936918000, i64 2847714899, i64 3736837829, i64 1202900863, i64 817233897, i64 3183342108, i64 3401237130, i64 1404277552, i64 615818150, i64 3134207493, i64 3453421203, i64 1423857449, i64 601450431, i64 3009837614, i64 3294710456, i64 1567103746, i64 711928724, i64 3020668471, i64 3272380065, i64 1510334235, i64 755167117], align 16
@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"%08lX %7ld %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1.3 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.2.4 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i64 @updateCRC32(i8 noundef zeroext %arg, i64 noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = trunc i64 %arg1 to i8
  %i2 = xor i8 %i, %arg
  %i3 = zext i8 %i2 to i64
  %i4 = getelementptr inbounds [256 x i64], ptr @crc_32_tab, i64 0, i64 %i3
  %i5 = load i64, ptr %i4, align 8, !tbaa !8
  %i6 = lshr i64 %arg1, 8
  %i7 = xor i64 %i5, %i6
  ret i64 %i7
}

; Function Attrs: nofree nounwind uwtable
define dso_local noundef i32 @crc32file(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, ptr nocapture noundef %arg2) local_unnamed_addr #1 {
bb:
  store i64 0, ptr %arg2, align 8, !tbaa !8
  %i = tail call noalias ptr @fopen(ptr noundef %arg, ptr noundef nonnull @.str)
  %i3 = icmp eq ptr %i, null
  br i1 %i3, label %bb4, label %bb5.preheader

bb5.preheader:                                    ; preds = %bb
  br label %bb5

bb4:                                              ; preds = %bb
  tail call void @perror(ptr noundef %arg) #9
  br label %bb26

bb5:                                              ; preds = %bb9, %bb5.preheader
  %i6 = phi i64 [ %i18, %bb9 ], [ 4294967295, %bb5.preheader ]
  %i7 = tail call i32 @getc(ptr noundef nonnull %i)
  %i8 = icmp eq i32 %i7, -1
  br i1 %i8, label %bb19, label %bb9

bb9:                                              ; preds = %bb5
  %i10 = load i64, ptr %arg2, align 8, !tbaa !8
  %i11 = add nsw i64 %i10, 1
  store i64 %i11, ptr %arg2, align 8, !tbaa !8
  %i12 = zext i32 %i7 to i64
  %i13 = xor i64 %i6, %i12
  %i14 = and i64 %i13, 255
  %i15 = getelementptr inbounds [256 x i64], ptr @crc_32_tab, i64 0, i64 %i14
  %i16 = load i64, ptr %i15, align 8, !tbaa !8
  %i17 = lshr i64 %i6, 8
  %i18 = xor i64 %i16, %i17
  br label %bb5, !llvm.loop !12

bb19:                                             ; preds = %bb5
  %i20 = tail call i32 @ferror(ptr noundef nonnull %i) #10
  %i21 = icmp eq i32 %i20, 0
  br i1 %i21, label %bb19.bb23_crit_edge, label %bb22

bb19.bb23_crit_edge:                              ; preds = %bb19
  br label %bb23

bb22:                                             ; preds = %bb19
  tail call void @perror(ptr noundef %arg) #9
  store i64 -1, ptr %arg2, align 8, !tbaa !8
  br label %bb23

bb23:                                             ; preds = %bb22, %bb19.bb23_crit_edge
  %i24 = tail call i32 @fclose(ptr noundef nonnull %i)
  %i25 = xor i64 %i6, -1
  store i64 %i25, ptr %arg1, align 8, !tbaa !8
  br label %bb26

bb26:                                             ; preds = %bb23, %bb4
  %i27 = phi i32 [ -1, %bb4 ], [ 0, %bb23 ]
  ret i32 %i27
}

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare void @perror(ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @getc(ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind memory(read)
declare noundef i32 @ferror(ptr nocapture noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local i64 @crc32buf(ptr nocapture noundef readonly %arg, i64 noundef %arg1) local_unnamed_addr #4 {
bb:
  %i = icmp eq i64 %arg1, 0
  br i1 %i, label %bb.bb19_crit_edge, label %bb2.preheader

bb.bb19_crit_edge:                                ; preds = %bb
  br label %bb19

bb2.preheader:                                    ; preds = %bb
  br label %bb2

bb2:                                              ; preds = %bb2.bb2_crit_edge, %bb2.preheader
  %i3 = phi i64 [ %i13, %bb2.bb2_crit_edge ], [ 4294967295, %bb2.preheader ]
  %i4 = phi i64 [ %i14, %bb2.bb2_crit_edge ], [ %arg1, %bb2.preheader ]
  %i5 = phi ptr [ %i15, %bb2.bb2_crit_edge ], [ %arg, %bb2.preheader ]
  %i6 = load i8, ptr %i5, align 1, !tbaa !15
  %i7 = trunc i64 %i3 to i8
  %i8 = xor i8 %i6, %i7
  %i9 = zext i8 %i8 to i64
  %i10 = getelementptr inbounds [256 x i64], ptr @crc_32_tab, i64 0, i64 %i9
  %i11 = load i64, ptr %i10, align 8, !tbaa !8
  %i12 = lshr i64 %i3, 8
  %i13 = xor i64 %i11, %i12
  %i14 = add i64 %i4, -1
  %i15 = getelementptr inbounds i8, ptr %i5, i64 1
  %i16 = icmp eq i64 %i14, 0
  br i1 %i16, label %bb17, label %bb2.bb2_crit_edge, !llvm.loop !16

bb2.bb2_crit_edge:                                ; preds = %bb2
  br label %bb2

bb17:                                             ; preds = %bb2
  %i18 = xor i64 %i13, -1
  br label %bb19

bb19:                                             ; preds = %bb17, %bb.bb19_crit_edge
  %i20 = phi i64 [ -4294967296, %bb.bb19_crit_edge ], [ %i18, %bb17 ]
  ret i64 %i20
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main1(i32 noundef %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2) local_unnamed_addr #1 {
bb:
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i3) #10
  %i4 = icmp sgt i32 %arg, 1
  br i1 %i4, label %bb5, label %bb.bb26_crit_edge

bb.bb26_crit_edge:                                ; preds = %bb
  br label %bb26

bb5:                                              ; preds = %bb
  %i6 = icmp eq i32 %arg2, 0
  br label %bb7

bb7:                                              ; preds = %bb21.bb7_crit_edge, %bb5
  %i8 = phi i32 [ %arg, %bb5 ], [ %i11, %bb21.bb7_crit_edge ]
  %i9 = phi i32 [ 0, %bb5 ], [ %i15, %bb21.bb7_crit_edge ]
  %i10 = phi ptr [ %arg1, %bb5 ], [ %i12, %bb21.bb7_crit_edge ]
  %i11 = add nsw i32 %i8, -1
  %i12 = getelementptr inbounds ptr, ptr %i10, i64 1
  %i13 = load ptr, ptr %i12, align 8, !tbaa !17
  %i14 = call i32 @crc32file(ptr noundef %i13, ptr noundef nonnull %i, ptr noundef nonnull %i3), !range !19
  %i15 = or i32 %i14, %i9
  br i1 %i6, label %bb7.bb21_crit_edge, label %bb16

bb7.bb21_crit_edge:                               ; preds = %bb7
  br label %bb21

bb16:                                             ; preds = %bb7
  %i17 = load i64, ptr %i, align 8, !tbaa !8
  %i18 = load i64, ptr %i3, align 8, !tbaa !8
  %i19 = load ptr, ptr %i12, align 8, !tbaa !17
  %i20 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i64 noundef %i17, i64 noundef %i18, ptr noundef %i19)
  br label %bb21

bb21:                                             ; preds = %bb16, %bb7.bb21_crit_edge
  %i22 = icmp sgt i32 %i8, 2
  br i1 %i22, label %bb21.bb7_crit_edge, label %bb23, !llvm.loop !20

bb21.bb7_crit_edge:                               ; preds = %bb21
  br label %bb7

bb23:                                             ; preds = %bb21
  %i24 = icmp ne i32 %i15, 0
  %i25 = zext i1 %i24 to i32
  br label %bb26

bb26:                                             ; preds = %bb23, %bb.bb26_crit_edge
  %i27 = phi i32 [ 0, %bb.bb26_crit_edge ], [ %i25, %bb23 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i3) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #10
  ret i32 %i27
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr noundef %arg1) local_unnamed_addr #6 {
bb:
  %i = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #10
  %i2 = tail call noalias ptr @fopen(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1.3)
  %i3 = icmp eq ptr %i2, null
  br i1 %i3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8, !tbaa !17
  %i6 = tail call i64 @fwrite(ptr nonnull @.str.2.4, i64 28, i64 1, ptr %i5) #9
  br label %bb21

bb7:                                              ; preds = %bb
  %i8 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i2, ptr noundef nonnull @.str.3, ptr noundef nonnull %i) #10
  %i9 = call i32 @fclose(ptr noundef nonnull %i2)
  %i10 = load i64, ptr %i, align 8, !tbaa !8
  %i11 = icmp sgt i64 %i10, 0
  br i1 %i11, label %bb12.preheader, label %bb7.bb21_crit_edge

bb7.bb21_crit_edge:                               ; preds = %bb7
  br label %bb21

bb12.preheader:                                   ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb12.bb12_crit_edge, %bb12.preheader
  %i13 = phi i64 [ %i19, %bb12.bb12_crit_edge ], [ %i10, %bb12.preheader ]
  %i14 = phi i64 [ %i15, %bb12.bb12_crit_edge ], [ 0, %bb12.preheader ]
  %i15 = add nuw nsw i64 %i14, 1
  %i16 = icmp eq i64 %i15, %i13
  %i17 = zext i1 %i16 to i32
  %i18 = call i32 @main1(i32 noundef %arg, ptr noundef %arg1, i32 noundef %i17) #10
  %i19 = load i64, ptr %i, align 8, !tbaa !8
  %i20 = icmp slt i64 %i15, %i19
  br i1 %i20, label %bb12.bb12_crit_edge, label %bb21.loopexit, !llvm.loop !21

bb12.bb12_crit_edge:                              ; preds = %bb12
  br label %bb12

bb21.loopexit:                                    ; preds = %bb12
  br label %bb21

bb21:                                             ; preds = %bb21.loopexit, %bb7.bb21_crit_edge, %bb4
  %i22 = phi i32 [ 1, %bb4 ], [ 0, %bb7.bb21_crit_edge ], [ 0, %bb21.loopexit ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #10
  ret i32 %i22
}

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #7

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nounwind }
attributes #8 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { cold }
attributes #10 = { nounwind }

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
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!10, !10, i64 0}
!16 = distinct !{!16, !13, !14}
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !10, i64 0}
!19 = !{i32 -1, i32 1}
!20 = distinct !{!20, !13, !14}
!21 = distinct !{!21, !13, !14}
