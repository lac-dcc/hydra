; ModuleID = 'automotive_susan_e.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.13 = private unnamed_addr constant [26 x i8] c"Image %s not binary PGM.\0A\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"Can't input image %s.\0A\00", align 1
@.str.17 = private unnamed_addr constant [43 x i8] c"Image %s does not have binary PGM header.\0A\00", align 1
@.str.18 = private unnamed_addr constant [25 x i8] c"Image %s is wrong size.\0A\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.20 = private unnamed_addr constant [23 x i8] c"Can't output image%s.\0A\00", align 1
@.str.21 = private unnamed_addr constant [4 x i8] c"P5\0A\00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1
@.str.23 = private unnamed_addr constant [5 x i8] c"255\0A\00", align 1
@.str.24 = private unnamed_addr constant [23 x i8] c"Can't write image %s.\0A\00", align 1
@.str.25 = private unnamed_addr constant [54 x i8] c"Distance_thresh (%f) too big for integer arithmetic.\0A\00", align 1
@.str.28 = private unnamed_addr constant [65 x i8] c"Mask size (1.5*distance_thresh+1=%d) too big for image (%dx%d).\0A\00", align 1
@.str.29 = private unnamed_addr constant [19 x i8] c"Too many corners.\0A\00", align 1
@str = private unnamed_addr constant [43 x i8] c"Usage: susan <in.pgm> <out.pgm> [options]\0A\00", align 1
@str.32 = private unnamed_addr constant [30 x i8] c"-s : Smoothing mode (default)\00", align 1
@str.33 = private unnamed_addr constant [16 x i8] c"-e : Edges mode\00", align 1
@str.34 = private unnamed_addr constant [19 x i8] c"-c : Corners mode\0A\00", align 1
@str.35 = private unnamed_addr constant [66 x i8] c"See source code for more information about setting the thresholds\00", align 1
@str.36 = private unnamed_addr constant [59 x i8] c"-t <thresh> : Brightness threshold, all modes (default=20)\00", align 1
@str.37 = private unnamed_addr constant [106 x i8] c"-d <thresh> : Distance threshold, smoothing mode, (default=4) (use next option instead for flat 3x3 mask)\00", align 1
@str.38 = private unnamed_addr constant [48 x i8] c"-3 : Use flat 3x3 mask, edges or smoothing mode\00", align 1
@str.39 = private unnamed_addr constant [78 x i8] c"-n : No post-processing on the binary edge map (runs much faster); edges mode\00", align 1
@str.40 = private unnamed_addr constant [110 x i8] c"-q : Use faster (and usually stabler) corner mode; edge-like corner suppression not carried out; corners mode\00", align 1
@str.41 = private unnamed_addr constant [107 x i8] c"-b : Mark corners/edges with single black points instead of black with white border; corners or edges mode\00", align 1
@str.42 = private unnamed_addr constant [90 x i8] c"-p : Output initial enhancement image only; corners or edges mode (default is edges mode)\00", align 1
@str.43 = private unnamed_addr constant [76 x i8] c"\0ASUSAN Version 2l (C) 1995-1997 Stephen Smith, DRA UK. steve@fmrib.ox.ac.uk\00", align 1
@str.44 = private unnamed_addr constant [60 x i8] c"Either reduce it to <=15 or recompile with variable \22total\22\00", align 1
@str.45 = private unnamed_addr constant [39 x i8] c"as a float: see top \22defines\22 section.\00", align 1
@str.46 = private unnamed_addr constant [25 x i8] c"No argument following -t\00", align 1
@str.47 = private unnamed_addr constant [25 x i8] c"No argument following -d\00", align 1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #21
  %i2 = tail call noalias ptr @fopen(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1)
  %i3 = icmp eq ptr %i2, null
  br i1 %i3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i6 = tail call i64 @fwrite(ptr nonnull @.str.2, i64 28, i64 1, ptr %i5) #22
  br label %bb17

bb7:                                              ; preds = %bb
  %i8 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i2, ptr noundef nonnull @.str.3, ptr noundef nonnull %i) #21
  %i9 = call i32 @fclose(ptr noundef nonnull %i2)
  %i10 = load i64, ptr %i, align 8, !tbaa !12
  %i11 = icmp sgt i64 %i10, 0
  br i1 %i11, label %bb12.preheader, label %bb7.bb17_crit_edge

bb7.bb17_crit_edge:                               ; preds = %bb7
  br label %bb17

bb12.preheader:                                   ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb12.bb12_crit_edge, %bb12.preheader
  %i13 = phi i64 [ %i14, %bb12.bb12_crit_edge ], [ 0, %bb12.preheader ]
  call void @main1(i32 noundef %arg, ptr noundef %arg1) #21
  %i14 = add nuw nsw i64 %i13, 1
  %i15 = load i64, ptr %i, align 8, !tbaa !12
  %i16 = icmp slt i64 %i14, %i15
  br i1 %i16, label %bb12.bb12_crit_edge, label %bb17.loopexit, !llvm.loop !14

bb12.bb12_crit_edge:                              ; preds = %bb12
  br label %bb12

bb17.loopexit:                                    ; preds = %bb12
  br label %bb17

bb17:                                             ; preds = %bb7.bb17_crit_edge, %bb17.loopexit, %bb4
  %i18 = phi i32 [ 1, %bb4 ], [ 0, %bb7.bb17_crit_edge ], [ 0, %bb17.loopexit ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #21
  ret i32 %i18
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #3

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define dso_local void @usage() local_unnamed_addr #5 {
bb:
  %i = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %i1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.32)
  %i2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.33)
  %i3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.34)
  %i4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.35)
  %i5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.36)
  %i6 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.37)
  %i7 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.38)
  %i8 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.39)
  %i9 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.40)
  %i10 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.41)
  %i11 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.42)
  %i12 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.43)
  tail call void @exit(i32 noundef 0) #23
  unreachable
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define dso_local i32 @getint(ptr nocapture noundef %arg) local_unnamed_addr #0 {
bb:
  %i = alloca [10000 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 10000, ptr nonnull %i) #21
  br label %bb1

bb1:                                              ; preds = %bb8.bb1_crit_edge, %bb
  %i2 = call i32 @getc(ptr noundef %arg)
  switch i32 %i2, label %bb1.bb8_crit_edge [
    i32 35, label %bb3
    i32 -1, label %bb5
  ]

bb1.bb8_crit_edge:                                ; preds = %bb1
  br label %bb8

bb3:                                              ; preds = %bb1
  %i4 = call ptr @fgets(ptr noundef nonnull %i, i32 noundef 9000, ptr noundef %arg)
  br label %bb8

bb5:                                              ; preds = %bb1
  %i6 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i6, ptr noundef nonnull @.str.13, ptr noundef nonnull @.str.14) #22
  call void @exit(i32 noundef 0) #23
  unreachable

bb8:                                              ; preds = %bb1.bb8_crit_edge, %bb3
  %i9 = add i32 %i2, -48
  %i10 = icmp ult i32 %i9, 10
  br i1 %i10, label %bb11.preheader, label %bb8.bb1_crit_edge, !llvm.loop !17

bb8.bb1_crit_edge:                                ; preds = %bb8
  br label %bb1

bb11.preheader:                                   ; preds = %bb8
  br label %bb11

bb11:                                             ; preds = %bb11.bb11_crit_edge, %bb11.preheader
  %i12 = phi i32 [ %i17, %bb11.bb11_crit_edge ], [ %i2, %bb11.preheader ]
  %i13 = phi i32 [ %i16, %bb11.bb11_crit_edge ], [ 0, %bb11.preheader ]
  %i14 = mul nsw i32 %i13, 10
  %i15 = add nsw i32 %i12, -48
  %i16 = add nsw i32 %i15, %i14
  %i17 = call i32 @getc(ptr noundef %arg)
  %i18 = add i32 %i17, -58
  %i19 = icmp ult i32 %i18, -10
  br i1 %i19, label %bb20, label %bb11.bb11_crit_edge, !llvm.loop !18

bb11.bb11_crit_edge:                              ; preds = %bb11
  br label %bb11

bb20:                                             ; preds = %bb11
  call void @llvm.lifetime.end.p0(i64 10000, ptr nonnull %i) #21
  ret i32 %i16
}

; Function Attrs: nofree nounwind
declare noundef i32 @getc(ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef ptr @fgets(ptr noundef, i32 noundef, ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @get_image(ptr noundef %arg, ptr nocapture noundef writeonly %arg1, ptr nocapture noundef %arg2, ptr nocapture noundef %arg3) local_unnamed_addr #0 {
bb:
  %i = tail call noalias ptr @fopen(ptr noundef %arg, ptr noundef nonnull @.str.15)
  %i4 = icmp eq ptr %i, null
  br i1 %i4, label %bb5, label %bb8

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i7 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i6, ptr noundef nonnull @.str.16, ptr noundef %arg) #22
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb8:                                              ; preds = %bb
  %i9 = tail call i32 @fgetc(ptr noundef nonnull %i)
  %i10 = tail call i32 @fgetc(ptr noundef nonnull %i)
  %i11 = and i32 %i9, 255
  %i12 = icmp eq i32 %i11, 80
  %i13 = and i32 %i10, 255
  %i14 = icmp eq i32 %i13, 53
  %i15 = and i1 %i12, %i14
  br i1 %i15, label %bb19, label %bb16

bb16:                                             ; preds = %bb8
  %i17 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i18 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i17, ptr noundef nonnull @.str.17, ptr noundef %arg) #22
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb19:                                             ; preds = %bb8
  %i20 = tail call i32 @getint(ptr noundef nonnull %i)
  store i32 %i20, ptr %arg2, align 4, !tbaa !19
  %i21 = tail call i32 @getint(ptr noundef nonnull %i)
  store i32 %i21, ptr %arg3, align 4, !tbaa !19
  %i22 = tail call i32 @getint(ptr noundef nonnull %i)
  %i23 = load i32, ptr %arg2, align 4, !tbaa !19
  %i24 = load i32, ptr %arg3, align 4, !tbaa !19
  %i25 = mul nsw i32 %i24, %i23
  %i26 = sext i32 %i25 to i64
  %i27 = tail call noalias ptr @malloc(i64 noundef %i26) #24
  store ptr %i27, ptr %arg1, align 8, !tbaa !8
  %i28 = tail call i64 @fread(ptr noundef %i27, i64 noundef 1, i64 noundef %i26, ptr noundef nonnull %i)
  %i29 = icmp eq i64 %i28, 0
  br i1 %i29, label %bb30, label %bb33

bb30:                                             ; preds = %bb19
  %i31 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i32 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i31, ptr noundef nonnull @.str.18, ptr noundef %arg) #22
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb33:                                             ; preds = %bb19
  %i34 = tail call i32 @fclose(ptr noundef nonnull %i)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @fgetc(ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare noundef i64 @fread(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @put_image(ptr noundef %arg, ptr nocapture noundef %arg1, i32 noundef %arg2, i32 noundef %arg3) local_unnamed_addr #0 {
bb:
  %i = tail call noalias ptr @fopen(ptr noundef %arg, ptr noundef nonnull @.str.19)
  %i4 = icmp eq ptr %i, null
  br i1 %i4, label %bb5, label %bb8

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i7 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i6, ptr noundef nonnull @.str.20, ptr noundef %arg) #22
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb8:                                              ; preds = %bb
  %i9 = tail call i64 @fwrite(ptr nonnull @.str.21, i64 3, i64 1, ptr nonnull %i)
  %i10 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef nonnull %i, ptr noundef nonnull @.str.22, i32 noundef %arg2, i32 noundef %arg3)
  %i11 = tail call i64 @fwrite(ptr nonnull @.str.23, i64 4, i64 1, ptr nonnull %i)
  %i12 = mul nsw i32 %arg3, %arg2
  %i13 = sext i32 %i12 to i64
  %i14 = tail call i64 @fwrite(ptr noundef %arg1, i64 noundef %i13, i64 noundef 1, ptr noundef nonnull %i)
  %i15 = icmp eq i64 %i14, 1
  br i1 %i15, label %bb19, label %bb16

bb16:                                             ; preds = %bb8
  %i17 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i18 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i17, ptr noundef nonnull @.str.24, ptr noundef %arg) #22
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb19:                                             ; preds = %bb8
  %i20 = tail call i32 @fclose(ptr noundef nonnull %i)
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @int_to_uchar(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, i32 noundef %arg2) local_unnamed_addr #8 {
bb:
  %i = load i32, ptr %arg, align 4, !tbaa !19
  %i3 = icmp sgt i32 %arg2, 0
  br i1 %i3, label %bb4, label %bb.bb16_crit_edge

bb.bb16_crit_edge:                                ; preds = %bb
  br label %bb16

bb4:                                              ; preds = %bb
  %i5 = zext nneg i32 %arg2 to i64
  br label %bb6

bb6:                                              ; preds = %bb6.bb6_crit_edge, %bb4
  %i7 = phi i64 [ 0, %bb4 ], [ %i14, %bb6.bb6_crit_edge ]
  %i8 = phi i32 [ %i, %bb4 ], [ %i13, %bb6.bb6_crit_edge ]
  %i9 = phi i32 [ %i, %bb4 ], [ %i12, %bb6.bb6_crit_edge ]
  %i10 = getelementptr inbounds i32, ptr %arg, i64 %i7
  %i11 = load i32, ptr %i10, align 4, !tbaa !19
  %i12 = tail call i32 @llvm.smax.i32(i32 %i11, i32 %i9)
  %i13 = tail call i32 @llvm.smin.i32(i32 %i11, i32 %i8)
  %i14 = add nuw nsw i64 %i7, 1
  %i15 = icmp eq i64 %i14, %i5
  br i1 %i15, label %bb16.loopexit, label %bb6.bb6_crit_edge, !llvm.loop !21

bb6.bb6_crit_edge:                                ; preds = %bb6
  br label %bb6

bb16.loopexit:                                    ; preds = %bb6
  br label %bb16

bb16:                                             ; preds = %bb.bb16_crit_edge, %bb16.loopexit
  %i17 = phi i32 [ %i, %bb.bb16_crit_edge ], [ %i12, %bb16.loopexit ]
  %i18 = phi i32 [ %i, %bb.bb16_crit_edge ], [ %i13, %bb16.loopexit ]
  %i19 = sub nsw i32 %i17, %i18
  %i20 = icmp sgt i32 %arg2, 0
  br i1 %i20, label %bb21, label %bb16.bb34_crit_edge

bb16.bb34_crit_edge:                              ; preds = %bb16
  br label %bb34

bb21:                                             ; preds = %bb16
  %i22 = zext nneg i32 %arg2 to i64
  br label %bb23

bb23:                                             ; preds = %bb23.bb23_crit_edge, %bb21
  %i24 = phi i64 [ 0, %bb21 ], [ %i32, %bb23.bb23_crit_edge ]
  %i25 = getelementptr inbounds i32, ptr %arg, i64 %i24
  %i26 = load i32, ptr %i25, align 4, !tbaa !19
  %i27 = sub nsw i32 %i26, %i18
  %i28 = mul nsw i32 %i27, 255
  %i29 = sdiv i32 %i28, %i19
  %i30 = trunc i32 %i29 to i8
  %i31 = getelementptr inbounds i8, ptr %arg1, i64 %i24
  store i8 %i30, ptr %i31, align 1, !tbaa !22
  %i32 = add nuw nsw i64 %i24, 1
  %i33 = icmp eq i64 %i32, %i22
  br i1 %i33, label %bb34.loopexit, label %bb23.bb23_crit_edge, !llvm.loop !23

bb23.bb23_crit_edge:                              ; preds = %bb23
  br label %bb23

bb34.loopexit:                                    ; preds = %bb23
  br label %bb34

bb34:                                             ; preds = %bb16.bb34_crit_edge, %bb34.loopexit
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #9

; Function Attrs: nofree nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite) uwtable
define dso_local void @setup_brightness_lut(ptr nocapture noundef %arg, i32 noundef %arg1, i32 noundef %arg2) local_unnamed_addr #10 {
bb:
  %i = tail call noalias dereferenceable_or_null(516) ptr @malloc(i64 noundef 516) #24
  %i3 = getelementptr inbounds i8, ptr %i, i64 258
  store ptr %i3, ptr %arg, align 8, !tbaa !8
  %i4 = sitofp i32 %arg1 to float
  %i5 = icmp eq i32 %arg2, 6
  br label %bb6

bb6:                                              ; preds = %bb6.bb6_crit_edge, %bb
  %i7 = phi i64 [ -256, %bb ], [ %i22, %bb6.bb6_crit_edge ]
  %i8 = trunc i64 %i7 to i32
  %i9 = sitofp i32 %i8 to float
  %i10 = fdiv float %i9, %i4
  %i11 = fpext float %i10 to double
  %i12 = fmul double %i11, %i11
  %i13 = fmul double %i12, %i12
  %i14 = select i1 %i5, double %i13, double 1.000000e+00
  %i15 = fneg double %i12
  %i16 = fmul double %i14, %i15
  %i17 = tail call double @exp(double noundef %i16) #21
  %i18 = fmul double %i17, 1.000000e+02
  %i19 = fptoui double %i18 to i8
  %i20 = load ptr, ptr %arg, align 8, !tbaa !8
  %i21 = getelementptr inbounds i8, ptr %i20, i64 %i7
  store i8 %i19, ptr %i21, align 1, !tbaa !22
  %i22 = add nsw i64 %i7, 1
  %i23 = icmp eq i64 %i22, 257
  br i1 %i23, label %bb24, label %bb6.bb6_crit_edge, !llvm.loop !24

bb6.bb6_crit_edge:                                ; preds = %bb6
  br label %bb6

bb24:                                             ; preds = %bb6
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare double @exp(double noundef) local_unnamed_addr #11

; Function Attrs: mustprogress nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) uwtable
define dso_local void @free_brightness_lut(ptr nocapture noundef %arg) local_unnamed_addr #12 {
bb:
  %i = getelementptr inbounds i8, ptr %arg, i64 -258
  tail call void @free(ptr noundef %i) #21
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #13

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable
define dso_local void @susan_principle(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, ptr nocapture noundef readonly %arg2, i32 noundef %arg3, i32 noundef %arg4, i32 noundef %arg5) local_unnamed_addr #14 {
bb:
  %i = mul nsw i32 %arg5, %arg4
  %i6 = sext i32 %i to i64
  %i7 = shl nsw i64 %i6, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %arg1, i8 0, i64 %i7, i1 false)
  %i8 = icmp sgt i32 %arg5, 6
  br i1 %i8, label %bb9, label %bb.bb335_crit_edge

bb.bb335_crit_edge:                               ; preds = %bb
  br label %bb335

bb9:                                              ; preds = %bb
  %i10 = add nsw i32 %arg5, -3
  %i11 = add i32 %arg4, -3
  %i12 = icmp sgt i32 %arg4, 6
  %i13 = sext i32 %i11 to i64
  %i14 = add nsw i32 %arg4, -5
  %i15 = sext i32 %i14 to i64
  %i16 = add nsw i32 %arg4, -6
  %i17 = sext i32 %i16 to i64
  %i18 = sext i32 %arg4 to i64
  %i19 = zext i32 %i10 to i64
  %i20 = zext i32 %i11 to i64
  br label %bb21

bb21:                                             ; preds = %bb332.bb21_crit_edge, %bb9
  %i22 = phi i64 [ 3, %bb9 ], [ %i333, %bb332.bb21_crit_edge ]
  br i1 %i12, label %bb23, label %bb21.bb332_crit_edge

bb21.bb332_crit_edge:                             ; preds = %bb21
  br label %bb332

bb23:                                             ; preds = %bb21
  %i24 = add nsw i64 %i22, -3
  %i25 = mul nsw i64 %i24, %i18
  %i26 = getelementptr inbounds i8, ptr %arg, i64 %i25
  %i27 = trunc i64 %i22 to i32
  %i28 = mul i32 %i27, %arg4
  %i29 = zext i32 %i28 to i64
  br label %bb30

bb30:                                             ; preds = %bb329.bb30_crit_edge, %bb23
  %i31 = phi i64 [ 3, %bb23 ], [ %i330, %bb329.bb30_crit_edge ]
  %i32 = getelementptr inbounds i8, ptr %i26, i64 %i31
  %i33 = getelementptr inbounds i8, ptr %i32, i64 -1
  %i34 = add nuw nsw i64 %i31, %i29
  %i35 = getelementptr inbounds i8, ptr %arg, i64 %i34
  %i36 = load i8, ptr %i35, align 1, !tbaa !22
  %i37 = zext i8 %i36 to i64
  %i38 = getelementptr inbounds i8, ptr %arg2, i64 %i37
  %i39 = load i8, ptr %i33, align 1, !tbaa !22
  %i40 = zext i8 %i39 to i64
  %i41 = sub nsw i64 0, %i40
  %i42 = getelementptr inbounds i8, ptr %i38, i64 %i41
  %i43 = load i8, ptr %i42, align 1, !tbaa !22
  %i44 = zext i8 %i43 to i32
  %i45 = add nuw nsw i32 %i44, 100
  %i46 = getelementptr inbounds i8, ptr %i32, i64 1
  %i47 = load i8, ptr %i32, align 1, !tbaa !22
  %i48 = zext i8 %i47 to i64
  %i49 = sub nsw i64 0, %i48
  %i50 = getelementptr inbounds i8, ptr %i38, i64 %i49
  %i51 = load i8, ptr %i50, align 1, !tbaa !22
  %i52 = zext i8 %i51 to i32
  %i53 = add nuw nsw i32 %i45, %i52
  %i54 = load i8, ptr %i46, align 1, !tbaa !22
  %i55 = zext i8 %i54 to i64
  %i56 = sub nsw i64 0, %i55
  %i57 = getelementptr inbounds i8, ptr %i38, i64 %i56
  %i58 = load i8, ptr %i57, align 1, !tbaa !22
  %i59 = zext i8 %i58 to i32
  %i60 = add nuw nsw i32 %i53, %i59
  %i61 = getelementptr inbounds i8, ptr %i46, i64 %i13
  %i62 = getelementptr inbounds i8, ptr %i61, i64 1
  %i63 = load i8, ptr %i61, align 1, !tbaa !22
  %i64 = zext i8 %i63 to i64
  %i65 = sub nsw i64 0, %i64
  %i66 = getelementptr inbounds i8, ptr %i38, i64 %i65
  %i67 = load i8, ptr %i66, align 1, !tbaa !22
  %i68 = zext i8 %i67 to i32
  %i69 = add nuw nsw i32 %i60, %i68
  %i70 = getelementptr inbounds i8, ptr %i61, i64 2
  %i71 = load i8, ptr %i62, align 1, !tbaa !22
  %i72 = zext i8 %i71 to i64
  %i73 = sub nsw i64 0, %i72
  %i74 = getelementptr inbounds i8, ptr %i38, i64 %i73
  %i75 = load i8, ptr %i74, align 1, !tbaa !22
  %i76 = zext i8 %i75 to i32
  %i77 = add nuw nsw i32 %i69, %i76
  %i78 = getelementptr inbounds i8, ptr %i61, i64 3
  %i79 = load i8, ptr %i70, align 1, !tbaa !22
  %i80 = zext i8 %i79 to i64
  %i81 = sub nsw i64 0, %i80
  %i82 = getelementptr inbounds i8, ptr %i38, i64 %i81
  %i83 = load i8, ptr %i82, align 1, !tbaa !22
  %i84 = zext i8 %i83 to i32
  %i85 = add nuw nsw i32 %i77, %i84
  %i86 = getelementptr inbounds i8, ptr %i61, i64 4
  %i87 = load i8, ptr %i78, align 1, !tbaa !22
  %i88 = zext i8 %i87 to i64
  %i89 = sub nsw i64 0, %i88
  %i90 = getelementptr inbounds i8, ptr %i38, i64 %i89
  %i91 = load i8, ptr %i90, align 1, !tbaa !22
  %i92 = zext i8 %i91 to i32
  %i93 = add nuw nsw i32 %i85, %i92
  %i94 = load i8, ptr %i86, align 1, !tbaa !22
  %i95 = zext i8 %i94 to i64
  %i96 = sub nsw i64 0, %i95
  %i97 = getelementptr inbounds i8, ptr %i38, i64 %i96
  %i98 = load i8, ptr %i97, align 1, !tbaa !22
  %i99 = zext i8 %i98 to i32
  %i100 = add nuw nsw i32 %i93, %i99
  %i101 = getelementptr inbounds i8, ptr %i86, i64 %i15
  %i102 = getelementptr inbounds i8, ptr %i101, i64 1
  %i103 = load i8, ptr %i101, align 1, !tbaa !22
  %i104 = zext i8 %i103 to i64
  %i105 = sub nsw i64 0, %i104
  %i106 = getelementptr inbounds i8, ptr %i38, i64 %i105
  %i107 = load i8, ptr %i106, align 1, !tbaa !22
  %i108 = zext i8 %i107 to i32
  %i109 = add nuw nsw i32 %i100, %i108
  %i110 = getelementptr inbounds i8, ptr %i101, i64 2
  %i111 = load i8, ptr %i102, align 1, !tbaa !22
  %i112 = zext i8 %i111 to i64
  %i113 = sub nsw i64 0, %i112
  %i114 = getelementptr inbounds i8, ptr %i38, i64 %i113
  %i115 = load i8, ptr %i114, align 1, !tbaa !22
  %i116 = zext i8 %i115 to i32
  %i117 = add nuw nsw i32 %i109, %i116
  %i118 = getelementptr inbounds i8, ptr %i101, i64 3
  %i119 = load i8, ptr %i110, align 1, !tbaa !22
  %i120 = zext i8 %i119 to i64
  %i121 = sub nsw i64 0, %i120
  %i122 = getelementptr inbounds i8, ptr %i38, i64 %i121
  %i123 = load i8, ptr %i122, align 1, !tbaa !22
  %i124 = zext i8 %i123 to i32
  %i125 = add nuw nsw i32 %i117, %i124
  %i126 = getelementptr inbounds i8, ptr %i101, i64 4
  %i127 = load i8, ptr %i118, align 1, !tbaa !22
  %i128 = zext i8 %i127 to i64
  %i129 = sub nsw i64 0, %i128
  %i130 = getelementptr inbounds i8, ptr %i38, i64 %i129
  %i131 = load i8, ptr %i130, align 1, !tbaa !22
  %i132 = zext i8 %i131 to i32
  %i133 = add nuw nsw i32 %i125, %i132
  %i134 = getelementptr inbounds i8, ptr %i101, i64 5
  %i135 = load i8, ptr %i126, align 1, !tbaa !22
  %i136 = zext i8 %i135 to i64
  %i137 = sub nsw i64 0, %i136
  %i138 = getelementptr inbounds i8, ptr %i38, i64 %i137
  %i139 = load i8, ptr %i138, align 1, !tbaa !22
  %i140 = zext i8 %i139 to i32
  %i141 = add nuw nsw i32 %i133, %i140
  %i142 = getelementptr inbounds i8, ptr %i101, i64 6
  %i143 = load i8, ptr %i134, align 1, !tbaa !22
  %i144 = zext i8 %i143 to i64
  %i145 = sub nsw i64 0, %i144
  %i146 = getelementptr inbounds i8, ptr %i38, i64 %i145
  %i147 = load i8, ptr %i146, align 1, !tbaa !22
  %i148 = zext i8 %i147 to i32
  %i149 = add nuw nsw i32 %i141, %i148
  %i150 = load i8, ptr %i142, align 1, !tbaa !22
  %i151 = zext i8 %i150 to i64
  %i152 = sub nsw i64 0, %i151
  %i153 = getelementptr inbounds i8, ptr %i38, i64 %i152
  %i154 = load i8, ptr %i153, align 1, !tbaa !22
  %i155 = zext i8 %i154 to i32
  %i156 = add nuw nsw i32 %i149, %i155
  %i157 = getelementptr inbounds i8, ptr %i142, i64 %i17
  %i158 = getelementptr inbounds i8, ptr %i157, i64 1
  %i159 = load i8, ptr %i157, align 1, !tbaa !22
  %i160 = zext i8 %i159 to i64
  %i161 = sub nsw i64 0, %i160
  %i162 = getelementptr inbounds i8, ptr %i38, i64 %i161
  %i163 = load i8, ptr %i162, align 1, !tbaa !22
  %i164 = zext i8 %i163 to i32
  %i165 = add nuw nsw i32 %i156, %i164
  %i166 = getelementptr inbounds i8, ptr %i157, i64 2
  %i167 = load i8, ptr %i158, align 1, !tbaa !22
  %i168 = zext i8 %i167 to i64
  %i169 = sub nsw i64 0, %i168
  %i170 = getelementptr inbounds i8, ptr %i38, i64 %i169
  %i171 = load i8, ptr %i170, align 1, !tbaa !22
  %i172 = zext i8 %i171 to i32
  %i173 = add nuw nsw i32 %i165, %i172
  %i174 = load i8, ptr %i166, align 1, !tbaa !22
  %i175 = zext i8 %i174 to i64
  %i176 = sub nsw i64 0, %i175
  %i177 = getelementptr inbounds i8, ptr %i38, i64 %i176
  %i178 = load i8, ptr %i177, align 1, !tbaa !22
  %i179 = zext i8 %i178 to i32
  %i180 = add nuw nsw i32 %i173, %i179
  %i181 = getelementptr inbounds i8, ptr %i157, i64 4
  %i182 = getelementptr inbounds i8, ptr %i157, i64 5
  %i183 = load i8, ptr %i181, align 1, !tbaa !22
  %i184 = zext i8 %i183 to i64
  %i185 = sub nsw i64 0, %i184
  %i186 = getelementptr inbounds i8, ptr %i38, i64 %i185
  %i187 = load i8, ptr %i186, align 1, !tbaa !22
  %i188 = zext i8 %i187 to i32
  %i189 = add nuw nsw i32 %i180, %i188
  %i190 = getelementptr inbounds i8, ptr %i157, i64 6
  %i191 = load i8, ptr %i182, align 1, !tbaa !22
  %i192 = zext i8 %i191 to i64
  %i193 = sub nsw i64 0, %i192
  %i194 = getelementptr inbounds i8, ptr %i38, i64 %i193
  %i195 = load i8, ptr %i194, align 1, !tbaa !22
  %i196 = zext i8 %i195 to i32
  %i197 = add nuw nsw i32 %i189, %i196
  %i198 = load i8, ptr %i190, align 1, !tbaa !22
  %i199 = zext i8 %i198 to i64
  %i200 = sub nsw i64 0, %i199
  %i201 = getelementptr inbounds i8, ptr %i38, i64 %i200
  %i202 = load i8, ptr %i201, align 1, !tbaa !22
  %i203 = zext i8 %i202 to i32
  %i204 = add nuw nsw i32 %i197, %i203
  %i205 = getelementptr inbounds i8, ptr %i190, i64 %i17
  %i206 = getelementptr inbounds i8, ptr %i205, i64 1
  %i207 = load i8, ptr %i205, align 1, !tbaa !22
  %i208 = zext i8 %i207 to i64
  %i209 = sub nsw i64 0, %i208
  %i210 = getelementptr inbounds i8, ptr %i38, i64 %i209
  %i211 = load i8, ptr %i210, align 1, !tbaa !22
  %i212 = zext i8 %i211 to i32
  %i213 = add nuw nsw i32 %i204, %i212
  %i214 = getelementptr inbounds i8, ptr %i205, i64 2
  %i215 = load i8, ptr %i206, align 1, !tbaa !22
  %i216 = zext i8 %i215 to i64
  %i217 = sub nsw i64 0, %i216
  %i218 = getelementptr inbounds i8, ptr %i38, i64 %i217
  %i219 = load i8, ptr %i218, align 1, !tbaa !22
  %i220 = zext i8 %i219 to i32
  %i221 = add nuw nsw i32 %i213, %i220
  %i222 = getelementptr inbounds i8, ptr %i205, i64 3
  %i223 = load i8, ptr %i214, align 1, !tbaa !22
  %i224 = zext i8 %i223 to i64
  %i225 = sub nsw i64 0, %i224
  %i226 = getelementptr inbounds i8, ptr %i38, i64 %i225
  %i227 = load i8, ptr %i226, align 1, !tbaa !22
  %i228 = zext i8 %i227 to i32
  %i229 = add nuw nsw i32 %i221, %i228
  %i230 = getelementptr inbounds i8, ptr %i205, i64 4
  %i231 = load i8, ptr %i222, align 1, !tbaa !22
  %i232 = zext i8 %i231 to i64
  %i233 = sub nsw i64 0, %i232
  %i234 = getelementptr inbounds i8, ptr %i38, i64 %i233
  %i235 = load i8, ptr %i234, align 1, !tbaa !22
  %i236 = zext i8 %i235 to i32
  %i237 = add nuw nsw i32 %i229, %i236
  %i238 = getelementptr inbounds i8, ptr %i205, i64 5
  %i239 = load i8, ptr %i230, align 1, !tbaa !22
  %i240 = zext i8 %i239 to i64
  %i241 = sub nsw i64 0, %i240
  %i242 = getelementptr inbounds i8, ptr %i38, i64 %i241
  %i243 = load i8, ptr %i242, align 1, !tbaa !22
  %i244 = zext i8 %i243 to i32
  %i245 = add nuw nsw i32 %i237, %i244
  %i246 = getelementptr inbounds i8, ptr %i205, i64 6
  %i247 = load i8, ptr %i238, align 1, !tbaa !22
  %i248 = zext i8 %i247 to i64
  %i249 = sub nsw i64 0, %i248
  %i250 = getelementptr inbounds i8, ptr %i38, i64 %i249
  %i251 = load i8, ptr %i250, align 1, !tbaa !22
  %i252 = zext i8 %i251 to i32
  %i253 = add nuw nsw i32 %i245, %i252
  %i254 = load i8, ptr %i246, align 1, !tbaa !22
  %i255 = zext i8 %i254 to i64
  %i256 = sub nsw i64 0, %i255
  %i257 = getelementptr inbounds i8, ptr %i38, i64 %i256
  %i258 = load i8, ptr %i257, align 1, !tbaa !22
  %i259 = zext i8 %i258 to i32
  %i260 = add nuw nsw i32 %i253, %i259
  %i261 = getelementptr inbounds i8, ptr %i246, i64 %i15
  %i262 = getelementptr inbounds i8, ptr %i261, i64 1
  %i263 = load i8, ptr %i261, align 1, !tbaa !22
  %i264 = zext i8 %i263 to i64
  %i265 = sub nsw i64 0, %i264
  %i266 = getelementptr inbounds i8, ptr %i38, i64 %i265
  %i267 = load i8, ptr %i266, align 1, !tbaa !22
  %i268 = zext i8 %i267 to i32
  %i269 = add nuw nsw i32 %i260, %i268
  %i270 = getelementptr inbounds i8, ptr %i261, i64 2
  %i271 = load i8, ptr %i262, align 1, !tbaa !22
  %i272 = zext i8 %i271 to i64
  %i273 = sub nsw i64 0, %i272
  %i274 = getelementptr inbounds i8, ptr %i38, i64 %i273
  %i275 = load i8, ptr %i274, align 1, !tbaa !22
  %i276 = zext i8 %i275 to i32
  %i277 = add nuw nsw i32 %i269, %i276
  %i278 = getelementptr inbounds i8, ptr %i261, i64 3
  %i279 = load i8, ptr %i270, align 1, !tbaa !22
  %i280 = zext i8 %i279 to i64
  %i281 = sub nsw i64 0, %i280
  %i282 = getelementptr inbounds i8, ptr %i38, i64 %i281
  %i283 = load i8, ptr %i282, align 1, !tbaa !22
  %i284 = zext i8 %i283 to i32
  %i285 = add nuw nsw i32 %i277, %i284
  %i286 = getelementptr inbounds i8, ptr %i261, i64 4
  %i287 = load i8, ptr %i278, align 1, !tbaa !22
  %i288 = zext i8 %i287 to i64
  %i289 = sub nsw i64 0, %i288
  %i290 = getelementptr inbounds i8, ptr %i38, i64 %i289
  %i291 = load i8, ptr %i290, align 1, !tbaa !22
  %i292 = zext i8 %i291 to i32
  %i293 = add nuw nsw i32 %i285, %i292
  %i294 = load i8, ptr %i286, align 1, !tbaa !22
  %i295 = zext i8 %i294 to i64
  %i296 = sub nsw i64 0, %i295
  %i297 = getelementptr inbounds i8, ptr %i38, i64 %i296
  %i298 = load i8, ptr %i297, align 1, !tbaa !22
  %i299 = zext i8 %i298 to i32
  %i300 = add nuw nsw i32 %i293, %i299
  %i301 = getelementptr inbounds i8, ptr %i286, i64 %i13
  %i302 = getelementptr inbounds i8, ptr %i301, i64 1
  %i303 = load i8, ptr %i301, align 1, !tbaa !22
  %i304 = zext i8 %i303 to i64
  %i305 = sub nsw i64 0, %i304
  %i306 = getelementptr inbounds i8, ptr %i38, i64 %i305
  %i307 = load i8, ptr %i306, align 1, !tbaa !22
  %i308 = zext i8 %i307 to i32
  %i309 = add nuw nsw i32 %i300, %i308
  %i310 = getelementptr inbounds i8, ptr %i301, i64 2
  %i311 = load i8, ptr %i302, align 1, !tbaa !22
  %i312 = zext i8 %i311 to i64
  %i313 = sub nsw i64 0, %i312
  %i314 = getelementptr inbounds i8, ptr %i38, i64 %i313
  %i315 = load i8, ptr %i314, align 1, !tbaa !22
  %i316 = zext i8 %i315 to i32
  %i317 = add nuw nsw i32 %i309, %i316
  %i318 = load i8, ptr %i310, align 1, !tbaa !22
  %i319 = zext i8 %i318 to i64
  %i320 = sub nsw i64 0, %i319
  %i321 = getelementptr inbounds i8, ptr %i38, i64 %i320
  %i322 = load i8, ptr %i321, align 1, !tbaa !22
  %i323 = zext i8 %i322 to i32
  %i324 = add nuw nsw i32 %i317, %i323
  %i325 = icmp sgt i32 %i324, %arg3
  br i1 %i325, label %bb30.bb329_crit_edge, label %bb326

bb30.bb329_crit_edge:                             ; preds = %bb30
  br label %bb329

bb326:                                            ; preds = %bb30
  %i327 = sub nsw i32 %arg3, %i324
  %i328 = getelementptr inbounds i32, ptr %arg1, i64 %i34
  store i32 %i327, ptr %i328, align 4, !tbaa !19
  br label %bb329

bb329:                                            ; preds = %bb30.bb329_crit_edge, %bb326
  %i330 = add nuw nsw i64 %i31, 1
  %i331 = icmp eq i64 %i330, %i20
  br i1 %i331, label %bb332.loopexit, label %bb329.bb30_crit_edge, !llvm.loop !25

bb329.bb30_crit_edge:                             ; preds = %bb329
  br label %bb30

bb332.loopexit:                                   ; preds = %bb329
  br label %bb332

bb332:                                            ; preds = %bb21.bb332_crit_edge, %bb332.loopexit
  %i333 = add nuw nsw i64 %i22, 1
  %i334 = icmp eq i64 %i333, %i19
  br i1 %i334, label %bb335.loopexit, label %bb332.bb21_crit_edge, !llvm.loop !26

bb332.bb21_crit_edge:                             ; preds = %bb332
  br label %bb21

bb335.loopexit:                                   ; preds = %bb332
  br label %bb335

bb335:                                            ; preds = %bb.bb335_crit_edge, %bb335.loopexit
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #15

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable
define dso_local void @susan_principle_small(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, ptr nocapture noundef readonly %arg2, i32 %arg3, i32 noundef %arg4, i32 noundef %arg5) local_unnamed_addr #14 {
bb:
  %i = mul nsw i32 %arg5, %arg4
  %i6 = sext i32 %i to i64
  %i7 = shl nsw i64 %i6, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %arg1, i8 0, i64 %i7, i1 false)
  %i8 = icmp sgt i32 %arg5, 2
  br i1 %i8, label %bb9, label %bb.bb108_crit_edge

bb.bb108_crit_edge:                               ; preds = %bb
  br label %bb108

bb9:                                              ; preds = %bb
  %i10 = add nsw i32 %arg5, -1
  %i11 = add i32 %arg4, -1
  %i12 = icmp sgt i32 %arg4, 2
  %i13 = add nsw i32 %arg4, -2
  %i14 = sext i32 %i13 to i64
  %i15 = sext i32 %arg4 to i64
  %i16 = zext i32 %i10 to i64
  %i17 = zext i32 %i11 to i64
  br label %bb18

bb18:                                             ; preds = %bb105.bb18_crit_edge, %bb9
  %i19 = phi i64 [ 1, %bb9 ], [ %i106, %bb105.bb18_crit_edge ]
  br i1 %i12, label %bb20, label %bb18.bb105_crit_edge

bb18.bb105_crit_edge:                             ; preds = %bb18
  br label %bb105

bb20:                                             ; preds = %bb18
  %i21 = add nsw i64 %i19, -1
  %i22 = mul nsw i64 %i21, %i15
  %i23 = getelementptr inbounds i8, ptr %arg, i64 %i22
  %i24 = trunc i64 %i19 to i32
  %i25 = mul i32 %i24, %arg4
  %i26 = zext i32 %i25 to i64
  br label %bb27

bb27:                                             ; preds = %bb102.bb27_crit_edge, %bb20
  %i28 = phi i64 [ 1, %bb20 ], [ %i103, %bb102.bb27_crit_edge ]
  %i29 = getelementptr inbounds i8, ptr %i23, i64 %i28
  %i30 = getelementptr inbounds i8, ptr %i29, i64 -1
  %i31 = add nuw nsw i64 %i28, %i26
  %i32 = getelementptr inbounds i8, ptr %arg, i64 %i31
  %i33 = load i8, ptr %i32, align 1, !tbaa !22
  %i34 = zext i8 %i33 to i64
  %i35 = getelementptr inbounds i8, ptr %arg2, i64 %i34
  %i36 = load i8, ptr %i30, align 1, !tbaa !22
  %i37 = zext i8 %i36 to i64
  %i38 = sub nsw i64 0, %i37
  %i39 = getelementptr inbounds i8, ptr %i35, i64 %i38
  %i40 = load i8, ptr %i39, align 1, !tbaa !22
  %i41 = zext i8 %i40 to i32
  %i42 = add nuw nsw i32 %i41, 100
  %i43 = getelementptr inbounds i8, ptr %i29, i64 1
  %i44 = load i8, ptr %i29, align 1, !tbaa !22
  %i45 = zext i8 %i44 to i64
  %i46 = sub nsw i64 0, %i45
  %i47 = getelementptr inbounds i8, ptr %i35, i64 %i46
  %i48 = load i8, ptr %i47, align 1, !tbaa !22
  %i49 = zext i8 %i48 to i32
  %i50 = add nuw nsw i32 %i42, %i49
  %i51 = load i8, ptr %i43, align 1, !tbaa !22
  %i52 = zext i8 %i51 to i64
  %i53 = sub nsw i64 0, %i52
  %i54 = getelementptr inbounds i8, ptr %i35, i64 %i53
  %i55 = load i8, ptr %i54, align 1, !tbaa !22
  %i56 = zext i8 %i55 to i32
  %i57 = add nuw nsw i32 %i50, %i56
  %i58 = getelementptr inbounds i8, ptr %i43, i64 %i14
  %i59 = load i8, ptr %i58, align 1, !tbaa !22
  %i60 = zext i8 %i59 to i64
  %i61 = sub nsw i64 0, %i60
  %i62 = getelementptr inbounds i8, ptr %i35, i64 %i61
  %i63 = load i8, ptr %i62, align 1, !tbaa !22
  %i64 = zext i8 %i63 to i32
  %i65 = add nuw nsw i32 %i57, %i64
  %i66 = getelementptr inbounds i8, ptr %i58, i64 2
  %i67 = load i8, ptr %i66, align 1, !tbaa !22
  %i68 = zext i8 %i67 to i64
  %i69 = sub nsw i64 0, %i68
  %i70 = getelementptr inbounds i8, ptr %i35, i64 %i69
  %i71 = load i8, ptr %i70, align 1, !tbaa !22
  %i72 = zext i8 %i71 to i32
  %i73 = add nuw nsw i32 %i65, %i72
  %i74 = getelementptr inbounds i8, ptr %i66, i64 %i14
  %i75 = getelementptr inbounds i8, ptr %i74, i64 1
  %i76 = load i8, ptr %i74, align 1, !tbaa !22
  %i77 = zext i8 %i76 to i64
  %i78 = sub nsw i64 0, %i77
  %i79 = getelementptr inbounds i8, ptr %i35, i64 %i78
  %i80 = load i8, ptr %i79, align 1, !tbaa !22
  %i81 = zext i8 %i80 to i32
  %i82 = add nuw nsw i32 %i73, %i81
  %i83 = getelementptr inbounds i8, ptr %i74, i64 2
  %i84 = load i8, ptr %i75, align 1, !tbaa !22
  %i85 = zext i8 %i84 to i64
  %i86 = sub nsw i64 0, %i85
  %i87 = getelementptr inbounds i8, ptr %i35, i64 %i86
  %i88 = load i8, ptr %i87, align 1, !tbaa !22
  %i89 = zext i8 %i88 to i32
  %i90 = add nuw nsw i32 %i82, %i89
  %i91 = load i8, ptr %i83, align 1, !tbaa !22
  %i92 = zext i8 %i91 to i64
  %i93 = sub nsw i64 0, %i92
  %i94 = getelementptr inbounds i8, ptr %i35, i64 %i93
  %i95 = load i8, ptr %i94, align 1, !tbaa !22
  %i96 = zext i8 %i95 to i32
  %i97 = add nuw nsw i32 %i90, %i96
  %i98 = icmp slt i32 %i97, 731
  br i1 %i98, label %bb99, label %bb27.bb102_crit_edge

bb27.bb102_crit_edge:                             ; preds = %bb27
  br label %bb102

bb99:                                             ; preds = %bb27
  %i100 = sub nuw nsw i32 730, %i97
  %i101 = getelementptr inbounds i32, ptr %arg1, i64 %i31
  store i32 %i100, ptr %i101, align 4, !tbaa !19
  br label %bb102

bb102:                                            ; preds = %bb27.bb102_crit_edge, %bb99
  %i103 = add nuw nsw i64 %i28, 1
  %i104 = icmp eq i64 %i103, %i17
  br i1 %i104, label %bb105.loopexit, label %bb102.bb27_crit_edge, !llvm.loop !27

bb102.bb27_crit_edge:                             ; preds = %bb102
  br label %bb27

bb105.loopexit:                                   ; preds = %bb102
  br label %bb105

bb105:                                            ; preds = %bb18.bb105_crit_edge, %bb105.loopexit
  %i106 = add nuw nsw i64 %i19, 1
  %i107 = icmp eq i64 %i106, %i16
  br i1 %i107, label %bb108.loopexit, label %bb105.bb18_crit_edge, !llvm.loop !28

bb105.bb18_crit_edge:                             ; preds = %bb105
  br label %bb18

bb108.loopexit:                                   ; preds = %bb105
  br label %bb108

bb108:                                            ; preds = %bb.bb108_crit_edge, %bb108.loopexit
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) uwtable
define dso_local zeroext i8 @median(ptr nocapture noundef readonly %arg, i32 noundef %arg1, i32 noundef %arg2, i32 noundef %arg3) local_unnamed_addr #16 {
bb:
  %i = alloca [8 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %i) #21
  %i4 = add nsw i32 %arg1, -1
  %i5 = mul nsw i32 %i4, %arg3
  %i6 = add nsw i32 %i5, %arg2
  %i7 = sext i32 %i6 to i64
  %i8 = getelementptr i8, ptr %arg, i64 %i7
  %i9 = getelementptr i8, ptr %i8, i64 -1
  %i10 = load i8, ptr %i9, align 1, !tbaa !22
  %i11 = zext i8 %i10 to i32
  store i32 %i11, ptr %i, align 16, !tbaa !19
  %i12 = load i8, ptr %i8, align 1, !tbaa !22
  %i13 = zext i8 %i12 to i32
  %i14 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 1
  store i32 %i13, ptr %i14, align 4, !tbaa !19
  %i15 = getelementptr i8, ptr %i8, i64 1
  %i16 = load i8, ptr %i15, align 1, !tbaa !22
  %i17 = zext i8 %i16 to i32
  %i18 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 2
  store i32 %i17, ptr %i18, align 8, !tbaa !19
  %i19 = mul nsw i32 %arg3, %arg1
  %i20 = add nsw i32 %i19, %arg2
  %i21 = sext i32 %i20 to i64
  %i22 = getelementptr i8, ptr %arg, i64 %i21
  %i23 = getelementptr i8, ptr %i22, i64 -1
  %i24 = load i8, ptr %i23, align 1, !tbaa !22
  %i25 = zext i8 %i24 to i32
  %i26 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 3
  store i32 %i25, ptr %i26, align 4, !tbaa !19
  %i27 = getelementptr i8, ptr %i22, i64 1
  %i28 = load i8, ptr %i27, align 1, !tbaa !22
  %i29 = zext i8 %i28 to i32
  %i30 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 4
  store i32 %i29, ptr %i30, align 16, !tbaa !19
  %i31 = add nsw i32 %arg1, 1
  %i32 = mul nsw i32 %i31, %arg3
  %i33 = add nsw i32 %i32, %arg2
  %i34 = sext i32 %i33 to i64
  %i35 = getelementptr i8, ptr %arg, i64 %i34
  %i36 = getelementptr i8, ptr %i35, i64 -1
  %i37 = load i8, ptr %i36, align 1, !tbaa !22
  %i38 = zext i8 %i37 to i32
  %i39 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 5
  store i32 %i38, ptr %i39, align 4, !tbaa !19
  %i40 = load i8, ptr %i35, align 1, !tbaa !22
  %i41 = zext i8 %i40 to i32
  %i42 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 6
  store i32 %i41, ptr %i42, align 8, !tbaa !19
  %i43 = getelementptr i8, ptr %i35, i64 1
  %i44 = load i8, ptr %i43, align 1, !tbaa !22
  %i45 = zext i8 %i44 to i32
  %i46 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 7
  store i32 %i45, ptr %i46, align 4, !tbaa !19
  br label %bb47

bb47:                                             ; preds = %bb64.bb47_crit_edge, %bb
  %i48 = phi i32 [ 0, %bb ], [ %i65, %bb64.bb47_crit_edge ]
  %i49 = xor i32 %i48, 7
  %i50 = icmp eq i32 %i49, 0
  br i1 %i50, label %bb47.bb64_crit_edge, label %bb51

bb47.bb64_crit_edge:                              ; preds = %bb47
  br label %bb64

bb51:                                             ; preds = %bb47
  %i52 = zext nneg i32 %i49 to i64
  br label %bb53

bb53:                                             ; preds = %bb62.bb53_crit_edge, %bb51
  %i54 = phi i64 [ 0, %bb51 ], [ %i57, %bb62.bb53_crit_edge ]
  %i55 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 %i54
  %i56 = load i32, ptr %i55, align 4, !tbaa !19
  %i57 = add nuw nsw i64 %i54, 1
  %i58 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 %i57
  %i59 = load i32, ptr %i58, align 4, !tbaa !19
  %i60 = icmp sgt i32 %i56, %i59
  br i1 %i60, label %bb61, label %bb53.bb62_crit_edge

bb53.bb62_crit_edge:                              ; preds = %bb53
  br label %bb62

bb61:                                             ; preds = %bb53
  store i32 %i59, ptr %i55, align 4, !tbaa !19
  store i32 %i56, ptr %i58, align 4, !tbaa !19
  br label %bb62

bb62:                                             ; preds = %bb53.bb62_crit_edge, %bb61
  %i63 = icmp eq i64 %i57, %i52
  br i1 %i63, label %bb64.loopexit, label %bb62.bb53_crit_edge, !llvm.loop !29

bb62.bb53_crit_edge:                              ; preds = %bb62
  br label %bb53

bb64.loopexit:                                    ; preds = %bb62
  br label %bb64

bb64:                                             ; preds = %bb47.bb64_crit_edge, %bb64.loopexit
  %i65 = add nuw nsw i32 %i48, 1
  %i66 = icmp eq i32 %i65, 7
  br i1 %i66, label %bb67, label %bb64.bb47_crit_edge, !llvm.loop !30

bb64.bb47_crit_edge:                              ; preds = %bb64
  br label %bb47

bb67:                                             ; preds = %bb64
  %i68 = load i32, ptr %i26, align 4, !tbaa !19
  %i69 = load i32, ptr %i30, align 16, !tbaa !19
  %i70 = add nsw i32 %i69, %i68
  %i71 = sdiv i32 %i70, 2
  %i72 = trunc i32 %i71 to i8
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %i) #21
  ret i8 %i72
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @enlarge(ptr nocapture noundef %arg, ptr noundef %arg1, ptr nocapture noundef %arg2, ptr nocapture noundef %arg3, i32 noundef %arg4) local_unnamed_addr #17 {
bb:
  %i = load i32, ptr %arg3, align 4, !tbaa !19
  %i5 = icmp sgt i32 %i, 0
  br i1 %i5, label %bb6, label %bb.bb10_crit_edge

bb.bb10_crit_edge:                                ; preds = %bb
  br label %bb10

bb6:                                              ; preds = %bb
  %i7 = shl nsw i32 %arg4, 1
  %i8 = sext i32 %arg4 to i64
  %i9 = getelementptr i8, ptr %arg1, i64 %i8
  br label %bb17

bb10.loopexit:                                    ; preds = %bb17
  br label %bb10

bb10:                                             ; preds = %bb.bb10_crit_edge, %bb10.loopexit
  %i11 = icmp sgt i32 %arg4, 0
  br i1 %i11, label %bb12, label %bb10.bb33_crit_edge

bb10.bb33_crit_edge:                              ; preds = %bb10
  br label %bb33

bb12:                                             ; preds = %bb10
  %i13 = shl nuw nsw i32 %arg4, 1
  %i14 = zext nneg i32 %arg4 to i64
  %i15 = getelementptr i8, ptr %arg1, i64 %i14
  %i16 = getelementptr i8, ptr %arg1, i64 %i14
  br label %bb38

bb17:                                             ; preds = %bb17.bb17_crit_edge, %bb6
  %i18 = phi i32 [ 0, %bb6 ], [ %i30, %bb17.bb17_crit_edge ]
  %i19 = add nsw i32 %i18, %arg4
  %i20 = load i32, ptr %arg2, align 4, !tbaa !19
  %i21 = add nsw i32 %i20, %i7
  %i22 = mul nsw i32 %i21, %i19
  %i23 = sext i32 %i22 to i64
  %i24 = getelementptr i8, ptr %i9, i64 %i23
  %i25 = load ptr, ptr %arg, align 8, !tbaa !8
  %i26 = mul nsw i32 %i20, %i18
  %i27 = sext i32 %i26 to i64
  %i28 = getelementptr inbounds i8, ptr %i25, i64 %i27
  %i29 = sext i32 %i20 to i64
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %i24, ptr align 1 %i28, i64 %i29, i1 false)
  %i30 = add nuw nsw i32 %i18, 1
  %i31 = load i32, ptr %arg3, align 4, !tbaa !19
  %i32 = icmp slt i32 %i30, %i31
  br i1 %i32, label %bb17.bb17_crit_edge, label %bb10.loopexit, !llvm.loop !31

bb17.bb17_crit_edge:                              ; preds = %bb17
  br label %bb17

bb33.loopexit:                                    ; preds = %bb38
  br label %bb33

bb33:                                             ; preds = %bb10.bb33_crit_edge, %bb33.loopexit
  %i34 = icmp sgt i32 %arg4, 0
  br i1 %i34, label %bb35, label %bb33.bb106_crit_edge

bb33.bb106_crit_edge:                             ; preds = %bb33
  br label %bb106

bb35:                                             ; preds = %bb33
  %i36 = shl nuw nsw i32 %arg4, 1
  %i37 = sub nsw i32 0, %i36
  br label %bb68

bb38:                                             ; preds = %bb38.bb38_crit_edge, %bb12
  %i39 = phi i32 [ 0, %bb12 ], [ %i66, %bb38.bb38_crit_edge ]
  %i40 = xor i32 %i39, -1
  %i41 = add nsw i32 %i40, %arg4
  %i42 = load i32, ptr %arg2, align 4, !tbaa !19
  %i43 = add nsw i32 %i42, %i13
  %i44 = mul nsw i32 %i43, %i41
  %i45 = sext i32 %i44 to i64
  %i46 = getelementptr i8, ptr %i15, i64 %i45
  %i47 = load ptr, ptr %arg, align 8, !tbaa !8
  %i48 = mul nsw i32 %i42, %i39
  %i49 = sext i32 %i48 to i64
  %i50 = getelementptr inbounds i8, ptr %i47, i64 %i49
  %i51 = sext i32 %i42 to i64
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %i46, ptr align 1 %i50, i64 %i51, i1 false)
  %i52 = load i32, ptr %arg3, align 4, !tbaa !19
  %i53 = add nuw i32 %i39, %arg4
  %i54 = add i32 %i53, %i52
  %i55 = load i32, ptr %arg2, align 4, !tbaa !19
  %i56 = add nsw i32 %i55, %i13
  %i57 = mul nsw i32 %i54, %i56
  %i58 = sext i32 %i57 to i64
  %i59 = getelementptr i8, ptr %i16, i64 %i58
  %i60 = load ptr, ptr %arg, align 8, !tbaa !8
  %i61 = add i32 %i52, %i40
  %i62 = mul nsw i32 %i61, %i55
  %i63 = sext i32 %i62 to i64
  %i64 = getelementptr inbounds i8, ptr %i60, i64 %i63
  %i65 = sext i32 %i55 to i64
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %i59, ptr align 1 %i64, i64 %i65, i1 false)
  %i66 = add nuw nsw i32 %i39, 1
  %i67 = icmp eq i32 %i66, %arg4
  br i1 %i67, label %bb33.loopexit, label %bb38.bb38_crit_edge, !llvm.loop !32

bb38.bb38_crit_edge:                              ; preds = %bb38
  br label %bb38

bb68:                                             ; preds = %bb103.bb68_crit_edge, %bb35
  %i69 = phi i32 [ 0, %bb35 ], [ %i104, %bb103.bb68_crit_edge ]
  %i70 = load i32, ptr %arg3, align 4, !tbaa !19
  %i71 = icmp sgt i32 %i70, %i37
  br i1 %i71, label %bb72, label %bb68.bb103_crit_edge

bb68.bb103_crit_edge:                             ; preds = %bb68
  br label %bb103

bb72:                                             ; preds = %bb68
  %i73 = xor i32 %i69, -1
  br label %bb74

bb74:                                             ; preds = %bb74.bb74_crit_edge, %bb72
  %i75 = phi i32 [ 0, %bb72 ], [ %i99, %bb74.bb74_crit_edge ]
  %i76 = load i32, ptr %arg2, align 4, !tbaa !19
  %i77 = add nsw i32 %i76, %i36
  %i78 = mul nsw i32 %i77, %i75
  %i79 = add nsw i32 %i78, %arg4
  %i80 = add nsw i32 %i79, %i69
  %i81 = sext i32 %i80 to i64
  %i82 = getelementptr inbounds i8, ptr %arg1, i64 %i81
  %i83 = load i8, ptr %i82, align 1, !tbaa !22
  %i84 = add i32 %i79, %i73
  %i85 = sext i32 %i84 to i64
  %i86 = getelementptr inbounds i8, ptr %arg1, i64 %i85
  store i8 %i83, ptr %i86, align 1, !tbaa !22
  %i87 = load i32, ptr %arg2, align 4, !tbaa !19
  %i88 = add nsw i32 %i87, %i36
  %i89 = mul nsw i32 %i88, %i75
  %i90 = add i32 %i87, %arg4
  %i91 = add i32 %i90, %i89
  %i92 = add i32 %i91, %i73
  %i93 = sext i32 %i92 to i64
  %i94 = getelementptr inbounds i8, ptr %arg1, i64 %i93
  %i95 = load i8, ptr %i94, align 1, !tbaa !22
  %i96 = add nsw i32 %i91, %i69
  %i97 = sext i32 %i96 to i64
  %i98 = getelementptr inbounds i8, ptr %arg1, i64 %i97
  store i8 %i95, ptr %i98, align 1, !tbaa !22
  %i99 = add nuw nsw i32 %i75, 1
  %i100 = load i32, ptr %arg3, align 4, !tbaa !19
  %i101 = add nsw i32 %i100, %i36
  %i102 = icmp slt i32 %i99, %i101
  br i1 %i102, label %bb74.bb74_crit_edge, label %bb103.loopexit, !llvm.loop !33

bb74.bb74_crit_edge:                              ; preds = %bb74
  br label %bb74

bb103.loopexit:                                   ; preds = %bb74
  br label %bb103

bb103:                                            ; preds = %bb68.bb103_crit_edge, %bb103.loopexit
  %i104 = add nuw nsw i32 %i69, 1
  %i105 = icmp eq i32 %i104, %arg4
  br i1 %i105, label %bb106.loopexit, label %bb103.bb68_crit_edge, !llvm.loop !34

bb103.bb68_crit_edge:                             ; preds = %bb103
  br label %bb68

bb106.loopexit:                                   ; preds = %bb103
  br label %bb106

bb106:                                            ; preds = %bb33.bb106_crit_edge, %bb106.loopexit
  %i107 = shl nsw i32 %arg4, 1
  %i108 = load i32, ptr %arg2, align 4, !tbaa !19
  %i109 = add nsw i32 %i108, %i107
  store i32 %i109, ptr %arg2, align 4, !tbaa !19
  %i110 = load i32, ptr %arg3, align 4, !tbaa !19
  %i111 = add nsw i32 %i110, %i107
  store i32 %i111, ptr %arg3, align 4, !tbaa !19
  store ptr %arg1, ptr %arg, align 8, !tbaa !8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #18

; Function Attrs: nounwind uwtable
define dso_local void @susan_smoothing(i32 noundef %arg, ptr noundef %arg1, float noundef %arg2, i32 noundef %arg3, i32 noundef %arg4, ptr nocapture noundef readonly %arg5) local_unnamed_addr #0 {
bb:
  %i = alloca [8 x i32], align 16
  %i6 = alloca [8 x i32], align 16
  %i7 = alloca ptr, align 8
  %i8 = alloca i32, align 4
  %i9 = alloca i32, align 4
  store ptr %arg1, ptr %i7, align 8, !tbaa !8
  store i32 %arg3, ptr %i8, align 4, !tbaa !19
  store i32 %arg4, ptr %i9, align 4, !tbaa !19
  %i10 = icmp eq i32 %arg, 0
  %i11 = fpext float %arg2 to double
  %i12 = fmul double %i11, 1.500000e+00
  %i13 = fptosi double %i12 to i32
  %i14 = add nsw i32 %i13, 1
  %i15 = select i1 %i10, i32 %i14, i32 1
  %i16 = fcmp ogt float %arg2, 1.500000e+01
  br i1 %i16, label %bb17, label %bb21

bb17:                                             ; preds = %bb
  %i18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.25, double noundef %i11)
  %i19 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.44)
  %i20 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.45)
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb21:                                             ; preds = %bb
  %i22 = shl nsw i32 %i15, 1
  %i23 = or disjoint i32 %i22, 1
  %i24 = icmp slt i32 %i22, %arg3
  %i25 = icmp slt i32 %i22, %arg4
  %i26 = and i1 %i24, %i25
  br i1 %i26, label %bb29, label %bb27

bb27:                                             ; preds = %bb21
  %i28 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.28, i32 noundef %i15, i32 noundef %arg3, i32 noundef %arg4)
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb29:                                             ; preds = %bb21
  %i30 = add nsw i32 %i22, %arg3
  %i31 = add nsw i32 %i22, %arg4
  %i32 = mul nsw i32 %i30, %i31
  %i33 = sext i32 %i32 to i64
  %i34 = tail call noalias ptr @malloc(i64 noundef %i33) #24
  call void @enlarge(ptr noundef nonnull %i7, ptr noundef %i34, ptr noundef nonnull %i8, ptr noundef nonnull %i9, i32 noundef %i15)
  br i1 %i10, label %bb46, label %bb35

bb35:                                             ; preds = %bb29
  %i36 = load i32, ptr %i9, align 4, !tbaa !19
  %i37 = icmp sgt i32 %i36, 2
  br i1 %i37, label %bb38, label %bb35.bb444_crit_edge

bb35.bb444_crit_edge:                             ; preds = %bb35
  br label %bb444

bb38:                                             ; preds = %bb35
  %i39 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 1
  %i40 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 2
  %i41 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 3
  %i42 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 4
  %i43 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 5
  %i44 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 6
  %i45 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 7
  br label %bb242

bb46:                                             ; preds = %bb29
  %i47 = load i32, ptr %i8, align 4, !tbaa !19
  %i48 = sub nsw i32 %i47, %i23
  %i49 = mul nsw i32 %i23, %i23
  %i50 = zext nneg i32 %i49 to i64
  %i51 = tail call noalias ptr @malloc(i64 noundef %i50) #24
  %i52 = fneg float %arg2
  %i53 = fmul float %i52, %arg2
  %i54 = sub nsw i32 0, %i15
  %i55 = icmp slt i32 %i15, 0
  br i1 %i55, label %bb46.bb60_crit_edge, label %bb56.preheader

bb46.bb60_crit_edge:                              ; preds = %bb46
  br label %bb60

bb56.preheader:                                   ; preds = %bb46
  br label %bb56

bb56:                                             ; preds = %bb94.bb56_crit_edge, %bb56.preheader
  %i57 = phi ptr [ %i91, %bb94.bb56_crit_edge ], [ %i51, %bb56.preheader ]
  %i58 = phi i32 [ %i95, %bb94.bb56_crit_edge ], [ %i54, %bb56.preheader ]
  %i59 = mul nsw i32 %i58, %i58
  br label %bb79

bb60.loopexit:                                    ; preds = %bb94
  br label %bb60

bb60:                                             ; preds = %bb46.bb60_crit_edge, %bb60.loopexit
  %i61 = load i32, ptr %i9, align 4, !tbaa !19
  %i62 = sub nsw i32 %i61, %i15
  %i63 = icmp slt i32 %i15, %i62
  br i1 %i63, label %bb64, label %bb60.bb241_crit_edge

bb60.bb241_crit_edge:                             ; preds = %bb60
  br label %bb241

bb64:                                             ; preds = %bb60
  %i65 = sub nsw i32 0, %i15
  %i66 = sext i32 %i65 to i64
  %i67 = icmp slt i32 %i15, 0
  %i68 = sext i32 %i48 to i64
  %i69 = getelementptr inbounds [8 x i32], ptr %i6, i64 0, i64 1
  %i70 = getelementptr inbounds [8 x i32], ptr %i6, i64 0, i64 2
  %i71 = getelementptr inbounds [8 x i32], ptr %i6, i64 0, i64 3
  %i72 = getelementptr inbounds [8 x i32], ptr %i6, i64 0, i64 4
  %i73 = getelementptr inbounds [8 x i32], ptr %i6, i64 0, i64 5
  %i74 = getelementptr inbounds [8 x i32], ptr %i6, i64 0, i64 6
  %i75 = getelementptr inbounds [8 x i32], ptr %i6, i64 0, i64 7
  %i76 = or disjoint i32 %i22, 1
  %i77 = zext i32 %i76 to i64
  %i78 = sext i32 %i15 to i64
  br label %bb97

bb79:                                             ; preds = %bb79.bb79_crit_edge, %bb56
  %i80 = phi ptr [ %i57, %bb56 ], [ %i91, %bb79.bb79_crit_edge ]
  %i81 = phi i32 [ %i54, %bb56 ], [ %i92, %bb79.bb79_crit_edge ]
  %i82 = mul nsw i32 %i81, %i81
  %i83 = add nuw nsw i32 %i82, %i59
  %i84 = sitofp i32 %i83 to float
  %i85 = fdiv float %i84, %i53
  %i86 = fpext float %i85 to double
  %i87 = tail call double @exp(double noundef %i86) #21
  %i88 = fmul double %i87, 1.000000e+02
  %i89 = fptosi double %i88 to i32
  %i90 = trunc i32 %i89 to i8
  %i91 = getelementptr inbounds i8, ptr %i80, i64 1
  store i8 %i90, ptr %i80, align 1, !tbaa !22
  %i92 = add i32 %i81, 1
  %i93 = icmp eq i32 %i81, %i15
  br i1 %i93, label %bb94, label %bb79.bb79_crit_edge, !llvm.loop !35

bb79.bb79_crit_edge:                              ; preds = %bb79
  br label %bb79

bb94:                                             ; preds = %bb79
  %i95 = add i32 %i58, 1
  %i96 = icmp eq i32 %i58, %i15
  br i1 %i96, label %bb60.loopexit, label %bb94.bb56_crit_edge, !llvm.loop !36

bb94.bb56_crit_edge:                              ; preds = %bb94
  br label %bb56

bb97:                                             ; preds = %bb235.bb97_crit_edge, %bb64
  %i98 = phi ptr [ %arg1, %bb64 ], [ %i236, %bb235.bb97_crit_edge ]
  %i99 = phi i32 [ %i15, %bb64 ], [ %i237, %bb235.bb97_crit_edge ]
  %i100 = load i32, ptr %i8, align 4, !tbaa !19
  %i101 = sub nsw i32 %i100, %i15
  %i102 = icmp slt i32 %i15, %i101
  br i1 %i102, label %bb103, label %bb97.bb235_crit_edge

bb97.bb235_crit_edge:                             ; preds = %bb97
  br label %bb235

bb103:                                            ; preds = %bb97
  %i104 = sub nsw i32 %i99, %i15
  %i105 = add nsw i32 %i99, -1
  %i106 = add nsw i32 %i99, 1
  br label %bb107

bb107:                                            ; preds = %bb226.bb107_crit_edge, %bb103
  %i108 = phi i64 [ %i78, %bb103 ], [ %i230, %bb226.bb107_crit_edge ]
  %i109 = phi i32 [ %i100, %bb103 ], [ %i231, %bb226.bb107_crit_edge ]
  %i110 = phi ptr [ %i98, %bb103 ], [ %i229, %bb226.bb107_crit_edge ]
  %i111 = load ptr, ptr %i7, align 8, !tbaa !8
  %i112 = mul nsw i32 %i109, %i99
  %i113 = sext i32 %i112 to i64
  %i114 = getelementptr i8, ptr %i111, i64 %i108
  %i115 = getelementptr i8, ptr %i114, i64 %i113
  %i116 = load i8, ptr %i115, align 1, !tbaa !22
  %i117 = zext i8 %i116 to i32
  %i118 = zext i8 %i116 to i64
  %i119 = getelementptr inbounds i8, ptr %arg5, i64 %i118
  br i1 %i67, label %bb107.bb161_crit_edge, label %bb120

bb107.bb161_crit_edge:                            ; preds = %bb107
  br label %bb161

bb120:                                            ; preds = %bb107
  %i121 = mul nsw i32 %i109, %i104
  %i122 = sext i32 %i121 to i64
  %i123 = getelementptr inbounds i8, ptr %i111, i64 %i122
  %i124 = getelementptr inbounds i8, ptr %i123, i64 %i108
  %i125 = getelementptr inbounds i8, ptr %i124, i64 %i66
  br label %bb126

bb126:                                            ; preds = %bb156.bb126_crit_edge, %bb120
  %i127 = phi i32 [ %i153, %bb156.bb126_crit_edge ], [ 0, %bb120 ]
  %i128 = phi ptr [ %i157, %bb156.bb126_crit_edge ], [ %i51, %bb120 ]
  %i129 = phi ptr [ %i158, %bb156.bb126_crit_edge ], [ %i125, %bb120 ]
  %i130 = phi i32 [ %i151, %bb156.bb126_crit_edge ], [ 0, %bb120 ]
  %i131 = phi i32 [ %i159, %bb156.bb126_crit_edge ], [ %i54, %bb120 ]
  %i132 = getelementptr i8, ptr %i129, i64 %i77
  br label %bb133

bb133:                                            ; preds = %bb133.bb133_crit_edge, %bb126
  %i134 = phi i32 [ %i127, %bb126 ], [ %i153, %bb133.bb133_crit_edge ]
  %i135 = phi ptr [ %i128, %bb126 ], [ %i142, %bb133.bb133_crit_edge ]
  %i136 = phi ptr [ %i129, %bb126 ], [ %i139, %bb133.bb133_crit_edge ]
  %i137 = phi i32 [ %i130, %bb126 ], [ %i151, %bb133.bb133_crit_edge ]
  %i138 = phi i32 [ %i54, %bb126 ], [ %i154, %bb133.bb133_crit_edge ]
  %i139 = getelementptr inbounds i8, ptr %i136, i64 1
  %i140 = load i8, ptr %i136, align 1, !tbaa !22
  %i141 = zext i8 %i140 to i32
  %i142 = getelementptr inbounds i8, ptr %i135, i64 1
  %i143 = load i8, ptr %i135, align 1, !tbaa !22
  %i144 = zext i8 %i143 to i32
  %i145 = zext i8 %i140 to i64
  %i146 = sub nsw i64 0, %i145
  %i147 = getelementptr inbounds i8, ptr %i119, i64 %i146
  %i148 = load i8, ptr %i147, align 1, !tbaa !22
  %i149 = zext i8 %i148 to i32
  %i150 = mul nuw nsw i32 %i149, %i144
  %i151 = add nsw i32 %i150, %i137
  %i152 = mul nuw nsw i32 %i150, %i141
  %i153 = add nsw i32 %i152, %i134
  %i154 = add i32 %i138, 1
  %i155 = icmp eq i32 %i138, %i15
  br i1 %i155, label %bb156, label %bb133.bb133_crit_edge, !llvm.loop !37

bb133.bb133_crit_edge:                            ; preds = %bb133
  br label %bb133

bb156:                                            ; preds = %bb133
  %i157 = getelementptr i8, ptr %i128, i64 %i77
  %i158 = getelementptr inbounds i8, ptr %i132, i64 %i68
  %i159 = add i32 %i131, 1
  %i160 = icmp eq i32 %i131, %i15
  br i1 %i160, label %bb161.loopexit, label %bb156.bb126_crit_edge, !llvm.loop !38

bb156.bb126_crit_edge:                            ; preds = %bb156
  br label %bb126

bb161.loopexit:                                   ; preds = %bb156
  br label %bb161

bb161:                                            ; preds = %bb107.bb161_crit_edge, %bb161.loopexit
  %i162 = phi i32 [ 0, %bb107.bb161_crit_edge ], [ %i151, %bb161.loopexit ]
  %i163 = phi i32 [ 0, %bb107.bb161_crit_edge ], [ %i153, %bb161.loopexit ]
  %i164 = add nsw i32 %i162, -10000
  %i165 = icmp eq i32 %i164, 0
  br i1 %i165, label %bb166, label %bb222

bb166:                                            ; preds = %bb161
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %i6) #21
  %i167 = mul nsw i32 %i109, %i105
  %i168 = sext i32 %i167 to i64
  %i169 = getelementptr i8, ptr %i111, i64 %i108
  %i170 = getelementptr i8, ptr %i169, i64 %i168
  %i171 = getelementptr i8, ptr %i170, i64 -1
  %i172 = load i8, ptr %i171, align 1, !tbaa !22
  %i173 = zext i8 %i172 to i32
  store i32 %i173, ptr %i6, align 16, !tbaa !19
  %i174 = load i8, ptr %i170, align 1, !tbaa !22
  %i175 = zext i8 %i174 to i32
  store i32 %i175, ptr %i69, align 4, !tbaa !19
  %i176 = getelementptr i8, ptr %i170, i64 1
  %i177 = load i8, ptr %i176, align 1, !tbaa !22
  %i178 = zext i8 %i177 to i32
  store i32 %i178, ptr %i70, align 8, !tbaa !19
  %i179 = getelementptr i8, ptr %i115, i64 -1
  %i180 = load i8, ptr %i179, align 1, !tbaa !22
  %i181 = zext i8 %i180 to i32
  store i32 %i181, ptr %i71, align 4, !tbaa !19
  %i182 = getelementptr i8, ptr %i115, i64 1
  %i183 = load i8, ptr %i182, align 1, !tbaa !22
  %i184 = zext i8 %i183 to i32
  store i32 %i184, ptr %i72, align 16, !tbaa !19
  %i185 = mul nsw i32 %i109, %i106
  %i186 = sext i32 %i185 to i64
  %i187 = getelementptr i8, ptr %i111, i64 %i108
  %i188 = getelementptr i8, ptr %i187, i64 %i186
  %i189 = getelementptr i8, ptr %i188, i64 -1
  %i190 = load i8, ptr %i189, align 1, !tbaa !22
  %i191 = zext i8 %i190 to i32
  store i32 %i191, ptr %i73, align 4, !tbaa !19
  %i192 = load i8, ptr %i188, align 1, !tbaa !22
  %i193 = zext i8 %i192 to i32
  store i32 %i193, ptr %i74, align 8, !tbaa !19
  %i194 = getelementptr i8, ptr %i188, i64 1
  %i195 = load i8, ptr %i194, align 1, !tbaa !22
  %i196 = zext i8 %i195 to i32
  store i32 %i196, ptr %i75, align 4, !tbaa !19
  br label %bb197

bb197:                                            ; preds = %bb214.bb197_crit_edge, %bb166
  %i198 = phi i32 [ 0, %bb166 ], [ %i215, %bb214.bb197_crit_edge ]
  %i199 = xor i32 %i198, 7
  %i200 = icmp eq i32 %i199, 0
  br i1 %i200, label %bb197.bb214_crit_edge, label %bb201

bb197.bb214_crit_edge:                            ; preds = %bb197
  br label %bb214

bb201:                                            ; preds = %bb197
  %i202 = zext nneg i32 %i199 to i64
  br label %bb203

bb203:                                            ; preds = %bb212.bb203_crit_edge, %bb201
  %i204 = phi i64 [ 0, %bb201 ], [ %i207, %bb212.bb203_crit_edge ]
  %i205 = getelementptr inbounds [8 x i32], ptr %i6, i64 0, i64 %i204
  %i206 = load i32, ptr %i205, align 4, !tbaa !19
  %i207 = add nuw nsw i64 %i204, 1
  %i208 = getelementptr inbounds [8 x i32], ptr %i6, i64 0, i64 %i207
  %i209 = load i32, ptr %i208, align 4, !tbaa !19
  %i210 = icmp sgt i32 %i206, %i209
  br i1 %i210, label %bb211, label %bb203.bb212_crit_edge

bb203.bb212_crit_edge:                            ; preds = %bb203
  br label %bb212

bb211:                                            ; preds = %bb203
  store i32 %i209, ptr %i205, align 4, !tbaa !19
  store i32 %i206, ptr %i208, align 4, !tbaa !19
  br label %bb212

bb212:                                            ; preds = %bb203.bb212_crit_edge, %bb211
  %i213 = icmp eq i64 %i207, %i202
  br i1 %i213, label %bb214.loopexit, label %bb212.bb203_crit_edge, !llvm.loop !29

bb212.bb203_crit_edge:                            ; preds = %bb212
  br label %bb203

bb214.loopexit:                                   ; preds = %bb212
  br label %bb214

bb214:                                            ; preds = %bb197.bb214_crit_edge, %bb214.loopexit
  %i215 = add nuw nsw i32 %i198, 1
  %i216 = icmp eq i32 %i215, 7
  br i1 %i216, label %bb217, label %bb214.bb197_crit_edge, !llvm.loop !30

bb214.bb197_crit_edge:                            ; preds = %bb214
  br label %bb197

bb217:                                            ; preds = %bb214
  %i218 = load i32, ptr %i71, align 4, !tbaa !19
  %i219 = load i32, ptr %i72, align 16, !tbaa !19
  %i220 = add nsw i32 %i219, %i218
  %i221 = sdiv i32 %i220, 2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %i6) #21
  br label %bb226

bb222:                                            ; preds = %bb161
  %i223 = mul nsw i32 %i117, -10000
  %i224 = add i32 %i163, %i223
  %i225 = sdiv i32 %i224, %i164
  br label %bb226

bb226:                                            ; preds = %bb222, %bb217
  %i227 = phi i32 [ %i225, %bb222 ], [ %i221, %bb217 ]
  %i228 = trunc i32 %i227 to i8
  %i229 = getelementptr inbounds i8, ptr %i110, i64 1
  store i8 %i228, ptr %i110, align 1, !tbaa !22
  %i230 = add nsw i64 %i108, 1
  %i231 = load i32, ptr %i8, align 4, !tbaa !19
  %i232 = sub nsw i32 %i231, %i15
  %i233 = sext i32 %i232 to i64
  %i234 = icmp slt i64 %i230, %i233
  br i1 %i234, label %bb226.bb107_crit_edge, label %bb235.loopexit, !llvm.loop !39

bb226.bb107_crit_edge:                            ; preds = %bb226
  br label %bb107

bb235.loopexit:                                   ; preds = %bb226
  br label %bb235

bb235:                                            ; preds = %bb97.bb235_crit_edge, %bb235.loopexit
  %i236 = phi ptr [ %i98, %bb97.bb235_crit_edge ], [ %i229, %bb235.loopexit ]
  %i237 = add nsw i32 %i99, 1
  %i238 = load i32, ptr %i9, align 4, !tbaa !19
  %i239 = sub nsw i32 %i238, %i15
  %i240 = icmp slt i32 %i237, %i239
  br i1 %i240, label %bb235.bb97_crit_edge, label %bb241.loopexit, !llvm.loop !40

bb235.bb97_crit_edge:                             ; preds = %bb235
  br label %bb97

bb241.loopexit:                                   ; preds = %bb235
  br label %bb241

bb241:                                            ; preds = %bb60.bb241_crit_edge, %bb241.loopexit
  tail call void @free(ptr noundef %i51) #21
  br label %bb444

bb242:                                            ; preds = %bb438.bb242_crit_edge, %bb38
  %i243 = phi ptr [ %arg1, %bb38 ], [ %i439, %bb438.bb242_crit_edge ]
  %i244 = phi i32 [ 1, %bb38 ], [ %i440, %bb438.bb242_crit_edge ]
  %i245 = load i32, ptr %i8, align 4, !tbaa !19
  %i246 = icmp sgt i32 %i245, 2
  br i1 %i246, label %bb247, label %bb242.bb438_crit_edge

bb242.bb438_crit_edge:                            ; preds = %bb242
  br label %bb438

bb247:                                            ; preds = %bb242
  %i248 = add nsw i32 %i244, -1
  %i249 = add nuw nsw i32 %i244, 1
  br label %bb250

bb250:                                            ; preds = %bb429.bb250_crit_edge, %bb247
  %i251 = phi i64 [ 1, %bb247 ], [ %i433, %bb429.bb250_crit_edge ]
  %i252 = phi i32 [ %i245, %bb247 ], [ %i434, %bb429.bb250_crit_edge ]
  %i253 = phi ptr [ %i243, %bb247 ], [ %i432, %bb429.bb250_crit_edge ]
  %i254 = load ptr, ptr %i7, align 8, !tbaa !8
  %i255 = mul nsw i32 %i252, %i248
  %i256 = sext i32 %i255 to i64
  %i257 = getelementptr inbounds i8, ptr %i254, i64 %i256
  %i258 = getelementptr inbounds i8, ptr %i257, i64 %i251
  %i259 = getelementptr inbounds i8, ptr %i258, i64 -1
  %i260 = mul nsw i32 %i252, %i244
  %i261 = trunc i64 %i251 to i32
  %i262 = add nsw i32 %i260, %i261
  %i263 = sext i32 %i262 to i64
  %i264 = getelementptr inbounds i8, ptr %i254, i64 %i263
  %i265 = load i8, ptr %i264, align 1, !tbaa !22
  %i266 = zext i8 %i265 to i64
  %i267 = getelementptr inbounds i8, ptr %arg5, i64 %i266
  %i268 = load i8, ptr %i259, align 1, !tbaa !22
  %i269 = zext i8 %i268 to i64
  %i270 = sub nsw i64 0, %i269
  %i271 = getelementptr inbounds i8, ptr %i267, i64 %i270
  %i272 = load i8, ptr %i271, align 1, !tbaa !22
  %i273 = zext i8 %i272 to i32
  %i274 = getelementptr inbounds i8, ptr %i258, i64 1
  %i275 = load i8, ptr %i258, align 1, !tbaa !22
  %i276 = zext i8 %i275 to i64
  %i277 = sub nsw i64 0, %i276
  %i278 = getelementptr inbounds i8, ptr %i267, i64 %i277
  %i279 = load i8, ptr %i278, align 1, !tbaa !22
  %i280 = zext i8 %i279 to i32
  %i281 = load i8, ptr %i274, align 1, !tbaa !22
  %i282 = zext i8 %i281 to i64
  %i283 = sub nsw i64 0, %i282
  %i284 = getelementptr inbounds i8, ptr %i267, i64 %i283
  %i285 = load i8, ptr %i284, align 1, !tbaa !22
  %i286 = zext i8 %i285 to i32
  %i287 = add nsw i32 %i252, -2
  %i288 = sext i32 %i287 to i64
  %i289 = getelementptr inbounds i8, ptr %i274, i64 %i288
  %i290 = getelementptr inbounds i8, ptr %i289, i64 1
  %i291 = load i8, ptr %i289, align 1, !tbaa !22
  %i292 = zext i8 %i291 to i64
  %i293 = sub nsw i64 0, %i292
  %i294 = getelementptr inbounds i8, ptr %i267, i64 %i293
  %i295 = load i8, ptr %i294, align 1, !tbaa !22
  %i296 = zext i8 %i295 to i32
  %i297 = getelementptr inbounds i8, ptr %i289, i64 2
  %i298 = load i8, ptr %i290, align 1, !tbaa !22
  %i299 = zext i8 %i298 to i64
  %i300 = sub nsw i64 0, %i299
  %i301 = getelementptr inbounds i8, ptr %i267, i64 %i300
  %i302 = load i8, ptr %i301, align 1, !tbaa !22
  %i303 = zext i8 %i302 to i32
  %i304 = load i8, ptr %i297, align 1, !tbaa !22
  %i305 = zext i8 %i304 to i64
  %i306 = sub nsw i64 0, %i305
  %i307 = getelementptr inbounds i8, ptr %i267, i64 %i306
  %i308 = load i8, ptr %i307, align 1, !tbaa !22
  %i309 = zext i8 %i308 to i32
  %i310 = getelementptr inbounds i8, ptr %i297, i64 %i288
  %i311 = getelementptr inbounds i8, ptr %i310, i64 1
  %i312 = load i8, ptr %i310, align 1, !tbaa !22
  %i313 = zext i8 %i312 to i64
  %i314 = sub nsw i64 0, %i313
  %i315 = getelementptr inbounds i8, ptr %i267, i64 %i314
  %i316 = load i8, ptr %i315, align 1, !tbaa !22
  %i317 = zext i8 %i316 to i32
  %i318 = getelementptr inbounds i8, ptr %i310, i64 2
  %i319 = load i8, ptr %i311, align 1, !tbaa !22
  %i320 = zext i8 %i319 to i64
  %i321 = sub nsw i64 0, %i320
  %i322 = getelementptr inbounds i8, ptr %i267, i64 %i321
  %i323 = load i8, ptr %i322, align 1, !tbaa !22
  %i324 = zext i8 %i323 to i32
  %i325 = load i8, ptr %i318, align 1, !tbaa !22
  %i326 = zext i8 %i325 to i64
  %i327 = sub nsw i64 0, %i326
  %i328 = getelementptr inbounds i8, ptr %i267, i64 %i327
  %i329 = load i8, ptr %i328, align 1, !tbaa !22
  %i330 = zext i8 %i329 to i32
  %i331 = add nsw i32 %i273, -100
  %i332 = add nsw i32 %i331, %i280
  %i333 = add nsw i32 %i332, %i286
  %i334 = add nsw i32 %i333, %i296
  %i335 = add nsw i32 %i334, %i303
  %i336 = add nsw i32 %i335, %i309
  %i337 = add nsw i32 %i336, %i317
  %i338 = add nsw i32 %i337, %i324
  %i339 = add nsw i32 %i338, %i330
  %i340 = icmp eq i32 %i339, 0
  br i1 %i340, label %bb341, label %bb398

bb341:                                            ; preds = %bb250
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %i) #21
  %i342 = trunc i64 %i251 to i32
  %i343 = add nsw i32 %i255, %i342
  %i344 = sext i32 %i343 to i64
  %i345 = getelementptr i8, ptr %i254, i64 %i344
  %i346 = getelementptr i8, ptr %i345, i64 -1
  %i347 = load i8, ptr %i346, align 1, !tbaa !22
  %i348 = zext i8 %i347 to i32
  store i32 %i348, ptr %i, align 16, !tbaa !19
  %i349 = load i8, ptr %i345, align 1, !tbaa !22
  %i350 = zext i8 %i349 to i32
  store i32 %i350, ptr %i39, align 4, !tbaa !19
  %i351 = getelementptr i8, ptr %i345, i64 1
  %i352 = load i8, ptr %i351, align 1, !tbaa !22
  %i353 = zext i8 %i352 to i32
  store i32 %i353, ptr %i40, align 8, !tbaa !19
  %i354 = getelementptr i8, ptr %i264, i64 -1
  %i355 = load i8, ptr %i354, align 1, !tbaa !22
  %i356 = zext i8 %i355 to i32
  store i32 %i356, ptr %i41, align 4, !tbaa !19
  %i357 = getelementptr i8, ptr %i264, i64 1
  %i358 = load i8, ptr %i357, align 1, !tbaa !22
  %i359 = zext i8 %i358 to i32
  store i32 %i359, ptr %i42, align 16, !tbaa !19
  %i360 = mul nsw i32 %i252, %i249
  %i361 = trunc i64 %i251 to i32
  %i362 = add nsw i32 %i360, %i361
  %i363 = sext i32 %i362 to i64
  %i364 = getelementptr i8, ptr %i254, i64 %i363
  %i365 = getelementptr i8, ptr %i364, i64 -1
  %i366 = load i8, ptr %i365, align 1, !tbaa !22
  %i367 = zext i8 %i366 to i32
  store i32 %i367, ptr %i43, align 4, !tbaa !19
  %i368 = load i8, ptr %i364, align 1, !tbaa !22
  %i369 = zext i8 %i368 to i32
  store i32 %i369, ptr %i44, align 8, !tbaa !19
  %i370 = getelementptr i8, ptr %i364, i64 1
  %i371 = load i8, ptr %i370, align 1, !tbaa !22
  %i372 = zext i8 %i371 to i32
  store i32 %i372, ptr %i45, align 4, !tbaa !19
  br label %bb373

bb373:                                            ; preds = %bb390.bb373_crit_edge, %bb341
  %i374 = phi i32 [ 0, %bb341 ], [ %i391, %bb390.bb373_crit_edge ]
  %i375 = xor i32 %i374, 7
  %i376 = icmp eq i32 %i375, 0
  br i1 %i376, label %bb373.bb390_crit_edge, label %bb377

bb373.bb390_crit_edge:                            ; preds = %bb373
  br label %bb390

bb377:                                            ; preds = %bb373
  %i378 = zext nneg i32 %i375 to i64
  br label %bb379

bb379:                                            ; preds = %bb388.bb379_crit_edge, %bb377
  %i380 = phi i64 [ 0, %bb377 ], [ %i383, %bb388.bb379_crit_edge ]
  %i381 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 %i380
  %i382 = load i32, ptr %i381, align 4, !tbaa !19
  %i383 = add nuw nsw i64 %i380, 1
  %i384 = getelementptr inbounds [8 x i32], ptr %i, i64 0, i64 %i383
  %i385 = load i32, ptr %i384, align 4, !tbaa !19
  %i386 = icmp sgt i32 %i382, %i385
  br i1 %i386, label %bb387, label %bb379.bb388_crit_edge

bb379.bb388_crit_edge:                            ; preds = %bb379
  br label %bb388

bb387:                                            ; preds = %bb379
  store i32 %i385, ptr %i381, align 4, !tbaa !19
  store i32 %i382, ptr %i384, align 4, !tbaa !19
  br label %bb388

bb388:                                            ; preds = %bb379.bb388_crit_edge, %bb387
  %i389 = icmp eq i64 %i383, %i378
  br i1 %i389, label %bb390.loopexit, label %bb388.bb379_crit_edge, !llvm.loop !29

bb388.bb379_crit_edge:                            ; preds = %bb388
  br label %bb379

bb390.loopexit:                                   ; preds = %bb388
  br label %bb390

bb390:                                            ; preds = %bb373.bb390_crit_edge, %bb390.loopexit
  %i391 = add nuw nsw i32 %i374, 1
  %i392 = icmp eq i32 %i391, 7
  br i1 %i392, label %bb393, label %bb390.bb373_crit_edge, !llvm.loop !30

bb390.bb373_crit_edge:                            ; preds = %bb390
  br label %bb373

bb393:                                            ; preds = %bb390
  %i394 = load i32, ptr %i41, align 4, !tbaa !19
  %i395 = load i32, ptr %i42, align 16, !tbaa !19
  %i396 = add nsw i32 %i395, %i394
  %i397 = sdiv i32 %i396, 2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %i) #21
  br label %bb429

bb398:                                            ; preds = %bb250
  %i399 = zext i8 %i268 to i32
  %i400 = mul nuw nsw i32 %i273, %i399
  %i401 = zext i8 %i275 to i32
  %i402 = mul nuw nsw i32 %i280, %i401
  %i403 = zext i8 %i281 to i32
  %i404 = mul nuw nsw i32 %i286, %i403
  %i405 = zext i8 %i291 to i32
  %i406 = mul nuw nsw i32 %i296, %i405
  %i407 = zext i8 %i298 to i32
  %i408 = mul nuw nsw i32 %i303, %i407
  %i409 = zext i8 %i304 to i32
  %i410 = mul nuw nsw i32 %i309, %i409
  %i411 = zext i8 %i312 to i32
  %i412 = mul nuw nsw i32 %i317, %i411
  %i413 = zext i8 %i319 to i32
  %i414 = mul nuw nsw i32 %i324, %i413
  %i415 = zext i8 %i325 to i32
  %i416 = mul nuw nsw i32 %i330, %i415
  %i417 = zext i8 %i265 to i32
  %i418 = mul nsw i32 %i417, -100
  %i419 = add nsw i32 %i400, %i418
  %i420 = add nsw i32 %i419, %i402
  %i421 = add nsw i32 %i420, %i404
  %i422 = add nsw i32 %i421, %i406
  %i423 = add nsw i32 %i422, %i408
  %i424 = add nsw i32 %i423, %i410
  %i425 = add nsw i32 %i424, %i412
  %i426 = add nsw i32 %i425, %i414
  %i427 = add nsw i32 %i426, %i416
  %i428 = sdiv i32 %i427, %i339
  br label %bb429

bb429:                                            ; preds = %bb398, %bb393
  %i430 = phi i32 [ %i428, %bb398 ], [ %i397, %bb393 ]
  %i431 = trunc i32 %i430 to i8
  %i432 = getelementptr inbounds i8, ptr %i253, i64 1
  store i8 %i431, ptr %i253, align 1, !tbaa !22
  %i433 = add nuw nsw i64 %i251, 1
  %i434 = load i32, ptr %i8, align 4, !tbaa !19
  %i435 = add nsw i32 %i434, -1
  %i436 = sext i32 %i435 to i64
  %i437 = icmp slt i64 %i433, %i436
  br i1 %i437, label %bb429.bb250_crit_edge, label %bb438.loopexit, !llvm.loop !41

bb429.bb250_crit_edge:                            ; preds = %bb429
  br label %bb250

bb438.loopexit:                                   ; preds = %bb429
  br label %bb438

bb438:                                            ; preds = %bb242.bb438_crit_edge, %bb438.loopexit
  %i439 = phi ptr [ %i243, %bb242.bb438_crit_edge ], [ %i432, %bb438.loopexit ]
  %i440 = add nuw nsw i32 %i244, 1
  %i441 = load i32, ptr %i9, align 4, !tbaa !19
  %i442 = add nsw i32 %i441, -1
  %i443 = icmp slt i32 %i440, %i442
  br i1 %i443, label %bb438.bb242_crit_edge, label %bb444.loopexit, !llvm.loop !42

bb438.bb242_crit_edge:                            ; preds = %bb438
  br label %bb242

bb444.loopexit:                                   ; preds = %bb438
  br label %bb444

bb444:                                            ; preds = %bb35.bb444_crit_edge, %bb444.loopexit, %bb241
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @edge_draw(ptr nocapture noundef writeonly %arg, ptr noundef %arg1, i32 noundef %arg2, i32 noundef %arg3, i32 noundef %arg4) local_unnamed_addr #17 {
bb:
  %i = icmp eq i32 %arg4, 0
  br i1 %i, label %bb5, label %bb.bb35_crit_edge

bb.bb35_crit_edge:                                ; preds = %bb
  br label %bb35

bb5:                                              ; preds = %bb
  %i6 = mul nsw i32 %arg3, %arg2
  %i7 = icmp sgt i32 %i6, 0
  br i1 %i7, label %bb8, label %bb5.bb35_crit_edge

bb5.bb35_crit_edge:                               ; preds = %bb5
  br label %bb35

bb8:                                              ; preds = %bb5
  %i9 = ptrtoint ptr %arg1 to i64
  %i10 = sext i32 %arg2 to i64
  %i11 = sub nsw i64 0, %i10
  %i12 = getelementptr i8, ptr %arg, i64 %i11
  %i13 = add nsw i32 %arg2, -2
  %i14 = sext i32 %i13 to i64
  br label %bb15

bb15:                                             ; preds = %bb31.bb15_crit_edge, %bb8
  %i16 = phi ptr [ %arg1, %bb8 ], [ %i32, %bb31.bb15_crit_edge ]
  %i17 = phi i32 [ 0, %bb8 ], [ %i33, %bb31.bb15_crit_edge ]
  %i18 = load i8, ptr %i16, align 1, !tbaa !22
  %i19 = icmp ult i8 %i18, 8
  br i1 %i19, label %bb20, label %bb15.bb31_crit_edge

bb15.bb31_crit_edge:                              ; preds = %bb15
  br label %bb31

bb20:                                             ; preds = %bb15
  %i21 = ptrtoint ptr %i16 to i64
  %i22 = sub i64 %i21, %i9
  %i23 = getelementptr i8, ptr %i12, i64 %i22
  %i24 = getelementptr inbounds i8, ptr %i23, i64 -1
  store i8 -1, ptr %i24, align 1, !tbaa !22
  %i25 = getelementptr inbounds i8, ptr %i23, i64 1
  store i8 -1, ptr %i23, align 1, !tbaa !22
  store i8 -1, ptr %i25, align 1, !tbaa !22
  %i26 = getelementptr inbounds i8, ptr %i25, i64 %i14
  store i8 -1, ptr %i26, align 1, !tbaa !22
  %i27 = getelementptr inbounds i8, ptr %i26, i64 2
  store i8 -1, ptr %i27, align 1, !tbaa !22
  %i28 = getelementptr inbounds i8, ptr %i27, i64 %i14
  %i29 = getelementptr inbounds i8, ptr %i28, i64 1
  store i8 -1, ptr %i28, align 1, !tbaa !22
  %i30 = getelementptr inbounds i8, ptr %i28, i64 2
  store i8 -1, ptr %i29, align 1, !tbaa !22
  store i8 -1, ptr %i30, align 1, !tbaa !22
  br label %bb31

bb31:                                             ; preds = %bb15.bb31_crit_edge, %bb20
  %i32 = getelementptr inbounds i8, ptr %i16, i64 1
  %i33 = add nuw nsw i32 %i17, 1
  %i34 = icmp eq i32 %i33, %i6
  br i1 %i34, label %bb35.loopexit, label %bb31.bb15_crit_edge, !llvm.loop !43

bb31.bb15_crit_edge:                              ; preds = %bb31
  br label %bb15

bb35.loopexit:                                    ; preds = %bb31
  br label %bb35

bb35:                                             ; preds = %bb5.bb35_crit_edge, %bb.bb35_crit_edge, %bb35.loopexit
  %i36 = mul nsw i32 %arg3, %arg2
  %i37 = icmp sgt i32 %i36, 0
  br i1 %i37, label %bb38, label %bb35.bb53_crit_edge

bb35.bb53_crit_edge:                              ; preds = %bb35
  br label %bb53

bb38:                                             ; preds = %bb35
  %i39 = ptrtoint ptr %arg1 to i64
  br label %bb40

bb40:                                             ; preds = %bb49.bb40_crit_edge, %bb38
  %i41 = phi ptr [ %arg1, %bb38 ], [ %i50, %bb49.bb40_crit_edge ]
  %i42 = phi i32 [ 0, %bb38 ], [ %i51, %bb49.bb40_crit_edge ]
  %i43 = load i8, ptr %i41, align 1, !tbaa !22
  %i44 = icmp ult i8 %i43, 8
  br i1 %i44, label %bb45, label %bb40.bb49_crit_edge

bb40.bb49_crit_edge:                              ; preds = %bb40
  br label %bb49

bb45:                                             ; preds = %bb40
  %i46 = ptrtoint ptr %i41 to i64
  %i47 = sub i64 %i46, %i39
  %i48 = getelementptr inbounds i8, ptr %arg, i64 %i47
  store i8 0, ptr %i48, align 1, !tbaa !22
  br label %bb49

bb49:                                             ; preds = %bb40.bb49_crit_edge, %bb45
  %i50 = getelementptr inbounds i8, ptr %i41, i64 1
  %i51 = add nuw nsw i32 %i42, 1
  %i52 = icmp eq i32 %i51, %i36
  br i1 %i52, label %bb53.loopexit, label %bb49.bb40_crit_edge, !llvm.loop !44

bb49.bb40_crit_edge:                              ; preds = %bb49
  br label %bb40

bb53.loopexit:                                    ; preds = %bb49
  br label %bb53

bb53:                                             ; preds = %bb35.bb53_crit_edge, %bb53.loopexit
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @susan_thin(ptr nocapture noundef readonly %arg, ptr noundef %arg1, i32 noundef %arg2, i32 noundef %arg3) local_unnamed_addr #8 {
bb:
  %i = alloca [9 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 36, ptr nonnull %i) #21
  %i4 = add nsw i32 %arg3, -4
  %i5 = icmp sgt i32 %arg3, 8
  br i1 %i5, label %bb6, label %bb.bb529_crit_edge

bb.bb529_crit_edge:                               ; preds = %bb
  br label %bb529

bb6:                                              ; preds = %bb
  %i7 = add nsw i32 %arg2, -4
  %i8 = icmp sgt i32 %arg2, 8
  %i9 = sext i32 %arg2 to i64
  %i10 = getelementptr inbounds [9 x i32], ptr %i, i64 0, i64 1
  %i11 = getelementptr inbounds [9 x i32], ptr %i, i64 0, i64 2
  %i12 = getelementptr inbounds [9 x i32], ptr %i, i64 0, i64 3
  %i13 = getelementptr inbounds [9 x i32], ptr %i, i64 0, i64 4
  %i14 = getelementptr inbounds [9 x i32], ptr %i, i64 0, i64 5
  %i15 = getelementptr inbounds [9 x i32], ptr %i, i64 0, i64 6
  %i16 = getelementptr inbounds [9 x i32], ptr %i, i64 0, i64 7
  %i17 = getelementptr inbounds [9 x i32], ptr %i, i64 0, i64 8
  %i18 = getelementptr i8, ptr %arg1, i64 -1
  br label %bb19

bb19:                                             ; preds = %bb523.bb19_crit_edge, %bb6
  %i20 = phi i32 [ 4, %bb6 ], [ %i527, %bb523.bb19_crit_edge ]
  %i21 = phi i32 [ 0, %bb6 ], [ %i525, %bb523.bb19_crit_edge ]
  %i22 = phi i32 [ 0, %bb6 ], [ %i524, %bb523.bb19_crit_edge ]
  br i1 %i8, label %bb23.preheader, label %bb19.bb523_crit_edge

bb19.bb523_crit_edge:                             ; preds = %bb19
  br label %bb523

bb23.preheader:                                   ; preds = %bb19
  br label %bb23

bb23:                                             ; preds = %bb516.bb23_crit_edge, %bb23.preheader
  %i24 = phi i32 [ %i521, %bb516.bb23_crit_edge ], [ 4, %bb23.preheader ]
  %i25 = phi i32 [ %i519, %bb516.bb23_crit_edge ], [ %i20, %bb23.preheader ]
  %i26 = phi i32 [ %i518, %bb516.bb23_crit_edge ], [ %i21, %bb23.preheader ]
  %i27 = phi i32 [ %i517, %bb516.bb23_crit_edge ], [ %i22, %bb23.preheader ]
  %i28 = mul nsw i32 %i25, %arg2
  %i29 = add nsw i32 %i28, %i24
  %i30 = sext i32 %i29 to i64
  %i31 = getelementptr inbounds i8, ptr %arg1, i64 %i30
  %i32 = load i8, ptr %i31, align 1, !tbaa !22
  %i33 = icmp ult i8 %i32, 8
  br i1 %i33, label %bb34, label %bb23.bb516_crit_edge

bb23.bb516_crit_edge:                             ; preds = %bb23
  br label %bb516

bb34:                                             ; preds = %bb23
  %i35 = getelementptr inbounds i32, ptr %arg, i64 %i30
  %i36 = load i32, ptr %i35, align 4, !tbaa !19
  %i37 = add nsw i32 %i25, -1
  %i38 = mul nsw i32 %i37, %arg2
  %i39 = sext i32 %i38 to i64
  %i40 = getelementptr inbounds i8, ptr %arg1, i64 %i39
  %i41 = sext i32 %i24 to i64
  %i42 = getelementptr inbounds i8, ptr %i40, i64 %i41
  %i43 = getelementptr inbounds i8, ptr %i42, i64 -1
  %i44 = load i8, ptr %i43, align 1, !tbaa !22
  %i45 = icmp ult i8 %i44, 8
  %i46 = zext i1 %i45 to i32
  %i47 = load i8, ptr %i42, align 1, !tbaa !22
  %i48 = icmp ult i8 %i47, 8
  %i49 = zext i1 %i48 to i32
  %i50 = add nuw nsw i32 %i49, %i46
  %i51 = getelementptr inbounds i8, ptr %i42, i64 1
  %i52 = load i8, ptr %i51, align 1, !tbaa !22
  %i53 = icmp ult i8 %i52, 8
  %i54 = zext i1 %i53 to i32
  %i55 = add nuw nsw i32 %i50, %i54
  %i56 = getelementptr inbounds i8, ptr %i43, i64 %i9
  %i57 = load i8, ptr %i56, align 1, !tbaa !22
  %i58 = icmp ult i8 %i57, 8
  %i59 = zext i1 %i58 to i32
  %i60 = add nuw nsw i32 %i55, %i59
  %i61 = getelementptr inbounds i8, ptr %i56, i64 2
  %i62 = load i8, ptr %i61, align 1, !tbaa !22
  %i63 = icmp ult i8 %i62, 8
  %i64 = zext i1 %i63 to i32
  %i65 = add nuw nsw i32 %i60, %i64
  %i66 = getelementptr inbounds i8, ptr %i56, i64 %i9
  %i67 = load i8, ptr %i66, align 1, !tbaa !22
  %i68 = icmp ult i8 %i67, 8
  %i69 = zext i1 %i68 to i32
  %i70 = add nuw nsw i32 %i65, %i69
  %i71 = getelementptr inbounds i8, ptr %i66, i64 1
  %i72 = load i8, ptr %i71, align 1, !tbaa !22
  %i73 = icmp ult i8 %i72, 8
  %i74 = zext i1 %i73 to i32
  %i75 = add nuw nsw i32 %i70, %i74
  %i76 = getelementptr inbounds i8, ptr %i66, i64 2
  %i77 = load i8, ptr %i76, align 1, !tbaa !22
  %i78 = icmp ult i8 %i77, 8
  %i79 = zext i1 %i78 to i32
  %i80 = add nuw nsw i32 %i75, %i79
  switch i32 %i80, label %bb34.bb248_crit_edge [
    i32 0, label %bb81
    i32 1, label %bb82
  ]

bb34.bb248_crit_edge:                             ; preds = %bb34
  br label %bb248

bb81:                                             ; preds = %bb34
  store i8 100, ptr %i31, align 1, !tbaa !22
  br label %bb248

bb82:                                             ; preds = %bb34
  %i83 = icmp ult i8 %i32, 6
  br i1 %i83, label %bb84, label %bb82.bb248_crit_edge

bb82.bb248_crit_edge:                             ; preds = %bb82
  br label %bb248

bb84:                                             ; preds = %bb82
  %i85 = add nsw i32 %i38, %i24
  %i86 = add nsw i32 %i85, -1
  %i87 = sext i32 %i86 to i64
  %i88 = getelementptr inbounds i32, ptr %arg, i64 %i87
  %i89 = load i32, ptr %i88, align 4, !tbaa !19
  store i32 %i89, ptr %i, align 16, !tbaa !19
  %i90 = sext i32 %i85 to i64
  %i91 = getelementptr inbounds i32, ptr %arg, i64 %i90
  %i92 = load i32, ptr %i91, align 4, !tbaa !19
  store i32 %i92, ptr %i10, align 4, !tbaa !19
  %i93 = add nsw i32 %i85, 1
  %i94 = sext i32 %i93 to i64
  %i95 = getelementptr inbounds i32, ptr %arg, i64 %i94
  %i96 = load i32, ptr %i95, align 4, !tbaa !19
  store i32 %i96, ptr %i11, align 8, !tbaa !19
  %i97 = add nsw i32 %i29, -1
  %i98 = sext i32 %i97 to i64
  %i99 = getelementptr inbounds i32, ptr %arg, i64 %i98
  %i100 = load i32, ptr %i99, align 4, !tbaa !19
  store i32 %i100, ptr %i12, align 4, !tbaa !19
  store i32 0, ptr %i13, align 16, !tbaa !19
  %i101 = add nsw i32 %i29, 1
  %i102 = sext i32 %i101 to i64
  %i103 = getelementptr inbounds i32, ptr %arg, i64 %i102
  %i104 = load i32, ptr %i103, align 4, !tbaa !19
  store i32 %i104, ptr %i14, align 4, !tbaa !19
  %i105 = add nsw i32 %i25, 1
  %i106 = mul nsw i32 %i105, %arg2
  %i107 = add nsw i32 %i106, %i24
  %i108 = add nsw i32 %i107, -1
  %i109 = sext i32 %i108 to i64
  %i110 = getelementptr inbounds i32, ptr %arg, i64 %i109
  %i111 = load i32, ptr %i110, align 4, !tbaa !19
  store i32 %i111, ptr %i15, align 8, !tbaa !19
  %i112 = sext i32 %i107 to i64
  %i113 = getelementptr inbounds i32, ptr %arg, i64 %i112
  %i114 = load i32, ptr %i113, align 4, !tbaa !19
  store i32 %i114, ptr %i16, align 4, !tbaa !19
  %i115 = add nsw i32 %i107, 1
  %i116 = sext i32 %i115 to i64
  %i117 = getelementptr inbounds i32, ptr %arg, i64 %i116
  %i118 = load i32, ptr %i117, align 4, !tbaa !19
  store i32 %i118, ptr %i17, align 16, !tbaa !19
  %i119 = getelementptr inbounds i8, ptr %arg1, i64 %i87
  %i120 = load i8, ptr %i119, align 1, !tbaa !22
  %i121 = icmp ult i8 %i120, 8
  br i1 %i121, label %bb122, label %bb128

bb122:                                            ; preds = %bb84
  store i32 0, ptr %i, align 16, !tbaa !19
  store i32 0, ptr %i10, align 4, !tbaa !19
  store i32 0, ptr %i12, align 4, !tbaa !19
  %i123 = shl nsw i32 %i96, 1
  store i32 %i123, ptr %i11, align 8, !tbaa !19
  %i124 = shl nsw i32 %i111, 1
  store i32 %i124, ptr %i15, align 8, !tbaa !19
  %i125 = mul nsw i32 %i104, 3
  store i32 %i125, ptr %i14, align 4, !tbaa !19
  %i126 = mul nsw i32 %i114, 3
  store i32 %i126, ptr %i16, align 4, !tbaa !19
  %i127 = shl nsw i32 %i118, 2
  store i32 %i127, ptr %i17, align 16, !tbaa !19
  br label %bb198

bb128:                                            ; preds = %bb84
  %i129 = getelementptr inbounds i8, ptr %arg1, i64 %i90
  %i130 = load i8, ptr %i129, align 1, !tbaa !22
  %i131 = icmp ult i8 %i130, 8
  br i1 %i131, label %bb132, label %bb138

bb132:                                            ; preds = %bb128
  store i32 0, ptr %i10, align 4, !tbaa !19
  store i32 0, ptr %i, align 16, !tbaa !19
  store i32 0, ptr %i11, align 8, !tbaa !19
  %i133 = shl nsw i32 %i100, 1
  store i32 %i133, ptr %i12, align 4, !tbaa !19
  %i134 = shl nsw i32 %i104, 1
  store i32 %i134, ptr %i14, align 4, !tbaa !19
  %i135 = mul nsw i32 %i111, 3
  store i32 %i135, ptr %i15, align 8, !tbaa !19
  %i136 = mul nsw i32 %i118, 3
  store i32 %i136, ptr %i17, align 16, !tbaa !19
  %i137 = shl nsw i32 %i114, 2
  store i32 %i137, ptr %i16, align 4, !tbaa !19
  br label %bb198

bb138:                                            ; preds = %bb128
  %i139 = getelementptr inbounds i8, ptr %arg1, i64 %i94
  %i140 = load i8, ptr %i139, align 1, !tbaa !22
  %i141 = icmp ult i8 %i140, 8
  br i1 %i141, label %bb142, label %bb148

bb142:                                            ; preds = %bb138
  store i32 0, ptr %i11, align 8, !tbaa !19
  store i32 0, ptr %i10, align 4, !tbaa !19
  store i32 0, ptr %i14, align 4, !tbaa !19
  %i143 = shl nsw i32 %i89, 1
  store i32 %i143, ptr %i, align 16, !tbaa !19
  %i144 = shl nsw i32 %i118, 1
  store i32 %i144, ptr %i17, align 16, !tbaa !19
  %i145 = mul nsw i32 %i100, 3
  store i32 %i145, ptr %i12, align 4, !tbaa !19
  %i146 = mul nsw i32 %i114, 3
  store i32 %i146, ptr %i16, align 4, !tbaa !19
  %i147 = shl nsw i32 %i111, 2
  store i32 %i147, ptr %i15, align 8, !tbaa !19
  br label %bb198

bb148:                                            ; preds = %bb138
  %i149 = getelementptr inbounds i8, ptr %arg1, i64 %i98
  %i150 = load i8, ptr %i149, align 1, !tbaa !22
  %i151 = icmp ult i8 %i150, 8
  br i1 %i151, label %bb152, label %bb158

bb152:                                            ; preds = %bb148
  store i32 0, ptr %i12, align 4, !tbaa !19
  store i32 0, ptr %i, align 16, !tbaa !19
  store i32 0, ptr %i15, align 8, !tbaa !19
  %i153 = shl nsw i32 %i92, 1
  store i32 %i153, ptr %i10, align 4, !tbaa !19
  %i154 = shl nsw i32 %i114, 1
  store i32 %i154, ptr %i16, align 4, !tbaa !19
  %i155 = mul nsw i32 %i96, 3
  store i32 %i155, ptr %i11, align 8, !tbaa !19
  %i156 = mul nsw i32 %i118, 3
  store i32 %i156, ptr %i17, align 16, !tbaa !19
  %i157 = shl nsw i32 %i104, 2
  store i32 %i157, ptr %i14, align 4, !tbaa !19
  br label %bb198

bb158:                                            ; preds = %bb148
  %i159 = getelementptr inbounds i8, ptr %arg1, i64 %i102
  %i160 = load i8, ptr %i159, align 1, !tbaa !22
  %i161 = icmp ult i8 %i160, 8
  br i1 %i161, label %bb162, label %bb168

bb162:                                            ; preds = %bb158
  store i32 0, ptr %i14, align 4, !tbaa !19
  store i32 0, ptr %i11, align 8, !tbaa !19
  store i32 0, ptr %i17, align 16, !tbaa !19
  %i163 = shl nsw i32 %i92, 1
  store i32 %i163, ptr %i10, align 4, !tbaa !19
  %i164 = shl nsw i32 %i114, 1
  store i32 %i164, ptr %i16, align 4, !tbaa !19
  %i165 = mul nsw i32 %i89, 3
  store i32 %i165, ptr %i, align 16, !tbaa !19
  %i166 = mul nsw i32 %i111, 3
  store i32 %i166, ptr %i15, align 8, !tbaa !19
  %i167 = shl nsw i32 %i100, 2
  store i32 %i167, ptr %i12, align 4, !tbaa !19
  br label %bb198

bb168:                                            ; preds = %bb158
  %i169 = getelementptr inbounds i8, ptr %arg1, i64 %i109
  %i170 = load i8, ptr %i169, align 1, !tbaa !22
  %i171 = icmp ult i8 %i170, 8
  br i1 %i171, label %bb172, label %bb178

bb172:                                            ; preds = %bb168
  store i32 0, ptr %i15, align 8, !tbaa !19
  store i32 0, ptr %i12, align 4, !tbaa !19
  store i32 0, ptr %i16, align 4, !tbaa !19
  %i173 = shl nsw i32 %i89, 1
  store i32 %i173, ptr %i, align 16, !tbaa !19
  %i174 = shl nsw i32 %i118, 1
  store i32 %i174, ptr %i17, align 16, !tbaa !19
  %i175 = mul nsw i32 %i92, 3
  store i32 %i175, ptr %i10, align 4, !tbaa !19
  %i176 = mul nsw i32 %i104, 3
  store i32 %i176, ptr %i14, align 4, !tbaa !19
  %i177 = shl nsw i32 %i96, 2
  store i32 %i177, ptr %i11, align 8, !tbaa !19
  br label %bb198

bb178:                                            ; preds = %bb168
  %i179 = getelementptr inbounds i8, ptr %arg1, i64 %i112
  %i180 = load i8, ptr %i179, align 1, !tbaa !22
  %i181 = icmp ult i8 %i180, 8
  br i1 %i181, label %bb182, label %bb188

bb182:                                            ; preds = %bb178
  store i32 0, ptr %i16, align 4, !tbaa !19
  store i32 0, ptr %i15, align 8, !tbaa !19
  store i32 0, ptr %i17, align 16, !tbaa !19
  %i183 = shl nsw i32 %i100, 1
  store i32 %i183, ptr %i12, align 4, !tbaa !19
  %i184 = shl nsw i32 %i104, 1
  store i32 %i184, ptr %i14, align 4, !tbaa !19
  %i185 = mul nsw i32 %i89, 3
  store i32 %i185, ptr %i, align 16, !tbaa !19
  %i186 = mul nsw i32 %i96, 3
  store i32 %i186, ptr %i11, align 8, !tbaa !19
  %i187 = shl nsw i32 %i92, 2
  store i32 %i187, ptr %i10, align 4, !tbaa !19
  br label %bb198

bb188:                                            ; preds = %bb178
  %i189 = getelementptr inbounds i8, ptr %arg1, i64 %i116
  %i190 = load i8, ptr %i189, align 1, !tbaa !22
  %i191 = icmp ult i8 %i190, 8
  br i1 %i191, label %bb192, label %bb188.bb198_crit_edge

bb188.bb198_crit_edge:                            ; preds = %bb188
  br label %bb198

bb192:                                            ; preds = %bb188
  store i32 0, ptr %i17, align 16, !tbaa !19
  store i32 0, ptr %i14, align 4, !tbaa !19
  store i32 0, ptr %i16, align 4, !tbaa !19
  %i193 = shl nsw i32 %i111, 1
  store i32 %i193, ptr %i15, align 8, !tbaa !19
  %i194 = shl nsw i32 %i96, 1
  store i32 %i194, ptr %i11, align 8, !tbaa !19
  %i195 = mul nsw i32 %i92, 3
  store i32 %i195, ptr %i10, align 4, !tbaa !19
  %i196 = mul nsw i32 %i100, 3
  store i32 %i196, ptr %i12, align 4, !tbaa !19
  %i197 = shl nsw i32 %i89, 2
  store i32 %i197, ptr %i, align 16, !tbaa !19
  br label %bb198

bb198:                                            ; preds = %bb188.bb198_crit_edge, %bb192, %bb182, %bb172, %bb162, %bb152, %bb142, %bb132, %bb122
  br label %bb199

bb199:                                            ; preds = %bb221.bb199_crit_edge, %bb198
  %i200 = phi i64 [ %i222, %bb221.bb199_crit_edge ], [ 0, %bb198 ]
  %i201 = phi i32 [ %i218, %bb221.bb199_crit_edge ], [ %i26, %bb198 ]
  %i202 = phi i32 [ %i216, %bb221.bb199_crit_edge ], [ %i27, %bb198 ]
  %i203 = phi i32 [ %i215, %bb221.bb199_crit_edge ], [ 0, %bb198 ]
  %i204 = mul nuw nsw i64 %i200, 3
  %i205 = trunc i64 %i200 to i32
  br label %bb206

bb206:                                            ; preds = %bb206.bb206_crit_edge, %bb199
  %i207 = phi i64 [ 0, %bb199 ], [ %i219, %bb206.bb206_crit_edge ]
  %i208 = phi i32 [ %i201, %bb199 ], [ %i218, %bb206.bb206_crit_edge ]
  %i209 = phi i32 [ %i202, %bb199 ], [ %i216, %bb206.bb206_crit_edge ]
  %i210 = phi i32 [ %i203, %bb199 ], [ %i215, %bb206.bb206_crit_edge ]
  %i211 = add nuw nsw i64 %i207, %i204
  %i212 = getelementptr inbounds [9 x i32], ptr %i, i64 0, i64 %i211
  %i213 = load i32, ptr %i212, align 4, !tbaa !19
  %i214 = icmp sgt i32 %i213, %i210
  %i215 = tail call i32 @llvm.smax.i32(i32 %i213, i32 %i210)
  %i216 = select i1 %i214, i32 %i205, i32 %i209
  %i217 = trunc i64 %i207 to i32
  %i218 = select i1 %i214, i32 %i217, i32 %i208
  %i219 = add nuw nsw i64 %i207, 1
  %i220 = icmp eq i64 %i219, 3
  br i1 %i220, label %bb221, label %bb206.bb206_crit_edge, !llvm.loop !45

bb206.bb206_crit_edge:                            ; preds = %bb206
  br label %bb206

bb221:                                            ; preds = %bb206
  %i222 = add nuw nsw i64 %i200, 1
  %i223 = icmp eq i64 %i222, 3
  br i1 %i223, label %bb224, label %bb221.bb199_crit_edge, !llvm.loop !46

bb221.bb199_crit_edge:                            ; preds = %bb221
  br label %bb199

bb224:                                            ; preds = %bb221
  %i225 = icmp sgt i32 %i215, 0
  br i1 %i225, label %bb226, label %bb224.bb248_crit_edge

bb224.bb248_crit_edge:                            ; preds = %bb224
  br label %bb248

bb226:                                            ; preds = %bb224
  %i227 = load i8, ptr %i31, align 1, !tbaa !22
  %i228 = icmp ult i8 %i227, 4
  %i229 = add i8 %i227, 1
  %i230 = select i1 %i228, i8 4, i8 %i229
  %i231 = add i32 %i25, -1
  %i232 = add i32 %i231, %i216
  %i233 = mul nsw i32 %i232, %arg2
  %i234 = add i32 %i218, %i24
  %i235 = add i32 %i234, %i233
  %i236 = sext i32 %i235 to i64
  %i237 = getelementptr i8, ptr %i18, i64 %i236
  store i8 %i230, ptr %i237, align 1, !tbaa !22
  %i238 = shl nsw i32 %i216, 1
  %i239 = add nsw i32 %i238, %i218
  %i240 = icmp slt i32 %i239, 3
  br i1 %i240, label %bb241, label %bb226.bb248_crit_edge

bb226.bb248_crit_edge:                            ; preds = %bb226
  br label %bb248

bb241:                                            ; preds = %bb226
  %i242 = add i32 %i25, -1
  %i243 = add i32 %i242, %i216
  %i244 = add i32 %i24, -2
  %i245 = add i32 %i244, %i218
  %i246 = tail call i32 @llvm.smax.i32(i32 %i243, i32 4)
  %i247 = tail call i32 @llvm.smax.i32(i32 %i245, i32 4)
  br label %bb248

bb248:                                            ; preds = %bb226.bb248_crit_edge, %bb224.bb248_crit_edge, %bb82.bb248_crit_edge, %bb34.bb248_crit_edge, %bb241, %bb81
  %i249 = phi i32 [ %i216, %bb241 ], [ %i216, %bb226.bb248_crit_edge ], [ %i216, %bb224.bb248_crit_edge ], [ %i27, %bb82.bb248_crit_edge ], [ %i27, %bb81 ], [ %i27, %bb34.bb248_crit_edge ]
  %i250 = phi i32 [ %i218, %bb241 ], [ %i218, %bb226.bb248_crit_edge ], [ %i218, %bb224.bb248_crit_edge ], [ %i26, %bb82.bb248_crit_edge ], [ %i26, %bb81 ], [ %i26, %bb34.bb248_crit_edge ]
  %i251 = phi i32 [ %i246, %bb241 ], [ %i25, %bb226.bb248_crit_edge ], [ %i25, %bb224.bb248_crit_edge ], [ %i25, %bb82.bb248_crit_edge ], [ %i25, %bb81 ], [ %i25, %bb34.bb248_crit_edge ]
  %i252 = phi i32 [ %i247, %bb241 ], [ %i24, %bb226.bb248_crit_edge ], [ %i24, %bb224.bb248_crit_edge ], [ %i24, %bb82.bb248_crit_edge ], [ %i24, %bb81 ], [ %i24, %bb34.bb248_crit_edge ]
  %i253 = icmp eq i32 %i80, 2
  br i1 %i253, label %bb254, label %bb248.bb441_crit_edge

bb248.bb441_crit_edge:                            ; preds = %bb248
  br label %bb441

bb254:                                            ; preds = %bb248
  %i255 = add nsw i32 %i251, -1
  %i256 = mul nsw i32 %i255, %arg2
  %i257 = add nsw i32 %i256, %i252
  %i258 = sext i32 %i257 to i64
  %i259 = getelementptr i8, ptr %arg1, i64 %i258
  %i260 = getelementptr i8, ptr %i259, i64 -1
  %i261 = load i8, ptr %i260, align 1, !tbaa !22
  %i262 = icmp ult i8 %i261, 8
  %i263 = zext i1 %i262 to i32
  %i264 = getelementptr i8, ptr %i259, i64 1
  %i265 = load i8, ptr %i264, align 1, !tbaa !22
  %i266 = icmp ult i8 %i265, 8
  %i267 = zext i1 %i266 to i32
  %i268 = add nsw i32 %i251, 1
  %i269 = mul nsw i32 %i268, %arg2
  %i270 = add nsw i32 %i269, %i252
  %i271 = sext i32 %i270 to i64
  %i272 = getelementptr i8, ptr %arg1, i64 %i271
  %i273 = getelementptr i8, ptr %i272, i64 -1
  %i274 = load i8, ptr %i273, align 1, !tbaa !22
  %i275 = icmp ult i8 %i274, 8
  %i276 = zext i1 %i275 to i32
  %i277 = getelementptr i8, ptr %i272, i64 1
  %i278 = load i8, ptr %i277, align 1, !tbaa !22
  %i279 = icmp ult i8 %i278, 8
  %i280 = zext i1 %i279 to i32
  %i281 = add nuw nsw i32 %i267, %i263
  %i282 = add nuw nsw i32 %i281, %i276
  %i283 = add nuw nsw i32 %i282, %i280
  %i284 = icmp eq i32 %i283, 2
  br i1 %i284, label %bb285, label %bb254.bb362_crit_edge

bb254.bb362_crit_edge:                            ; preds = %bb254
  br label %bb362

bb285:                                            ; preds = %bb254
  %i286 = or i32 %i280, %i263
  %i287 = or i32 %i276, %i267
  %i288 = and i32 %i286, %i287
  %i289 = icmp eq i32 %i288, 0
  br i1 %i289, label %bb285.bb362_crit_edge, label %bb290

bb285.bb362_crit_edge:                            ; preds = %bb285
  br label %bb362

bb290:                                            ; preds = %bb285
  %i291 = xor i1 %i266, true
  %i292 = xor i1 %i266, true
  br i1 %i262, label %bb293, label %bb296

bb293:                                            ; preds = %bb290
  %i294 = sext i1 %i291 to i32
  %i295 = sext i1 %i266 to i32
  br label %bb299

bb296:                                            ; preds = %bb290
  %i297 = zext i1 %i266 to i32
  %i298 = zext i1 %i292 to i32
  br label %bb299

bb299:                                            ; preds = %bb296, %bb293
  %i300 = phi i1 [ %i266, %bb293 ], [ %i291, %bb296 ]
  %i301 = phi i32 [ %i294, %bb293 ], [ %i297, %bb296 ]
  %i302 = phi i1 [ %i292, %bb293 ], [ %i266, %bb296 ]
  %i303 = phi i32 [ %i295, %bb293 ], [ %i298, %bb296 ]
  %i304 = add nsw i32 %i303, %i251
  %i305 = mul nsw i32 %i304, %arg2
  %i306 = add i32 %i301, %i252
  %i307 = add i32 %i306, %i305
  %i308 = sext i32 %i307 to i64
  %i309 = getelementptr inbounds i32, ptr %arg, i64 %i308
  %i310 = load i32, ptr %i309, align 4, !tbaa !19
  %i311 = sitofp i32 %i310 to float
  %i312 = sitofp i32 %i36 to float
  %i313 = fdiv float %i311, %i312
  %i314 = fpext float %i313 to double
  %i315 = fcmp ogt double %i314, 0x3FE6666666666666
  br i1 %i315, label %bb316, label %bb299.bb441_crit_edge

bb299.bb441_crit_edge:                            ; preds = %bb299
  br label %bb441

bb316:                                            ; preds = %bb299
  br i1 %i300, label %bb317, label %bb316.bb334_crit_edge

bb316.bb334_crit_edge:                            ; preds = %bb316
  br label %bb334

bb317:                                            ; preds = %bb316
  %i318 = shl nsw i32 %i303, 1
  %i319 = add nsw i32 %i318, %i251
  %i320 = mul nsw i32 %i319, %arg2
  %i321 = add nsw i32 %i320, %i252
  %i322 = sext i32 %i321 to i64
  %i323 = getelementptr inbounds i8, ptr %arg1, i64 %i322
  %i324 = load i8, ptr %i323, align 1, !tbaa !22
  %i325 = icmp ugt i8 %i324, 7
  br i1 %i325, label %bb326, label %bb317.bb334_crit_edge

bb317.bb334_crit_edge:                            ; preds = %bb317
  br label %bb334

bb326:                                            ; preds = %bb317
  %i327 = getelementptr i8, ptr %i323, i64 -1
  %i328 = load i8, ptr %i327, align 1, !tbaa !22
  %i329 = icmp ugt i8 %i328, 7
  br i1 %i329, label %bb330, label %bb326.bb334_crit_edge

bb326.bb334_crit_edge:                            ; preds = %bb326
  br label %bb334

bb330:                                            ; preds = %bb326
  %i331 = getelementptr i8, ptr %i323, i64 1
  %i332 = load i8, ptr %i331, align 1, !tbaa !22
  %i333 = icmp ugt i8 %i332, 7
  br i1 %i333, label %bb330.bb356_crit_edge, label %bb330.bb334_crit_edge

bb330.bb334_crit_edge:                            ; preds = %bb330
  br label %bb334

bb330.bb356_crit_edge:                            ; preds = %bb330
  br label %bb356

bb334:                                            ; preds = %bb330.bb334_crit_edge, %bb326.bb334_crit_edge, %bb317.bb334_crit_edge, %bb316.bb334_crit_edge
  br i1 %i302, label %bb335, label %bb334.bb441_crit_edge

bb334.bb441_crit_edge:                            ; preds = %bb334
  br label %bb441

bb335:                                            ; preds = %bb334
  %i336 = mul nsw i32 %i251, %arg2
  %i337 = add nsw i32 %i336, %i252
  %i338 = shl nsw i32 %i301, 1
  %i339 = add nsw i32 %i337, %i338
  %i340 = sext i32 %i339 to i64
  %i341 = getelementptr inbounds i8, ptr %arg1, i64 %i340
  %i342 = load i8, ptr %i341, align 1, !tbaa !22
  %i343 = icmp ugt i8 %i342, 7
  br i1 %i343, label %bb344, label %bb335.bb441_crit_edge

bb335.bb441_crit_edge:                            ; preds = %bb335
  br label %bb441

bb344:                                            ; preds = %bb335
  %i345 = add nsw i32 %i338, %i270
  %i346 = sext i32 %i345 to i64
  %i347 = getelementptr inbounds i8, ptr %arg1, i64 %i346
  %i348 = load i8, ptr %i347, align 1, !tbaa !22
  %i349 = icmp ugt i8 %i348, 7
  br i1 %i349, label %bb350, label %bb344.bb441_crit_edge

bb344.bb441_crit_edge:                            ; preds = %bb344
  br label %bb441

bb350:                                            ; preds = %bb344
  %i351 = add nsw i32 %i338, %i257
  %i352 = sext i32 %i351 to i64
  %i353 = getelementptr inbounds i8, ptr %arg1, i64 %i352
  %i354 = load i8, ptr %i353, align 1, !tbaa !22
  %i355 = icmp ugt i8 %i354, 7
  br i1 %i355, label %bb350.bb356_crit_edge, label %bb350.bb441_crit_edge

bb350.bb441_crit_edge:                            ; preds = %bb350
  br label %bb441

bb350.bb356_crit_edge:                            ; preds = %bb350
  br label %bb356

bb356:                                            ; preds = %bb350.bb356_crit_edge, %bb330.bb356_crit_edge
  %i357 = mul nsw i32 %i251, %arg2
  %i358 = add nsw i32 %i357, %i252
  %i359 = sext i32 %i358 to i64
  %i360 = getelementptr inbounds i8, ptr %arg1, i64 %i359
  store i8 100, ptr %i360, align 1, !tbaa !22
  %i361 = getelementptr inbounds i8, ptr %arg1, i64 %i308
  store i8 3, ptr %i361, align 1, !tbaa !22
  br label %bb441

bb362:                                            ; preds = %bb285.bb362_crit_edge, %bb254.bb362_crit_edge
  %i363 = load i8, ptr %i259, align 1, !tbaa !22
  %i364 = icmp ult i8 %i363, 8
  %i365 = zext i1 %i364 to i32
  %i366 = mul nsw i32 %i251, %arg2
  %i367 = add nsw i32 %i366, %i252
  %i368 = sext i32 %i367 to i64
  %i369 = getelementptr i8, ptr %arg1, i64 %i368
  %i370 = getelementptr i8, ptr %i369, i64 1
  %i371 = load i8, ptr %i370, align 1, !tbaa !22
  %i372 = icmp ult i8 %i371, 8
  %i373 = zext i1 %i372 to i32
  %i374 = load i8, ptr %i272, align 1, !tbaa !22
  %i375 = icmp ult i8 %i374, 8
  %i376 = zext i1 %i375 to i32
  %i377 = getelementptr i8, ptr %i369, i64 -1
  %i378 = load i8, ptr %i377, align 1, !tbaa !22
  %i379 = icmp ult i8 %i378, 8
  %i380 = zext i1 %i379 to i32
  %i381 = add nuw nsw i32 %i373, %i365
  %i382 = add nuw nsw i32 %i381, %i376
  %i383 = add nuw nsw i32 %i382, %i380
  %i384 = icmp eq i32 %i383, 2
  br i1 %i384, label %bb385, label %bb362.bb441_crit_edge

bb362.bb441_crit_edge:                            ; preds = %bb362
  br label %bb441

bb385:                                            ; preds = %bb362
  %i386 = or i32 %i380, %i373
  %i387 = or i32 %i376, %i365
  %i388 = and i32 %i386, %i387
  %i389 = icmp eq i32 %i388, 0
  br i1 %i389, label %bb385.bb441_crit_edge, label %bb390

bb385.bb441_crit_edge:                            ; preds = %bb385
  br label %bb441

bb390:                                            ; preds = %bb385
  %i391 = add nsw i32 %i251, -2
  %i392 = mul nsw i32 %i391, %arg2
  %i393 = add nsw i32 %i392, %i252
  %i394 = sext i32 %i393 to i64
  %i395 = getelementptr i8, ptr %arg1, i64 %i394
  %i396 = getelementptr i8, ptr %i395, i64 -1
  %i397 = load i8, ptr %i396, align 1, !tbaa !22
  %i398 = icmp ult i8 %i397, 8
  %i399 = getelementptr i8, ptr %i395, i64 1
  %i400 = load i8, ptr %i399, align 1, !tbaa !22
  %i401 = icmp ult i8 %i400, 8
  %i402 = or i1 %i398, %i401
  %i403 = and i1 %i364, %i402
  %i404 = getelementptr i8, ptr %i259, i64 -2
  %i405 = load i8, ptr %i404, align 1, !tbaa !22
  %i406 = icmp ult i8 %i405, 8
  %i407 = getelementptr i8, ptr %i272, i64 -2
  %i408 = load i8, ptr %i407, align 1, !tbaa !22
  %i409 = icmp ult i8 %i408, 8
  %i410 = or i1 %i406, %i409
  %i411 = and i1 %i379, %i410
  %i412 = or i1 %i403, %i411
  %i413 = getelementptr i8, ptr %i259, i64 2
  %i414 = load i8, ptr %i413, align 1, !tbaa !22
  %i415 = icmp ult i8 %i414, 8
  %i416 = getelementptr i8, ptr %i272, i64 2
  %i417 = load i8, ptr %i416, align 1, !tbaa !22
  %i418 = icmp ult i8 %i417, 8
  %i419 = or i1 %i415, %i418
  %i420 = and i1 %i372, %i419
  %i421 = or i1 %i412, %i420
  %i422 = add nsw i32 %i251, 2
  %i423 = mul nsw i32 %i422, %arg2
  %i424 = add nsw i32 %i423, %i252
  %i425 = sext i32 %i424 to i64
  %i426 = getelementptr i8, ptr %arg1, i64 %i425
  %i427 = getelementptr i8, ptr %i426, i64 -1
  %i428 = load i8, ptr %i427, align 1, !tbaa !22
  %i429 = icmp ult i8 %i428, 8
  %i430 = getelementptr i8, ptr %i426, i64 1
  %i431 = load i8, ptr %i430, align 1, !tbaa !22
  %i432 = icmp ult i8 %i431, 8
  %i433 = or i1 %i429, %i432
  %i434 = and i1 %i375, %i433
  %i435 = or i1 %i421, %i434
  br i1 %i435, label %bb436, label %bb390.bb441_crit_edge

bb390.bb441_crit_edge:                            ; preds = %bb390
  br label %bb441

bb436:                                            ; preds = %bb390
  store i8 100, ptr %i369, align 1, !tbaa !22
  %i437 = tail call i32 @llvm.smax.i32(i32 %i251, i32 5)
  %i438 = add nsw i32 %i437, -1
  %i439 = tail call i32 @llvm.smax.i32(i32 %i252, i32 6)
  %i440 = add nsw i32 %i439, -2
  br label %bb441

bb441:                                            ; preds = %bb390.bb441_crit_edge, %bb385.bb441_crit_edge, %bb362.bb441_crit_edge, %bb350.bb441_crit_edge, %bb344.bb441_crit_edge, %bb335.bb441_crit_edge, %bb334.bb441_crit_edge, %bb299.bb441_crit_edge, %bb248.bb441_crit_edge, %bb436, %bb356
  %i442 = phi i32 [ %i251, %bb356 ], [ %i251, %bb350.bb441_crit_edge ], [ %i251, %bb344.bb441_crit_edge ], [ %i251, %bb335.bb441_crit_edge ], [ %i251, %bb334.bb441_crit_edge ], [ %i251, %bb299.bb441_crit_edge ], [ %i438, %bb436 ], [ %i251, %bb390.bb441_crit_edge ], [ %i251, %bb385.bb441_crit_edge ], [ %i251, %bb362.bb441_crit_edge ], [ %i251, %bb248.bb441_crit_edge ]
  %i443 = phi i32 [ %i252, %bb356 ], [ %i252, %bb350.bb441_crit_edge ], [ %i252, %bb344.bb441_crit_edge ], [ %i252, %bb335.bb441_crit_edge ], [ %i252, %bb334.bb441_crit_edge ], [ %i252, %bb299.bb441_crit_edge ], [ %i440, %bb436 ], [ %i252, %bb390.bb441_crit_edge ], [ %i252, %bb385.bb441_crit_edge ], [ %i252, %bb362.bb441_crit_edge ], [ %i252, %bb248.bb441_crit_edge ]
  %i444 = icmp sgt i32 %i80, 2
  br i1 %i444, label %bb445, label %bb441.bb516_crit_edge

bb441.bb516_crit_edge:                            ; preds = %bb441
  br label %bb516

bb445:                                            ; preds = %bb441
  %i446 = add nsw i32 %i442, -1
  %i447 = mul nsw i32 %i446, %arg2
  %i448 = add nsw i32 %i447, %i443
  %i449 = sext i32 %i448 to i64
  %i450 = getelementptr inbounds i8, ptr %arg1, i64 %i449
  %i451 = load i8, ptr %i450, align 1, !tbaa !22
  %i452 = icmp ult i8 %i451, 8
  %i453 = zext i1 %i452 to i32
  %i454 = mul nsw i32 %i442, %arg2
  %i455 = add nsw i32 %i454, %i443
  %i456 = sext i32 %i455 to i64
  %i457 = getelementptr i8, ptr %arg1, i64 %i456
  %i458 = getelementptr i8, ptr %i457, i64 1
  %i459 = load i8, ptr %i458, align 1, !tbaa !22
  %i460 = icmp ult i8 %i459, 8
  %i461 = zext i1 %i460 to i32
  %i462 = add nsw i32 %i442, 1
  %i463 = mul nsw i32 %i462, %arg2
  %i464 = add nsw i32 %i463, %i443
  %i465 = sext i32 %i464 to i64
  %i466 = getelementptr inbounds i8, ptr %arg1, i64 %i465
  %i467 = load i8, ptr %i466, align 1, !tbaa !22
  %i468 = icmp ult i8 %i467, 8
  %i469 = zext i1 %i468 to i32
  %i470 = getelementptr i8, ptr %i457, i64 -1
  %i471 = load i8, ptr %i470, align 1, !tbaa !22
  %i472 = icmp ult i8 %i471, 8
  %i473 = zext i1 %i472 to i32
  %i474 = add nuw nsw i32 %i461, %i453
  %i475 = add nuw nsw i32 %i474, %i469
  %i476 = add nuw nsw i32 %i475, %i473
  %i477 = icmp ugt i32 %i476, 1
  br i1 %i477, label %bb478, label %bb445.bb516_crit_edge

bb445.bb516_crit_edge:                            ; preds = %bb445
  br label %bb516

bb478:                                            ; preds = %bb445
  %i479 = getelementptr i8, ptr %i450, i64 -1
  %i480 = load i8, ptr %i479, align 1, !tbaa !22
  %i481 = icmp ult i8 %i480, 8
  %i482 = getelementptr i8, ptr %i450, i64 1
  %i483 = load i8, ptr %i482, align 1, !tbaa !22
  %i484 = icmp ult i8 %i483, 8
  %i485 = getelementptr i8, ptr %i466, i64 -1
  %i486 = load i8, ptr %i485, align 1, !tbaa !22
  %i487 = icmp ult i8 %i486, 8
  %i488 = getelementptr i8, ptr %i466, i64 1
  %i489 = load i8, ptr %i488, align 1, !tbaa !22
  %i490 = icmp ult i8 %i489, 8
  %i491 = or i1 %i452, %i481
  %i492 = zext i1 %i491 to i32
  %i493 = or i1 %i460, %i484
  %i494 = zext i1 %i493 to i32
  %i495 = or i1 %i468, %i490
  %i496 = zext i1 %i495 to i32
  %i497 = or i1 %i472, %i487
  %i498 = zext i1 %i497 to i32
  %i499 = and i32 %i494, %i453
  %i500 = and i32 %i496, %i461
  %i501 = and i32 %i498, %i469
  %i502 = and i32 %i492, %i473
  %i503 = add nuw nsw i32 %i494, %i492
  %i504 = add nuw nsw i32 %i503, %i498
  %i505 = add nuw nsw i32 %i502, %i499
  %i506 = add nuw nsw i32 %i504, %i496
  %i507 = add nuw nsw i32 %i505, %i501
  %i508 = add nuw nsw i32 %i507, %i500
  %i509 = sub nsw i32 %i506, %i508
  %i510 = icmp slt i32 %i509, 2
  br i1 %i510, label %bb511, label %bb478.bb516_crit_edge

bb478.bb516_crit_edge:                            ; preds = %bb478
  br label %bb516

bb511:                                            ; preds = %bb478
  store i8 100, ptr %i457, align 1, !tbaa !22
  %i512 = tail call i32 @llvm.smax.i32(i32 %i442, i32 5)
  %i513 = add nsw i32 %i512, -1
  %i514 = tail call i32 @llvm.smax.i32(i32 %i443, i32 6)
  %i515 = add nsw i32 %i514, -2
  br label %bb516

bb516:                                            ; preds = %bb478.bb516_crit_edge, %bb445.bb516_crit_edge, %bb441.bb516_crit_edge, %bb23.bb516_crit_edge, %bb511
  %i517 = phi i32 [ %i249, %bb511 ], [ %i249, %bb478.bb516_crit_edge ], [ %i249, %bb445.bb516_crit_edge ], [ %i249, %bb441.bb516_crit_edge ], [ %i27, %bb23.bb516_crit_edge ]
  %i518 = phi i32 [ %i250, %bb511 ], [ %i250, %bb478.bb516_crit_edge ], [ %i250, %bb445.bb516_crit_edge ], [ %i250, %bb441.bb516_crit_edge ], [ %i26, %bb23.bb516_crit_edge ]
  %i519 = phi i32 [ %i513, %bb511 ], [ %i442, %bb478.bb516_crit_edge ], [ %i442, %bb445.bb516_crit_edge ], [ %i442, %bb441.bb516_crit_edge ], [ %i25, %bb23.bb516_crit_edge ]
  %i520 = phi i32 [ %i515, %bb511 ], [ %i443, %bb478.bb516_crit_edge ], [ %i443, %bb445.bb516_crit_edge ], [ %i443, %bb441.bb516_crit_edge ], [ %i24, %bb23.bb516_crit_edge ]
  %i521 = add nsw i32 %i520, 1
  %i522 = icmp slt i32 %i521, %i7
  br i1 %i522, label %bb516.bb23_crit_edge, label %bb523.loopexit, !llvm.loop !47

bb516.bb23_crit_edge:                             ; preds = %bb516
  br label %bb23

bb523.loopexit:                                   ; preds = %bb516
  br label %bb523

bb523:                                            ; preds = %bb19.bb523_crit_edge, %bb523.loopexit
  %i524 = phi i32 [ %i22, %bb19.bb523_crit_edge ], [ %i517, %bb523.loopexit ]
  %i525 = phi i32 [ %i21, %bb19.bb523_crit_edge ], [ %i518, %bb523.loopexit ]
  %i526 = phi i32 [ %i20, %bb19.bb523_crit_edge ], [ %i519, %bb523.loopexit ]
  %i527 = add nsw i32 %i526, 1
  %i528 = icmp slt i32 %i527, %i4
  br i1 %i528, label %bb523.bb19_crit_edge, label %bb529.loopexit, !llvm.loop !48

bb523.bb19_crit_edge:                             ; preds = %bb523
  br label %bb19

bb529.loopexit:                                   ; preds = %bb523
  br label %bb529

bb529:                                            ; preds = %bb.bb529_crit_edge, %bb529.loopexit
  call void @llvm.lifetime.end.p0(i64 36, ptr nonnull %i) #21
  ret void
}

; Function Attrs: nofree nounwind memory(readwrite, inaccessiblemem: write) uwtable
define dso_local void @susan_edges(ptr noundef readonly %arg, ptr nocapture noundef %arg1, ptr nocapture noundef writeonly %arg2, ptr noundef readonly %arg3, i32 noundef %arg4, i32 noundef %arg5, i32 noundef %arg6) local_unnamed_addr #19 {
bb:
  %i = mul nsw i32 %arg6, %arg5
  %i7 = sext i32 %i to i64
  %i8 = shl nsw i64 %i7, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %arg1, i8 0, i64 %i8, i1 false)
  %i9 = icmp sgt i32 %arg6, 6
  br i1 %i9, label %bb10, label %bb.bb31_crit_edge

bb.bb31_crit_edge:                                ; preds = %bb
  br label %bb31

bb10:                                             ; preds = %bb
  %i11 = add nsw i32 %arg6, -3
  %i12 = add i32 %arg5, -3
  %i13 = icmp sgt i32 %arg5, 6
  %i14 = sext i32 %i12 to i64
  %i15 = add nsw i32 %arg5, -5
  %i16 = sext i32 %i15 to i64
  %i17 = add nsw i32 %arg5, -6
  %i18 = sext i32 %i17 to i64
  %i19 = sext i32 %arg5 to i64
  %i20 = zext i32 %i11 to i64
  %i21 = zext i32 %i12 to i64
  br label %bb22

bb22:                                             ; preds = %bb355.bb22_crit_edge, %bb10
  %i23 = phi i64 [ 3, %bb10 ], [ %i356, %bb355.bb22_crit_edge ]
  br i1 %i13, label %bb24, label %bb22.bb355_crit_edge

bb22.bb355_crit_edge:                             ; preds = %bb22
  br label %bb355

bb24:                                             ; preds = %bb22
  %i25 = add nsw i64 %i23, -3
  %i26 = mul nsw i64 %i25, %i19
  %i27 = getelementptr inbounds i8, ptr %arg, i64 %i26
  %i28 = trunc i64 %i23 to i32
  %i29 = mul i32 %i28, %arg5
  %i30 = zext i32 %i29 to i64
  br label %bb53

bb31.loopexit:                                    ; preds = %bb355
  br label %bb31

bb31:                                             ; preds = %bb.bb31_crit_edge, %bb31.loopexit
  %i32 = icmp sgt i32 %arg6, 8
  br i1 %i32, label %bb33, label %bb31.bb1186_crit_edge

bb31.bb1186_crit_edge:                            ; preds = %bb31
  br label %bb1186

bb33:                                             ; preds = %bb31
  %i34 = add nsw i32 %arg6, -4
  %i35 = add i32 %arg5, -4
  %i36 = icmp sgt i32 %arg5, 8
  %i37 = add nsw i32 %arg5, -3
  %i38 = sext i32 %i37 to i64
  %i39 = add nsw i32 %arg5, -5
  %i40 = sext i32 %i39 to i64
  %i41 = add nsw i32 %arg5, -6
  %i42 = sext i32 %i41 to i64
  %i43 = add nsw i32 %arg5, -3
  %i44 = sext i32 %i43 to i64
  %i45 = add nsw i32 %arg5, -5
  %i46 = sext i32 %i45 to i64
  %i47 = add nsw i32 %arg5, -6
  %i48 = sext i32 %i47 to i64
  %i49 = sext i32 %arg5 to i64
  %i50 = sext i32 %arg5 to i64
  %i51 = zext i32 %i34 to i64
  %i52 = zext i32 %i35 to i64
  br label %bb358

bb53:                                             ; preds = %bb352.bb53_crit_edge, %bb24
  %i54 = phi i64 [ 3, %bb24 ], [ %i353, %bb352.bb53_crit_edge ]
  %i55 = getelementptr inbounds i8, ptr %i27, i64 %i54
  %i56 = getelementptr inbounds i8, ptr %i55, i64 -1
  %i57 = add nuw nsw i64 %i54, %i30
  %i58 = getelementptr inbounds i8, ptr %arg, i64 %i57
  %i59 = load i8, ptr %i58, align 1, !tbaa !22
  %i60 = zext i8 %i59 to i64
  %i61 = getelementptr inbounds i8, ptr %arg3, i64 %i60
  %i62 = load i8, ptr %i56, align 1, !tbaa !22
  %i63 = zext i8 %i62 to i64
  %i64 = sub nsw i64 0, %i63
  %i65 = getelementptr inbounds i8, ptr %i61, i64 %i64
  %i66 = load i8, ptr %i65, align 1, !tbaa !22
  %i67 = zext i8 %i66 to i32
  %i68 = add nuw nsw i32 %i67, 100
  %i69 = getelementptr inbounds i8, ptr %i55, i64 1
  %i70 = load i8, ptr %i55, align 1, !tbaa !22
  %i71 = zext i8 %i70 to i64
  %i72 = sub nsw i64 0, %i71
  %i73 = getelementptr inbounds i8, ptr %i61, i64 %i72
  %i74 = load i8, ptr %i73, align 1, !tbaa !22
  %i75 = zext i8 %i74 to i32
  %i76 = add nuw nsw i32 %i68, %i75
  %i77 = load i8, ptr %i69, align 1, !tbaa !22
  %i78 = zext i8 %i77 to i64
  %i79 = sub nsw i64 0, %i78
  %i80 = getelementptr inbounds i8, ptr %i61, i64 %i79
  %i81 = load i8, ptr %i80, align 1, !tbaa !22
  %i82 = zext i8 %i81 to i32
  %i83 = add nuw nsw i32 %i76, %i82
  %i84 = getelementptr inbounds i8, ptr %i69, i64 %i14
  %i85 = getelementptr inbounds i8, ptr %i84, i64 1
  %i86 = load i8, ptr %i84, align 1, !tbaa !22
  %i87 = zext i8 %i86 to i64
  %i88 = sub nsw i64 0, %i87
  %i89 = getelementptr inbounds i8, ptr %i61, i64 %i88
  %i90 = load i8, ptr %i89, align 1, !tbaa !22
  %i91 = zext i8 %i90 to i32
  %i92 = add nuw nsw i32 %i83, %i91
  %i93 = getelementptr inbounds i8, ptr %i84, i64 2
  %i94 = load i8, ptr %i85, align 1, !tbaa !22
  %i95 = zext i8 %i94 to i64
  %i96 = sub nsw i64 0, %i95
  %i97 = getelementptr inbounds i8, ptr %i61, i64 %i96
  %i98 = load i8, ptr %i97, align 1, !tbaa !22
  %i99 = zext i8 %i98 to i32
  %i100 = add nuw nsw i32 %i92, %i99
  %i101 = getelementptr inbounds i8, ptr %i84, i64 3
  %i102 = load i8, ptr %i93, align 1, !tbaa !22
  %i103 = zext i8 %i102 to i64
  %i104 = sub nsw i64 0, %i103
  %i105 = getelementptr inbounds i8, ptr %i61, i64 %i104
  %i106 = load i8, ptr %i105, align 1, !tbaa !22
  %i107 = zext i8 %i106 to i32
  %i108 = add nuw nsw i32 %i100, %i107
  %i109 = getelementptr inbounds i8, ptr %i84, i64 4
  %i110 = load i8, ptr %i101, align 1, !tbaa !22
  %i111 = zext i8 %i110 to i64
  %i112 = sub nsw i64 0, %i111
  %i113 = getelementptr inbounds i8, ptr %i61, i64 %i112
  %i114 = load i8, ptr %i113, align 1, !tbaa !22
  %i115 = zext i8 %i114 to i32
  %i116 = add nuw nsw i32 %i108, %i115
  %i117 = load i8, ptr %i109, align 1, !tbaa !22
  %i118 = zext i8 %i117 to i64
  %i119 = sub nsw i64 0, %i118
  %i120 = getelementptr inbounds i8, ptr %i61, i64 %i119
  %i121 = load i8, ptr %i120, align 1, !tbaa !22
  %i122 = zext i8 %i121 to i32
  %i123 = add nuw nsw i32 %i116, %i122
  %i124 = getelementptr inbounds i8, ptr %i109, i64 %i16
  %i125 = getelementptr inbounds i8, ptr %i124, i64 1
  %i126 = load i8, ptr %i124, align 1, !tbaa !22
  %i127 = zext i8 %i126 to i64
  %i128 = sub nsw i64 0, %i127
  %i129 = getelementptr inbounds i8, ptr %i61, i64 %i128
  %i130 = load i8, ptr %i129, align 1, !tbaa !22
  %i131 = zext i8 %i130 to i32
  %i132 = add nuw nsw i32 %i123, %i131
  %i133 = getelementptr inbounds i8, ptr %i124, i64 2
  %i134 = load i8, ptr %i125, align 1, !tbaa !22
  %i135 = zext i8 %i134 to i64
  %i136 = sub nsw i64 0, %i135
  %i137 = getelementptr inbounds i8, ptr %i61, i64 %i136
  %i138 = load i8, ptr %i137, align 1, !tbaa !22
  %i139 = zext i8 %i138 to i32
  %i140 = add nuw nsw i32 %i132, %i139
  %i141 = getelementptr inbounds i8, ptr %i124, i64 3
  %i142 = load i8, ptr %i133, align 1, !tbaa !22
  %i143 = zext i8 %i142 to i64
  %i144 = sub nsw i64 0, %i143
  %i145 = getelementptr inbounds i8, ptr %i61, i64 %i144
  %i146 = load i8, ptr %i145, align 1, !tbaa !22
  %i147 = zext i8 %i146 to i32
  %i148 = add nuw nsw i32 %i140, %i147
  %i149 = getelementptr inbounds i8, ptr %i124, i64 4
  %i150 = load i8, ptr %i141, align 1, !tbaa !22
  %i151 = zext i8 %i150 to i64
  %i152 = sub nsw i64 0, %i151
  %i153 = getelementptr inbounds i8, ptr %i61, i64 %i152
  %i154 = load i8, ptr %i153, align 1, !tbaa !22
  %i155 = zext i8 %i154 to i32
  %i156 = add nuw nsw i32 %i148, %i155
  %i157 = getelementptr inbounds i8, ptr %i124, i64 5
  %i158 = load i8, ptr %i149, align 1, !tbaa !22
  %i159 = zext i8 %i158 to i64
  %i160 = sub nsw i64 0, %i159
  %i161 = getelementptr inbounds i8, ptr %i61, i64 %i160
  %i162 = load i8, ptr %i161, align 1, !tbaa !22
  %i163 = zext i8 %i162 to i32
  %i164 = add nuw nsw i32 %i156, %i163
  %i165 = getelementptr inbounds i8, ptr %i124, i64 6
  %i166 = load i8, ptr %i157, align 1, !tbaa !22
  %i167 = zext i8 %i166 to i64
  %i168 = sub nsw i64 0, %i167
  %i169 = getelementptr inbounds i8, ptr %i61, i64 %i168
  %i170 = load i8, ptr %i169, align 1, !tbaa !22
  %i171 = zext i8 %i170 to i32
  %i172 = add nuw nsw i32 %i164, %i171
  %i173 = load i8, ptr %i165, align 1, !tbaa !22
  %i174 = zext i8 %i173 to i64
  %i175 = sub nsw i64 0, %i174
  %i176 = getelementptr inbounds i8, ptr %i61, i64 %i175
  %i177 = load i8, ptr %i176, align 1, !tbaa !22
  %i178 = zext i8 %i177 to i32
  %i179 = add nuw nsw i32 %i172, %i178
  %i180 = getelementptr inbounds i8, ptr %i165, i64 %i18
  %i181 = getelementptr inbounds i8, ptr %i180, i64 1
  %i182 = load i8, ptr %i180, align 1, !tbaa !22
  %i183 = zext i8 %i182 to i64
  %i184 = sub nsw i64 0, %i183
  %i185 = getelementptr inbounds i8, ptr %i61, i64 %i184
  %i186 = load i8, ptr %i185, align 1, !tbaa !22
  %i187 = zext i8 %i186 to i32
  %i188 = add nuw nsw i32 %i179, %i187
  %i189 = getelementptr inbounds i8, ptr %i180, i64 2
  %i190 = load i8, ptr %i181, align 1, !tbaa !22
  %i191 = zext i8 %i190 to i64
  %i192 = sub nsw i64 0, %i191
  %i193 = getelementptr inbounds i8, ptr %i61, i64 %i192
  %i194 = load i8, ptr %i193, align 1, !tbaa !22
  %i195 = zext i8 %i194 to i32
  %i196 = add nuw nsw i32 %i188, %i195
  %i197 = load i8, ptr %i189, align 1, !tbaa !22
  %i198 = zext i8 %i197 to i64
  %i199 = sub nsw i64 0, %i198
  %i200 = getelementptr inbounds i8, ptr %i61, i64 %i199
  %i201 = load i8, ptr %i200, align 1, !tbaa !22
  %i202 = zext i8 %i201 to i32
  %i203 = add nuw nsw i32 %i196, %i202
  %i204 = getelementptr inbounds i8, ptr %i180, i64 4
  %i205 = getelementptr inbounds i8, ptr %i180, i64 5
  %i206 = load i8, ptr %i204, align 1, !tbaa !22
  %i207 = zext i8 %i206 to i64
  %i208 = sub nsw i64 0, %i207
  %i209 = getelementptr inbounds i8, ptr %i61, i64 %i208
  %i210 = load i8, ptr %i209, align 1, !tbaa !22
  %i211 = zext i8 %i210 to i32
  %i212 = add nuw nsw i32 %i203, %i211
  %i213 = getelementptr inbounds i8, ptr %i180, i64 6
  %i214 = load i8, ptr %i205, align 1, !tbaa !22
  %i215 = zext i8 %i214 to i64
  %i216 = sub nsw i64 0, %i215
  %i217 = getelementptr inbounds i8, ptr %i61, i64 %i216
  %i218 = load i8, ptr %i217, align 1, !tbaa !22
  %i219 = zext i8 %i218 to i32
  %i220 = add nuw nsw i32 %i212, %i219
  %i221 = load i8, ptr %i213, align 1, !tbaa !22
  %i222 = zext i8 %i221 to i64
  %i223 = sub nsw i64 0, %i222
  %i224 = getelementptr inbounds i8, ptr %i61, i64 %i223
  %i225 = load i8, ptr %i224, align 1, !tbaa !22
  %i226 = zext i8 %i225 to i32
  %i227 = add nuw nsw i32 %i220, %i226
  %i228 = getelementptr inbounds i8, ptr %i213, i64 %i18
  %i229 = getelementptr inbounds i8, ptr %i228, i64 1
  %i230 = load i8, ptr %i228, align 1, !tbaa !22
  %i231 = zext i8 %i230 to i64
  %i232 = sub nsw i64 0, %i231
  %i233 = getelementptr inbounds i8, ptr %i61, i64 %i232
  %i234 = load i8, ptr %i233, align 1, !tbaa !22
  %i235 = zext i8 %i234 to i32
  %i236 = add nuw nsw i32 %i227, %i235
  %i237 = getelementptr inbounds i8, ptr %i228, i64 2
  %i238 = load i8, ptr %i229, align 1, !tbaa !22
  %i239 = zext i8 %i238 to i64
  %i240 = sub nsw i64 0, %i239
  %i241 = getelementptr inbounds i8, ptr %i61, i64 %i240
  %i242 = load i8, ptr %i241, align 1, !tbaa !22
  %i243 = zext i8 %i242 to i32
  %i244 = add nuw nsw i32 %i236, %i243
  %i245 = getelementptr inbounds i8, ptr %i228, i64 3
  %i246 = load i8, ptr %i237, align 1, !tbaa !22
  %i247 = zext i8 %i246 to i64
  %i248 = sub nsw i64 0, %i247
  %i249 = getelementptr inbounds i8, ptr %i61, i64 %i248
  %i250 = load i8, ptr %i249, align 1, !tbaa !22
  %i251 = zext i8 %i250 to i32
  %i252 = add nuw nsw i32 %i244, %i251
  %i253 = getelementptr inbounds i8, ptr %i228, i64 4
  %i254 = load i8, ptr %i245, align 1, !tbaa !22
  %i255 = zext i8 %i254 to i64
  %i256 = sub nsw i64 0, %i255
  %i257 = getelementptr inbounds i8, ptr %i61, i64 %i256
  %i258 = load i8, ptr %i257, align 1, !tbaa !22
  %i259 = zext i8 %i258 to i32
  %i260 = add nuw nsw i32 %i252, %i259
  %i261 = getelementptr inbounds i8, ptr %i228, i64 5
  %i262 = load i8, ptr %i253, align 1, !tbaa !22
  %i263 = zext i8 %i262 to i64
  %i264 = sub nsw i64 0, %i263
  %i265 = getelementptr inbounds i8, ptr %i61, i64 %i264
  %i266 = load i8, ptr %i265, align 1, !tbaa !22
  %i267 = zext i8 %i266 to i32
  %i268 = add nuw nsw i32 %i260, %i267
  %i269 = getelementptr inbounds i8, ptr %i228, i64 6
  %i270 = load i8, ptr %i261, align 1, !tbaa !22
  %i271 = zext i8 %i270 to i64
  %i272 = sub nsw i64 0, %i271
  %i273 = getelementptr inbounds i8, ptr %i61, i64 %i272
  %i274 = load i8, ptr %i273, align 1, !tbaa !22
  %i275 = zext i8 %i274 to i32
  %i276 = add nuw nsw i32 %i268, %i275
  %i277 = load i8, ptr %i269, align 1, !tbaa !22
  %i278 = zext i8 %i277 to i64
  %i279 = sub nsw i64 0, %i278
  %i280 = getelementptr inbounds i8, ptr %i61, i64 %i279
  %i281 = load i8, ptr %i280, align 1, !tbaa !22
  %i282 = zext i8 %i281 to i32
  %i283 = add nuw nsw i32 %i276, %i282
  %i284 = getelementptr inbounds i8, ptr %i269, i64 %i16
  %i285 = getelementptr inbounds i8, ptr %i284, i64 1
  %i286 = load i8, ptr %i284, align 1, !tbaa !22
  %i287 = zext i8 %i286 to i64
  %i288 = sub nsw i64 0, %i287
  %i289 = getelementptr inbounds i8, ptr %i61, i64 %i288
  %i290 = load i8, ptr %i289, align 1, !tbaa !22
  %i291 = zext i8 %i290 to i32
  %i292 = add nuw nsw i32 %i283, %i291
  %i293 = getelementptr inbounds i8, ptr %i284, i64 2
  %i294 = load i8, ptr %i285, align 1, !tbaa !22
  %i295 = zext i8 %i294 to i64
  %i296 = sub nsw i64 0, %i295
  %i297 = getelementptr inbounds i8, ptr %i61, i64 %i296
  %i298 = load i8, ptr %i297, align 1, !tbaa !22
  %i299 = zext i8 %i298 to i32
  %i300 = add nuw nsw i32 %i292, %i299
  %i301 = getelementptr inbounds i8, ptr %i284, i64 3
  %i302 = load i8, ptr %i293, align 1, !tbaa !22
  %i303 = zext i8 %i302 to i64
  %i304 = sub nsw i64 0, %i303
  %i305 = getelementptr inbounds i8, ptr %i61, i64 %i304
  %i306 = load i8, ptr %i305, align 1, !tbaa !22
  %i307 = zext i8 %i306 to i32
  %i308 = add nuw nsw i32 %i300, %i307
  %i309 = getelementptr inbounds i8, ptr %i284, i64 4
  %i310 = load i8, ptr %i301, align 1, !tbaa !22
  %i311 = zext i8 %i310 to i64
  %i312 = sub nsw i64 0, %i311
  %i313 = getelementptr inbounds i8, ptr %i61, i64 %i312
  %i314 = load i8, ptr %i313, align 1, !tbaa !22
  %i315 = zext i8 %i314 to i32
  %i316 = add nuw nsw i32 %i308, %i315
  %i317 = load i8, ptr %i309, align 1, !tbaa !22
  %i318 = zext i8 %i317 to i64
  %i319 = sub nsw i64 0, %i318
  %i320 = getelementptr inbounds i8, ptr %i61, i64 %i319
  %i321 = load i8, ptr %i320, align 1, !tbaa !22
  %i322 = zext i8 %i321 to i32
  %i323 = add nuw nsw i32 %i316, %i322
  %i324 = getelementptr inbounds i8, ptr %i309, i64 %i14
  %i325 = getelementptr inbounds i8, ptr %i324, i64 1
  %i326 = load i8, ptr %i324, align 1, !tbaa !22
  %i327 = zext i8 %i326 to i64
  %i328 = sub nsw i64 0, %i327
  %i329 = getelementptr inbounds i8, ptr %i61, i64 %i328
  %i330 = load i8, ptr %i329, align 1, !tbaa !22
  %i331 = zext i8 %i330 to i32
  %i332 = add nuw nsw i32 %i323, %i331
  %i333 = getelementptr inbounds i8, ptr %i324, i64 2
  %i334 = load i8, ptr %i325, align 1, !tbaa !22
  %i335 = zext i8 %i334 to i64
  %i336 = sub nsw i64 0, %i335
  %i337 = getelementptr inbounds i8, ptr %i61, i64 %i336
  %i338 = load i8, ptr %i337, align 1, !tbaa !22
  %i339 = zext i8 %i338 to i32
  %i340 = add nuw nsw i32 %i332, %i339
  %i341 = load i8, ptr %i333, align 1, !tbaa !22
  %i342 = zext i8 %i341 to i64
  %i343 = sub nsw i64 0, %i342
  %i344 = getelementptr inbounds i8, ptr %i61, i64 %i343
  %i345 = load i8, ptr %i344, align 1, !tbaa !22
  %i346 = zext i8 %i345 to i32
  %i347 = add nuw nsw i32 %i340, %i346
  %i348 = icmp sgt i32 %i347, %arg4
  br i1 %i348, label %bb53.bb352_crit_edge, label %bb349

bb53.bb352_crit_edge:                             ; preds = %bb53
  br label %bb352

bb349:                                            ; preds = %bb53
  %i350 = sub nsw i32 %arg4, %i347
  %i351 = getelementptr inbounds i32, ptr %arg1, i64 %i57
  store i32 %i350, ptr %i351, align 4, !tbaa !19
  br label %bb352

bb352:                                            ; preds = %bb53.bb352_crit_edge, %bb349
  %i353 = add nuw nsw i64 %i54, 1
  %i354 = icmp eq i64 %i353, %i21
  br i1 %i354, label %bb355.loopexit, label %bb352.bb53_crit_edge, !llvm.loop !49

bb352.bb53_crit_edge:                             ; preds = %bb352
  br label %bb53

bb355.loopexit:                                   ; preds = %bb352
  br label %bb355

bb355:                                            ; preds = %bb22.bb355_crit_edge, %bb355.loopexit
  %i356 = add nuw nsw i64 %i23, 1
  %i357 = icmp eq i64 %i356, %i20
  br i1 %i357, label %bb31.loopexit, label %bb355.bb22_crit_edge, !llvm.loop !50

bb355.bb22_crit_edge:                             ; preds = %bb355
  br label %bb22

bb358:                                            ; preds = %bb1183.bb358_crit_edge, %bb33
  %i359 = phi i64 [ 4, %bb33 ], [ %i1184, %bb1183.bb358_crit_edge ]
  br i1 %i36, label %bb360, label %bb358.bb1183_crit_edge

bb358.bb1183_crit_edge:                           ; preds = %bb358
  br label %bb1183

bb360:                                            ; preds = %bb358
  %i361 = add nsw i64 %i359, -3
  %i362 = mul nsw i64 %i361, %i50
  %i363 = getelementptr inbounds i8, ptr %arg, i64 %i362
  %i364 = add nsw i64 %i359, -3
  %i365 = mul nsw i64 %i364, %i49
  %i366 = getelementptr inbounds i8, ptr %arg, i64 %i365
  %i367 = trunc i64 %i359 to i32
  %i368 = mul i32 %i367, %arg5
  %i369 = zext i32 %i368 to i64
  %i370 = trunc i64 %i359 to i32
  %i371 = trunc i64 %i359 to i32
  %i372 = trunc i64 %i359 to i32
  %i373 = trunc i64 %i359 to i32
  %i374 = trunc i64 %i359 to i32
  %i375 = trunc i64 %i359 to i32
  %i376 = trunc i64 %i359 to i32
  %i377 = trunc i64 %i359 to i32
  br label %bb378

bb378:                                            ; preds = %bb1180.bb378_crit_edge, %bb360
  %i379 = phi i64 [ 4, %bb360 ], [ %i1181, %bb1180.bb378_crit_edge ]
  %i380 = add nuw nsw i64 %i379, %i369
  %i381 = getelementptr inbounds i32, ptr %arg1, i64 %i380
  %i382 = load i32, ptr %i381, align 4, !tbaa !19
  %i383 = icmp sgt i32 %i382, 0
  br i1 %i383, label %bb384, label %bb378.bb1180_crit_edge

bb378.bb1180_crit_edge:                           ; preds = %bb378
  br label %bb1180

bb384:                                            ; preds = %bb378
  %i385 = sub nsw i32 %arg4, %i382
  %i386 = getelementptr inbounds i8, ptr %arg, i64 %i380
  %i387 = load i8, ptr %i386, align 1, !tbaa !22
  %i388 = zext i8 %i387 to i64
  %i389 = getelementptr inbounds i8, ptr %arg3, i64 %i388
  %i390 = icmp sgt i32 %i385, 600
  br i1 %i390, label %bb391, label %bb384.bb776_crit_edge

bb384.bb776_crit_edge:                            ; preds = %bb384
  br label %bb776

bb391:                                            ; preds = %bb384
  %i392 = getelementptr inbounds i8, ptr %i363, i64 %i379
  %i393 = getelementptr inbounds i8, ptr %i392, i64 -1
  %i394 = load i8, ptr %i393, align 1, !tbaa !22
  %i395 = zext i8 %i394 to i64
  %i396 = sub nsw i64 0, %i395
  %i397 = getelementptr inbounds i8, ptr %i389, i64 %i396
  %i398 = load i8, ptr %i397, align 1, !tbaa !22
  %i399 = zext i8 %i398 to i32
  %i400 = getelementptr inbounds i8, ptr %i392, i64 1
  %i401 = load i8, ptr %i392, align 1, !tbaa !22
  %i402 = zext i8 %i401 to i64
  %i403 = sub nsw i64 0, %i402
  %i404 = getelementptr inbounds i8, ptr %i389, i64 %i403
  %i405 = load i8, ptr %i404, align 1, !tbaa !22
  %i406 = zext i8 %i405 to i32
  %i407 = add nuw nsw i32 %i406, %i399
  %i408 = load i8, ptr %i400, align 1, !tbaa !22
  %i409 = zext i8 %i408 to i64
  %i410 = sub nsw i64 0, %i409
  %i411 = getelementptr inbounds i8, ptr %i389, i64 %i410
  %i412 = load i8, ptr %i411, align 1, !tbaa !22
  %i413 = zext i8 %i412 to i32
  %i414 = add nuw nsw i32 %i407, %i413
  %i415 = getelementptr inbounds i8, ptr %i400, i64 %i38
  %i416 = getelementptr inbounds i8, ptr %i415, i64 1
  %i417 = load i8, ptr %i415, align 1, !tbaa !22
  %i418 = zext i8 %i417 to i64
  %i419 = sub nsw i64 0, %i418
  %i420 = getelementptr inbounds i8, ptr %i389, i64 %i419
  %i421 = load i8, ptr %i420, align 1, !tbaa !22
  %i422 = zext i8 %i421 to i32
  %i423 = getelementptr inbounds i8, ptr %i415, i64 2
  %i424 = load i8, ptr %i416, align 1, !tbaa !22
  %i425 = zext i8 %i424 to i64
  %i426 = sub nsw i64 0, %i425
  %i427 = getelementptr inbounds i8, ptr %i389, i64 %i426
  %i428 = load i8, ptr %i427, align 1, !tbaa !22
  %i429 = zext i8 %i428 to i32
  %i430 = add nuw nsw i32 %i429, %i422
  %i431 = getelementptr inbounds i8, ptr %i415, i64 3
  %i432 = load i8, ptr %i423, align 1, !tbaa !22
  %i433 = zext i8 %i432 to i64
  %i434 = sub nsw i64 0, %i433
  %i435 = getelementptr inbounds i8, ptr %i389, i64 %i434
  %i436 = load i8, ptr %i435, align 1, !tbaa !22
  %i437 = zext i8 %i436 to i32
  %i438 = add nuw nsw i32 %i430, %i437
  %i439 = getelementptr inbounds i8, ptr %i415, i64 4
  %i440 = load i8, ptr %i431, align 1, !tbaa !22
  %i441 = zext i8 %i440 to i64
  %i442 = sub nsw i64 0, %i441
  %i443 = getelementptr inbounds i8, ptr %i389, i64 %i442
  %i444 = load i8, ptr %i443, align 1, !tbaa !22
  %i445 = zext i8 %i444 to i32
  %i446 = add nuw nsw i32 %i438, %i445
  %i447 = load i8, ptr %i439, align 1, !tbaa !22
  %i448 = zext i8 %i447 to i64
  %i449 = sub nsw i64 0, %i448
  %i450 = getelementptr inbounds i8, ptr %i389, i64 %i449
  %i451 = load i8, ptr %i450, align 1, !tbaa !22
  %i452 = zext i8 %i451 to i32
  %i453 = add nuw nsw i32 %i446, %i452
  %i454 = getelementptr inbounds i8, ptr %i439, i64 %i40
  %i455 = getelementptr inbounds i8, ptr %i454, i64 1
  %i456 = load i8, ptr %i454, align 1, !tbaa !22
  %i457 = zext i8 %i456 to i64
  %i458 = sub nsw i64 0, %i457
  %i459 = getelementptr inbounds i8, ptr %i389, i64 %i458
  %i460 = load i8, ptr %i459, align 1, !tbaa !22
  %i461 = zext i8 %i460 to i32
  %i462 = getelementptr inbounds i8, ptr %i454, i64 2
  %i463 = load i8, ptr %i455, align 1, !tbaa !22
  %i464 = zext i8 %i463 to i64
  %i465 = sub nsw i64 0, %i464
  %i466 = getelementptr inbounds i8, ptr %i389, i64 %i465
  %i467 = load i8, ptr %i466, align 1, !tbaa !22
  %i468 = zext i8 %i467 to i32
  %i469 = getelementptr inbounds i8, ptr %i454, i64 3
  %i470 = load i8, ptr %i462, align 1, !tbaa !22
  %i471 = zext i8 %i470 to i64
  %i472 = sub nsw i64 0, %i471
  %i473 = getelementptr inbounds i8, ptr %i389, i64 %i472
  %i474 = load i8, ptr %i473, align 1, !tbaa !22
  %i475 = zext i8 %i474 to i32
  %i476 = getelementptr inbounds i8, ptr %i454, i64 4
  %i477 = load i8, ptr %i469, align 1, !tbaa !22
  %i478 = zext i8 %i477 to i64
  %i479 = sub nsw i64 0, %i478
  %i480 = getelementptr inbounds i8, ptr %i389, i64 %i479
  %i481 = load i8, ptr %i480, align 1, !tbaa !22
  %i482 = zext i8 %i481 to i32
  %i483 = getelementptr inbounds i8, ptr %i454, i64 5
  %i484 = load i8, ptr %i476, align 1, !tbaa !22
  %i485 = zext i8 %i484 to i64
  %i486 = sub nsw i64 0, %i485
  %i487 = getelementptr inbounds i8, ptr %i389, i64 %i486
  %i488 = load i8, ptr %i487, align 1, !tbaa !22
  %i489 = zext i8 %i488 to i32
  %i490 = getelementptr inbounds i8, ptr %i454, i64 6
  %i491 = load i8, ptr %i483, align 1, !tbaa !22
  %i492 = zext i8 %i491 to i64
  %i493 = sub nsw i64 0, %i492
  %i494 = getelementptr inbounds i8, ptr %i389, i64 %i493
  %i495 = load i8, ptr %i494, align 1, !tbaa !22
  %i496 = zext i8 %i495 to i32
  %i497 = load i8, ptr %i490, align 1, !tbaa !22
  %i498 = zext i8 %i497 to i64
  %i499 = sub nsw i64 0, %i498
  %i500 = getelementptr inbounds i8, ptr %i389, i64 %i499
  %i501 = load i8, ptr %i500, align 1, !tbaa !22
  %i502 = zext i8 %i501 to i32
  %i503 = getelementptr inbounds i8, ptr %i490, i64 %i42
  %i504 = getelementptr inbounds i8, ptr %i503, i64 1
  %i505 = load i8, ptr %i503, align 1, !tbaa !22
  %i506 = zext i8 %i505 to i64
  %i507 = sub nsw i64 0, %i506
  %i508 = getelementptr inbounds i8, ptr %i389, i64 %i507
  %i509 = load i8, ptr %i508, align 1, !tbaa !22
  %i510 = zext i8 %i509 to i32
  %i511 = getelementptr inbounds i8, ptr %i503, i64 2
  %i512 = load i8, ptr %i504, align 1, !tbaa !22
  %i513 = zext i8 %i512 to i64
  %i514 = sub nsw i64 0, %i513
  %i515 = getelementptr inbounds i8, ptr %i389, i64 %i514
  %i516 = load i8, ptr %i515, align 1, !tbaa !22
  %i517 = zext i8 %i516 to i32
  %i518 = load i8, ptr %i511, align 1, !tbaa !22
  %i519 = zext i8 %i518 to i64
  %i520 = sub nsw i64 0, %i519
  %i521 = getelementptr inbounds i8, ptr %i389, i64 %i520
  %i522 = load i8, ptr %i521, align 1, !tbaa !22
  %i523 = zext i8 %i522 to i32
  %i524 = getelementptr inbounds i8, ptr %i503, i64 4
  %i525 = getelementptr inbounds i8, ptr %i503, i64 5
  %i526 = load i8, ptr %i524, align 1, !tbaa !22
  %i527 = zext i8 %i526 to i64
  %i528 = sub nsw i64 0, %i527
  %i529 = getelementptr inbounds i8, ptr %i389, i64 %i528
  %i530 = load i8, ptr %i529, align 1, !tbaa !22
  %i531 = zext i8 %i530 to i32
  %i532 = getelementptr inbounds i8, ptr %i503, i64 6
  %i533 = load i8, ptr %i525, align 1, !tbaa !22
  %i534 = zext i8 %i533 to i64
  %i535 = sub nsw i64 0, %i534
  %i536 = getelementptr inbounds i8, ptr %i389, i64 %i535
  %i537 = load i8, ptr %i536, align 1, !tbaa !22
  %i538 = zext i8 %i537 to i32
  %i539 = load i8, ptr %i532, align 1, !tbaa !22
  %i540 = zext i8 %i539 to i64
  %i541 = sub nsw i64 0, %i540
  %i542 = getelementptr inbounds i8, ptr %i389, i64 %i541
  %i543 = load i8, ptr %i542, align 1, !tbaa !22
  %i544 = zext i8 %i543 to i32
  %i545 = getelementptr inbounds i8, ptr %i532, i64 %i42
  %i546 = getelementptr inbounds i8, ptr %i545, i64 1
  %i547 = load i8, ptr %i545, align 1, !tbaa !22
  %i548 = zext i8 %i547 to i64
  %i549 = sub nsw i64 0, %i548
  %i550 = getelementptr inbounds i8, ptr %i389, i64 %i549
  %i551 = load i8, ptr %i550, align 1, !tbaa !22
  %i552 = zext i8 %i551 to i32
  %i553 = getelementptr inbounds i8, ptr %i545, i64 2
  %i554 = load i8, ptr %i546, align 1, !tbaa !22
  %i555 = zext i8 %i554 to i64
  %i556 = sub nsw i64 0, %i555
  %i557 = getelementptr inbounds i8, ptr %i389, i64 %i556
  %i558 = load i8, ptr %i557, align 1, !tbaa !22
  %i559 = zext i8 %i558 to i32
  %i560 = getelementptr inbounds i8, ptr %i545, i64 3
  %i561 = load i8, ptr %i553, align 1, !tbaa !22
  %i562 = zext i8 %i561 to i64
  %i563 = sub nsw i64 0, %i562
  %i564 = getelementptr inbounds i8, ptr %i389, i64 %i563
  %i565 = load i8, ptr %i564, align 1, !tbaa !22
  %i566 = zext i8 %i565 to i32
  %i567 = getelementptr inbounds i8, ptr %i545, i64 4
  %i568 = load i8, ptr %i560, align 1, !tbaa !22
  %i569 = zext i8 %i568 to i64
  %i570 = sub nsw i64 0, %i569
  %i571 = getelementptr inbounds i8, ptr %i389, i64 %i570
  %i572 = load i8, ptr %i571, align 1, !tbaa !22
  %i573 = zext i8 %i572 to i32
  %i574 = getelementptr inbounds i8, ptr %i545, i64 5
  %i575 = load i8, ptr %i567, align 1, !tbaa !22
  %i576 = zext i8 %i575 to i64
  %i577 = sub nsw i64 0, %i576
  %i578 = getelementptr inbounds i8, ptr %i389, i64 %i577
  %i579 = load i8, ptr %i578, align 1, !tbaa !22
  %i580 = zext i8 %i579 to i32
  %i581 = getelementptr inbounds i8, ptr %i545, i64 6
  %i582 = load i8, ptr %i574, align 1, !tbaa !22
  %i583 = zext i8 %i582 to i64
  %i584 = sub nsw i64 0, %i583
  %i585 = getelementptr inbounds i8, ptr %i389, i64 %i584
  %i586 = load i8, ptr %i585, align 1, !tbaa !22
  %i587 = zext i8 %i586 to i32
  %i588 = load i8, ptr %i581, align 1, !tbaa !22
  %i589 = zext i8 %i588 to i64
  %i590 = sub nsw i64 0, %i589
  %i591 = getelementptr inbounds i8, ptr %i389, i64 %i590
  %i592 = load i8, ptr %i591, align 1, !tbaa !22
  %i593 = zext i8 %i592 to i32
  %i594 = getelementptr inbounds i8, ptr %i581, i64 %i40
  %i595 = getelementptr inbounds i8, ptr %i594, i64 1
  %i596 = load i8, ptr %i594, align 1, !tbaa !22
  %i597 = zext i8 %i596 to i64
  %i598 = sub nsw i64 0, %i597
  %i599 = getelementptr inbounds i8, ptr %i389, i64 %i598
  %i600 = load i8, ptr %i599, align 1, !tbaa !22
  %i601 = zext i8 %i600 to i32
  %i602 = shl nuw nsw i32 %i601, 1
  %i603 = getelementptr inbounds i8, ptr %i594, i64 2
  %i604 = load i8, ptr %i595, align 1, !tbaa !22
  %i605 = zext i8 %i604 to i64
  %i606 = sub nsw i64 0, %i605
  %i607 = getelementptr inbounds i8, ptr %i389, i64 %i606
  %i608 = load i8, ptr %i607, align 1, !tbaa !22
  %i609 = zext i8 %i608 to i32
  %i610 = getelementptr inbounds i8, ptr %i594, i64 3
  %i611 = load i8, ptr %i603, align 1, !tbaa !22
  %i612 = zext i8 %i611 to i64
  %i613 = sub nsw i64 0, %i612
  %i614 = getelementptr inbounds i8, ptr %i389, i64 %i613
  %i615 = load i8, ptr %i614, align 1, !tbaa !22
  %i616 = zext i8 %i615 to i32
  %i617 = getelementptr inbounds i8, ptr %i594, i64 4
  %i618 = load i8, ptr %i610, align 1, !tbaa !22
  %i619 = zext i8 %i618 to i64
  %i620 = sub nsw i64 0, %i619
  %i621 = getelementptr inbounds i8, ptr %i389, i64 %i620
  %i622 = load i8, ptr %i621, align 1, !tbaa !22
  %i623 = zext i8 %i622 to i32
  %i624 = load i8, ptr %i617, align 1, !tbaa !22
  %i625 = zext i8 %i624 to i64
  %i626 = sub nsw i64 0, %i625
  %i627 = getelementptr inbounds i8, ptr %i389, i64 %i626
  %i628 = load i8, ptr %i627, align 1, !tbaa !22
  %i629 = zext i8 %i628 to i32
  %i630 = shl nuw nsw i32 %i629, 1
  %i631 = getelementptr inbounds i8, ptr %i617, i64 %i38
  %i632 = getelementptr inbounds i8, ptr %i631, i64 1
  %i633 = load i8, ptr %i631, align 1, !tbaa !22
  %i634 = zext i8 %i633 to i64
  %i635 = sub nsw i64 0, %i634
  %i636 = getelementptr inbounds i8, ptr %i389, i64 %i635
  %i637 = load i8, ptr %i636, align 1, !tbaa !22
  %i638 = zext i8 %i637 to i32
  %i639 = getelementptr inbounds i8, ptr %i631, i64 2
  %i640 = load i8, ptr %i632, align 1, !tbaa !22
  %i641 = zext i8 %i640 to i64
  %i642 = sub nsw i64 0, %i641
  %i643 = getelementptr inbounds i8, ptr %i389, i64 %i642
  %i644 = load i8, ptr %i643, align 1, !tbaa !22
  %i645 = zext i8 %i644 to i32
  %i646 = load i8, ptr %i639, align 1, !tbaa !22
  %i647 = zext i8 %i646 to i64
  %i648 = sub nsw i64 0, %i647
  %i649 = getelementptr inbounds i8, ptr %i389, i64 %i648
  %i650 = load i8, ptr %i649, align 1, !tbaa !22
  %i651 = zext i8 %i650 to i32
  %i652 = add nuw nsw i32 %i461, %i510
  %i653 = add nuw nsw i32 %i502, %i544
  %i654 = add nuw nsw i32 %i652, %i552
  %i655 = sub nsw i32 %i653, %i654
  %i656 = add nsw i32 %i655, %i593
  %i657 = mul nsw i32 %i656, 3
  %i658 = add nuw nsw i32 %i422, %i468
  %i659 = add nuw nsw i32 %i452, %i496
  %i660 = add nuw nsw i32 %i658, %i517
  %i661 = add nuw nsw i32 %i659, %i538
  %i662 = add nuw nsw i32 %i660, %i559
  %i663 = sub nsw i32 %i661, %i662
  %i664 = add nsw i32 %i663, %i587
  %i665 = shl nsw i32 %i664, 1
  %i666 = add nuw nsw i32 %i399, %i429
  %i667 = add nuw nsw i32 %i413, %i445
  %i668 = add nuw nsw i32 %i666, %i475
  %i669 = add nuw nsw i32 %i667, %i489
  %i670 = add nuw nsw i32 %i668, %i523
  %i671 = add nuw nsw i32 %i669, %i531
  %i672 = add nuw nsw i32 %i670, %i566
  %i673 = add nuw nsw i32 %i671, %i580
  %i674 = add nuw nsw i32 %i672, %i602
  %i675 = add nuw nsw i32 %i674, %i609
  %i676 = sub nsw i32 %i673, %i675
  %i677 = add nsw i32 %i676, %i657
  %i678 = add i32 %i677, %i665
  %i679 = add i32 %i678, %i623
  %i680 = add i32 %i679, %i630
  %i681 = sub i32 %i680, %i638
  %i682 = add i32 %i681, %i651
  %i683 = sub nsw i32 %i638, %i414
  %i684 = add nsw i32 %i683, %i645
  %i685 = add nsw i32 %i684, %i651
  %i686 = mul nsw i32 %i685, 3
  %i687 = sub nsw i32 %i609, %i453
  %i688 = add nsw i32 %i687, %i616
  %i689 = add nsw i32 %i688, %i623
  %i690 = shl nsw i32 %i689, 1
  %i691 = add nuw nsw i32 %i468, %i461
  %i692 = add nuw nsw i32 %i691, %i475
  %i693 = add nuw nsw i32 %i692, %i482
  %i694 = add nuw nsw i32 %i693, %i489
  %i695 = add nuw nsw i32 %i694, %i496
  %i696 = add nuw nsw i32 %i695, %i502
  %i697 = sub nsw i32 %i552, %i696
  %i698 = add nsw i32 %i697, %i559
  %i699 = add nsw i32 %i698, %i566
  %i700 = add nsw i32 %i699, %i573
  %i701 = add nsw i32 %i700, %i580
  %i702 = add nsw i32 %i701, %i587
  %i703 = add nsw i32 %i702, %i593
  %i704 = add nsw i32 %i703, %i602
  %i705 = add nsw i32 %i704, %i630
  %i706 = add i32 %i705, %i690
  %i707 = add i32 %i706, %i686
  %i708 = mul nsw i32 %i682, %i682
  %i709 = mul nsw i32 %i707, %i707
  %i710 = add nuw nsw i32 %i709, %i708
  %i711 = sitofp i32 %i710 to float
  %i712 = tail call float @sqrtf(float noundef %i711) #11
  %i713 = fpext float %i712 to double
  %i714 = sitofp i32 %i385 to float
  %i715 = fpext float %i714 to double
  %i716 = fmul double %i715, 9.000000e-01
  %i717 = fcmp olt double %i716, %i713
  br i1 %i717, label %bb718, label %bb391.bb776_crit_edge

bb391.bb776_crit_edge:                            ; preds = %bb391
  br label %bb776

bb718:                                            ; preds = %bb391
  %i719 = icmp eq i32 %i682, 0
  %i720 = sitofp i32 %i707 to float
  %i721 = sitofp i32 %i682 to float
  %i722 = fdiv float %i720, %i721
  %i723 = select i1 %i719, float 1.000000e+06, float %i722
  %i724 = fcmp uge float %i723, 0.000000e+00
  %i725 = fneg float %i723
  %i726 = select i1 %i724, float %i723, float %i725
  %i727 = fcmp olt float %i726, 5.000000e-01
  br i1 %i727, label %bb718.bb732_crit_edge, label %bb728

bb718.bb732_crit_edge:                            ; preds = %bb718
  br label %bb732

bb728:                                            ; preds = %bb718
  %i729 = fcmp ogt float %i726, 2.000000e+00
  br i1 %i729, label %bb728.bb732_crit_edge, label %bb730

bb728.bb732_crit_edge:                            ; preds = %bb728
  br label %bb732

bb730:                                            ; preds = %bb728
  %i731 = select i1 %i724, i32 1, i32 -1
  br label %bb732

bb732:                                            ; preds = %bb728.bb732_crit_edge, %bb718.bb732_crit_edge, %bb730
  %i733 = phi i32 [ 0, %bb718.bb732_crit_edge ], [ 1, %bb728.bb732_crit_edge ], [ %i731, %bb730 ]
  %i734 = phi i32 [ 1, %bb718.bb732_crit_edge ], [ 0, %bb728.bb732_crit_edge ], [ 1, %bb730 ]
  %i735 = add nsw i32 %i733, %i374
  %i736 = mul nsw i32 %i735, %arg5
  %i737 = trunc i64 %i379 to i32
  %i738 = add nuw nsw i32 %i734, %i737
  %i739 = add i32 %i738, %i736
  %i740 = sext i32 %i739 to i64
  %i741 = getelementptr inbounds i32, ptr %arg1, i64 %i740
  %i742 = load i32, ptr %i741, align 4, !tbaa !19
  %i743 = icmp sgt i32 %i382, %i742
  br i1 %i743, label %bb744, label %bb732.bb1180_crit_edge

bb732.bb1180_crit_edge:                           ; preds = %bb732
  br label %bb1180

bb744:                                            ; preds = %bb732
  %i745 = sub nsw i32 %i375, %i733
  %i746 = mul nsw i32 %i745, %arg5
  %i747 = trunc i64 %i379 to i32
  %i748 = sub nsw i32 %i747, %i734
  %i749 = add i32 %i748, %i746
  %i750 = sext i32 %i749 to i64
  %i751 = getelementptr inbounds i32, ptr %arg1, i64 %i750
  %i752 = load i32, ptr %i751, align 4, !tbaa !19
  %i753 = icmp slt i32 %i382, %i752
  br i1 %i753, label %bb744.bb1180_crit_edge, label %bb754

bb744.bb1180_crit_edge:                           ; preds = %bb744
  br label %bb1180

bb754:                                            ; preds = %bb744
  %i755 = shl nsw i32 %i733, 1
  %i756 = add nsw i32 %i755, %i376
  %i757 = mul nsw i32 %i756, %arg5
  %i758 = shl nuw nsw i32 %i734, 1
  %i759 = trunc i64 %i379 to i32
  %i760 = add nuw i32 %i758, %i759
  %i761 = add i32 %i760, %i757
  %i762 = sext i32 %i761 to i64
  %i763 = getelementptr inbounds i32, ptr %arg1, i64 %i762
  %i764 = load i32, ptr %i763, align 4, !tbaa !19
  %i765 = icmp sgt i32 %i382, %i764
  br i1 %i765, label %bb766, label %bb754.bb1180_crit_edge

bb754.bb1180_crit_edge:                           ; preds = %bb754
  br label %bb1180

bb766:                                            ; preds = %bb754
  %i767 = sub nsw i32 %i377, %i755
  %i768 = mul nsw i32 %i767, %arg5
  %i769 = trunc i64 %i379 to i32
  %i770 = sub nsw i32 %i769, %i758
  %i771 = add i32 %i770, %i768
  %i772 = sext i32 %i771 to i64
  %i773 = getelementptr inbounds i32, ptr %arg1, i64 %i772
  %i774 = load i32, ptr %i773, align 4, !tbaa !19
  %i775 = icmp slt i32 %i382, %i774
  br i1 %i775, label %bb766.bb1180_crit_edge, label %bb766.bb1177_crit_edge

bb766.bb1177_crit_edge:                           ; preds = %bb766
  br label %bb1177

bb766.bb1180_crit_edge:                           ; preds = %bb766
  br label %bb1180

bb776:                                            ; preds = %bb391.bb776_crit_edge, %bb384.bb776_crit_edge
  %i777 = getelementptr inbounds i8, ptr %i366, i64 %i379
  %i778 = getelementptr inbounds i8, ptr %i777, i64 -1
  %i779 = load i8, ptr %i778, align 1, !tbaa !22
  %i780 = zext i8 %i779 to i64
  %i781 = sub nsw i64 0, %i780
  %i782 = getelementptr inbounds i8, ptr %i389, i64 %i781
  %i783 = load i8, ptr %i782, align 1, !tbaa !22
  %i784 = zext i8 %i783 to i32
  %i785 = getelementptr inbounds i8, ptr %i777, i64 1
  %i786 = load i8, ptr %i777, align 1, !tbaa !22
  %i787 = zext i8 %i786 to i64
  %i788 = sub nsw i64 0, %i787
  %i789 = getelementptr inbounds i8, ptr %i389, i64 %i788
  %i790 = load i8, ptr %i789, align 1, !tbaa !22
  %i791 = zext i8 %i790 to i32
  %i792 = load i8, ptr %i785, align 1, !tbaa !22
  %i793 = zext i8 %i792 to i64
  %i794 = sub nsw i64 0, %i793
  %i795 = getelementptr inbounds i8, ptr %i389, i64 %i794
  %i796 = load i8, ptr %i795, align 1, !tbaa !22
  %i797 = zext i8 %i796 to i32
  %i798 = getelementptr inbounds i8, ptr %i785, i64 %i44
  %i799 = getelementptr inbounds i8, ptr %i798, i64 1
  %i800 = load i8, ptr %i798, align 1, !tbaa !22
  %i801 = zext i8 %i800 to i64
  %i802 = sub nsw i64 0, %i801
  %i803 = getelementptr inbounds i8, ptr %i389, i64 %i802
  %i804 = load i8, ptr %i803, align 1, !tbaa !22
  %i805 = zext i8 %i804 to i32
  %i806 = shl nuw nsw i32 %i805, 2
  %i807 = getelementptr inbounds i8, ptr %i798, i64 2
  %i808 = load i8, ptr %i799, align 1, !tbaa !22
  %i809 = zext i8 %i808 to i64
  %i810 = sub nsw i64 0, %i809
  %i811 = getelementptr inbounds i8, ptr %i389, i64 %i810
  %i812 = load i8, ptr %i811, align 1, !tbaa !22
  %i813 = zext i8 %i812 to i32
  %i814 = getelementptr inbounds i8, ptr %i798, i64 3
  %i815 = load i8, ptr %i807, align 1, !tbaa !22
  %i816 = zext i8 %i815 to i64
  %i817 = sub nsw i64 0, %i816
  %i818 = getelementptr inbounds i8, ptr %i389, i64 %i817
  %i819 = load i8, ptr %i818, align 1, !tbaa !22
  %i820 = zext i8 %i819 to i32
  %i821 = getelementptr inbounds i8, ptr %i798, i64 4
  %i822 = load i8, ptr %i814, align 1, !tbaa !22
  %i823 = zext i8 %i822 to i64
  %i824 = sub nsw i64 0, %i823
  %i825 = getelementptr inbounds i8, ptr %i389, i64 %i824
  %i826 = load i8, ptr %i825, align 1, !tbaa !22
  %i827 = zext i8 %i826 to i32
  %i828 = load i8, ptr %i821, align 1, !tbaa !22
  %i829 = zext i8 %i828 to i64
  %i830 = sub nsw i64 0, %i829
  %i831 = getelementptr inbounds i8, ptr %i389, i64 %i830
  %i832 = load i8, ptr %i831, align 1, !tbaa !22
  %i833 = zext i8 %i832 to i32
  %i834 = shl nuw nsw i32 %i833, 2
  %i835 = getelementptr inbounds i8, ptr %i821, i64 %i46
  %i836 = getelementptr inbounds i8, ptr %i835, i64 1
  %i837 = load i8, ptr %i835, align 1, !tbaa !22
  %i838 = zext i8 %i837 to i64
  %i839 = sub nsw i64 0, %i838
  %i840 = getelementptr inbounds i8, ptr %i389, i64 %i839
  %i841 = load i8, ptr %i840, align 1, !tbaa !22
  %i842 = zext i8 %i841 to i32
  %i843 = getelementptr inbounds i8, ptr %i835, i64 2
  %i844 = load i8, ptr %i836, align 1, !tbaa !22
  %i845 = zext i8 %i844 to i64
  %i846 = sub nsw i64 0, %i845
  %i847 = getelementptr inbounds i8, ptr %i389, i64 %i846
  %i848 = load i8, ptr %i847, align 1, !tbaa !22
  %i849 = zext i8 %i848 to i32
  %i850 = getelementptr inbounds i8, ptr %i835, i64 3
  %i851 = load i8, ptr %i843, align 1, !tbaa !22
  %i852 = zext i8 %i851 to i64
  %i853 = sub nsw i64 0, %i852
  %i854 = getelementptr inbounds i8, ptr %i389, i64 %i853
  %i855 = load i8, ptr %i854, align 1, !tbaa !22
  %i856 = zext i8 %i855 to i32
  %i857 = getelementptr inbounds i8, ptr %i835, i64 4
  %i858 = load i8, ptr %i850, align 1, !tbaa !22
  %i859 = zext i8 %i858 to i64
  %i860 = sub nsw i64 0, %i859
  %i861 = getelementptr inbounds i8, ptr %i389, i64 %i860
  %i862 = load i8, ptr %i861, align 1, !tbaa !22
  %i863 = zext i8 %i862 to i32
  %i864 = getelementptr inbounds i8, ptr %i835, i64 5
  %i865 = load i8, ptr %i857, align 1, !tbaa !22
  %i866 = zext i8 %i865 to i64
  %i867 = sub nsw i64 0, %i866
  %i868 = getelementptr inbounds i8, ptr %i389, i64 %i867
  %i869 = load i8, ptr %i868, align 1, !tbaa !22
  %i870 = zext i8 %i869 to i32
  %i871 = getelementptr inbounds i8, ptr %i835, i64 6
  %i872 = load i8, ptr %i864, align 1, !tbaa !22
  %i873 = zext i8 %i872 to i64
  %i874 = sub nsw i64 0, %i873
  %i875 = getelementptr inbounds i8, ptr %i389, i64 %i874
  %i876 = load i8, ptr %i875, align 1, !tbaa !22
  %i877 = zext i8 %i876 to i32
  %i878 = load i8, ptr %i871, align 1, !tbaa !22
  %i879 = zext i8 %i878 to i64
  %i880 = sub nsw i64 0, %i879
  %i881 = getelementptr inbounds i8, ptr %i389, i64 %i880
  %i882 = load i8, ptr %i881, align 1, !tbaa !22
  %i883 = zext i8 %i882 to i32
  %i884 = getelementptr inbounds i8, ptr %i871, i64 %i48
  %i885 = getelementptr inbounds i8, ptr %i884, i64 6
  %i886 = getelementptr inbounds i8, ptr %i885, i64 %i48
  %i887 = getelementptr inbounds i8, ptr %i886, i64 1
  %i888 = load i8, ptr %i886, align 1, !tbaa !22
  %i889 = zext i8 %i888 to i64
  %i890 = sub nsw i64 0, %i889
  %i891 = getelementptr inbounds i8, ptr %i389, i64 %i890
  %i892 = load i8, ptr %i891, align 1, !tbaa !22
  %i893 = zext i8 %i892 to i32
  %i894 = getelementptr inbounds i8, ptr %i886, i64 2
  %i895 = load i8, ptr %i887, align 1, !tbaa !22
  %i896 = zext i8 %i895 to i64
  %i897 = sub nsw i64 0, %i896
  %i898 = getelementptr inbounds i8, ptr %i389, i64 %i897
  %i899 = load i8, ptr %i898, align 1, !tbaa !22
  %i900 = zext i8 %i899 to i32
  %i901 = getelementptr inbounds i8, ptr %i886, i64 3
  %i902 = load i8, ptr %i894, align 1, !tbaa !22
  %i903 = zext i8 %i902 to i64
  %i904 = sub nsw i64 0, %i903
  %i905 = getelementptr inbounds i8, ptr %i389, i64 %i904
  %i906 = load i8, ptr %i905, align 1, !tbaa !22
  %i907 = zext i8 %i906 to i32
  %i908 = getelementptr inbounds i8, ptr %i886, i64 4
  %i909 = load i8, ptr %i901, align 1, !tbaa !22
  %i910 = zext i8 %i909 to i64
  %i911 = sub nsw i64 0, %i910
  %i912 = getelementptr inbounds i8, ptr %i389, i64 %i911
  %i913 = load i8, ptr %i912, align 1, !tbaa !22
  %i914 = zext i8 %i913 to i32
  %i915 = getelementptr inbounds i8, ptr %i886, i64 5
  %i916 = load i8, ptr %i908, align 1, !tbaa !22
  %i917 = zext i8 %i916 to i64
  %i918 = sub nsw i64 0, %i917
  %i919 = getelementptr inbounds i8, ptr %i389, i64 %i918
  %i920 = load i8, ptr %i919, align 1, !tbaa !22
  %i921 = zext i8 %i920 to i32
  %i922 = getelementptr inbounds i8, ptr %i886, i64 6
  %i923 = load i8, ptr %i915, align 1, !tbaa !22
  %i924 = zext i8 %i923 to i64
  %i925 = sub nsw i64 0, %i924
  %i926 = getelementptr inbounds i8, ptr %i389, i64 %i925
  %i927 = load i8, ptr %i926, align 1, !tbaa !22
  %i928 = zext i8 %i927 to i32
  %i929 = load i8, ptr %i922, align 1, !tbaa !22
  %i930 = zext i8 %i929 to i64
  %i931 = sub nsw i64 0, %i930
  %i932 = getelementptr inbounds i8, ptr %i389, i64 %i931
  %i933 = load i8, ptr %i932, align 1, !tbaa !22
  %i934 = zext i8 %i933 to i32
  %i935 = getelementptr inbounds i8, ptr %i922, i64 %i46
  %i936 = getelementptr inbounds i8, ptr %i935, i64 1
  %i937 = load i8, ptr %i935, align 1, !tbaa !22
  %i938 = zext i8 %i937 to i64
  %i939 = sub nsw i64 0, %i938
  %i940 = getelementptr inbounds i8, ptr %i389, i64 %i939
  %i941 = load i8, ptr %i940, align 1, !tbaa !22
  %i942 = zext i8 %i941 to i32
  %i943 = shl nuw nsw i32 %i942, 2
  %i944 = getelementptr inbounds i8, ptr %i935, i64 2
  %i945 = load i8, ptr %i936, align 1, !tbaa !22
  %i946 = zext i8 %i945 to i64
  %i947 = sub nsw i64 0, %i946
  %i948 = getelementptr inbounds i8, ptr %i389, i64 %i947
  %i949 = load i8, ptr %i948, align 1, !tbaa !22
  %i950 = zext i8 %i949 to i32
  %i951 = getelementptr inbounds i8, ptr %i935, i64 3
  %i952 = load i8, ptr %i944, align 1, !tbaa !22
  %i953 = zext i8 %i952 to i64
  %i954 = sub nsw i64 0, %i953
  %i955 = getelementptr inbounds i8, ptr %i389, i64 %i954
  %i956 = load i8, ptr %i955, align 1, !tbaa !22
  %i957 = zext i8 %i956 to i32
  %i958 = getelementptr inbounds i8, ptr %i935, i64 4
  %i959 = load i8, ptr %i951, align 1, !tbaa !22
  %i960 = zext i8 %i959 to i64
  %i961 = sub nsw i64 0, %i960
  %i962 = getelementptr inbounds i8, ptr %i389, i64 %i961
  %i963 = load i8, ptr %i962, align 1, !tbaa !22
  %i964 = zext i8 %i963 to i32
  %i965 = load i8, ptr %i958, align 1, !tbaa !22
  %i966 = zext i8 %i965 to i64
  %i967 = sub nsw i64 0, %i966
  %i968 = getelementptr inbounds i8, ptr %i389, i64 %i967
  %i969 = load i8, ptr %i968, align 1, !tbaa !22
  %i970 = zext i8 %i969 to i32
  %i971 = shl nuw nsw i32 %i970, 2
  %i972 = getelementptr inbounds i8, ptr %i958, i64 %i44
  %i973 = getelementptr inbounds i8, ptr %i972, i64 1
  %i974 = load i8, ptr %i972, align 1, !tbaa !22
  %i975 = zext i8 %i974 to i64
  %i976 = sub nsw i64 0, %i975
  %i977 = getelementptr inbounds i8, ptr %i389, i64 %i976
  %i978 = load i8, ptr %i977, align 1, !tbaa !22
  %i979 = zext i8 %i978 to i32
  %i980 = getelementptr inbounds i8, ptr %i972, i64 2
  %i981 = load i8, ptr %i973, align 1, !tbaa !22
  %i982 = zext i8 %i981 to i64
  %i983 = sub nsw i64 0, %i982
  %i984 = getelementptr inbounds i8, ptr %i389, i64 %i983
  %i985 = load i8, ptr %i984, align 1, !tbaa !22
  %i986 = zext i8 %i985 to i32
  %i987 = load i8, ptr %i980, align 1, !tbaa !22
  %i988 = zext i8 %i987 to i64
  %i989 = sub nsw i64 0, %i988
  %i990 = getelementptr inbounds i8, ptr %i389, i64 %i989
  %i991 = load i8, ptr %i990, align 1, !tbaa !22
  %i992 = zext i8 %i991 to i32
  %i993 = add nuw nsw i32 %i820, %i813
  %i994 = add nuw nsw i32 %i993, %i827
  %i995 = add nuw nsw i32 %i994, %i950
  %i996 = add nuw nsw i32 %i995, %i957
  %i997 = add nuw nsw i32 %i996, %i964
  %i998 = shl nuw nsw i32 %i997, 2
  %i999 = add nuw nsw i32 %i791, %i784
  %i1000 = add nuw nsw i32 %i999, %i797
  %i1001 = add nuw nsw i32 %i1000, %i979
  %i1002 = add nuw nsw i32 %i1001, %i986
  %i1003 = add nuw nsw i32 %i1002, %i992
  %i1004 = mul nuw nsw i32 %i1003, 9
  %i1005 = add nuw nsw i32 %i834, %i806
  %i1006 = add nuw nsw i32 %i1005, %i842
  %i1007 = add nuw nsw i32 %i1006, %i849
  %i1008 = add nuw nsw i32 %i1007, %i856
  %i1009 = add nuw nsw i32 %i1008, %i863
  %i1010 = add nuw nsw i32 %i1009, %i870
  %i1011 = add nuw nsw i32 %i1010, %i877
  %i1012 = add nuw nsw i32 %i1011, %i883
  %i1013 = add nuw nsw i32 %i1012, %i893
  %i1014 = add nuw nsw i32 %i1013, %i900
  %i1015 = add nuw nsw i32 %i1014, %i907
  %i1016 = add nuw nsw i32 %i1015, %i914
  %i1017 = add nuw nsw i32 %i1016, %i921
  %i1018 = add nuw nsw i32 %i1017, %i928
  %i1019 = add nuw nsw i32 %i1018, %i934
  %i1020 = add nuw nsw i32 %i1019, %i943
  %i1021 = add nuw nsw i32 %i1020, %i971
  %i1022 = add nuw nsw i32 %i1021, %i998
  %i1023 = add nuw nsw i32 %i1022, %i1004
  %i1024 = add nuw nsw i32 %i784, %i842
  %i1025 = add nuw nsw i32 %i797, %i883
  %i1026 = add nuw nsw i32 %i1025, %i893
  %i1027 = add nuw nsw i32 %i1024, %i934
  %i1028 = add nuw nsw i32 %i1026, %i979
  %i1029 = sub nsw i32 %i1027, %i1028
  %i1030 = add nsw i32 %i1029, %i992
  %i1031 = mul nsw i32 %i1030, 3
  %i1032 = add nuw nsw i32 %i813, %i849
  %i1033 = add nuw nsw i32 %i827, %i877
  %i1034 = add nuw nsw i32 %i1033, %i900
  %i1035 = add nuw nsw i32 %i1032, %i928
  %i1036 = add nuw nsw i32 %i1034, %i950
  %i1037 = sub nsw i32 %i1035, %i1036
  %i1038 = add nsw i32 %i1037, %i964
  %i1039 = shl nsw i32 %i1038, 1
  %i1040 = add nuw nsw i32 %i806, %i856
  %i1041 = add nuw nsw i32 %i834, %i870
  %i1042 = add nuw nsw i32 %i1041, %i907
  %i1043 = add nuw nsw i32 %i1040, %i921
  %i1044 = add nuw nsw i32 %i1042, %i943
  %i1045 = sub nsw i32 %i1043, %i1044
  %i1046 = add nsw i32 %i1045, %i971
  %i1047 = add i32 %i1046, %i1039
  %i1048 = add i32 %i1047, %i1031
  %i1049 = icmp eq i32 %i1023, 0
  br i1 %i1049, label %bb776.bb1125_crit_edge, label %bb1050

bb776.bb1125_crit_edge:                           ; preds = %bb776
  br label %bb1125

bb1050:                                           ; preds = %bb776
  %i1051 = load i8, ptr %i884, align 1, !tbaa !22
  %i1052 = zext i8 %i1051 to i64
  %i1053 = sub nsw i64 0, %i1052
  %i1054 = getelementptr inbounds i8, ptr %i389, i64 %i1053
  %i1055 = load i8, ptr %i1054, align 1, !tbaa !22
  %i1056 = zext i8 %i1055 to i32
  %i1057 = getelementptr inbounds i8, ptr %i884, i64 1
  %i1058 = load i8, ptr %i1057, align 1, !tbaa !22
  %i1059 = zext i8 %i1058 to i64
  %i1060 = sub nsw i64 0, %i1059
  %i1061 = getelementptr inbounds i8, ptr %i389, i64 %i1060
  %i1062 = load i8, ptr %i1061, align 1, !tbaa !22
  %i1063 = zext i8 %i1062 to i32
  %i1064 = getelementptr inbounds i8, ptr %i884, i64 2
  %i1065 = load i8, ptr %i1064, align 1, !tbaa !22
  %i1066 = zext i8 %i1065 to i64
  %i1067 = sub nsw i64 0, %i1066
  %i1068 = getelementptr inbounds i8, ptr %i389, i64 %i1067
  %i1069 = load i8, ptr %i1068, align 1, !tbaa !22
  %i1070 = zext i8 %i1069 to i32
  %i1071 = getelementptr inbounds i8, ptr %i884, i64 4
  %i1072 = load i8, ptr %i1071, align 1, !tbaa !22
  %i1073 = zext i8 %i1072 to i64
  %i1074 = sub nsw i64 0, %i1073
  %i1075 = getelementptr inbounds i8, ptr %i389, i64 %i1074
  %i1076 = load i8, ptr %i1075, align 1, !tbaa !22
  %i1077 = zext i8 %i1076 to i32
  %i1078 = getelementptr inbounds i8, ptr %i884, i64 5
  %i1079 = load i8, ptr %i1078, align 1, !tbaa !22
  %i1080 = zext i8 %i1079 to i64
  %i1081 = sub nsw i64 0, %i1080
  %i1082 = getelementptr inbounds i8, ptr %i389, i64 %i1081
  %i1083 = load i8, ptr %i1082, align 1, !tbaa !22
  %i1084 = zext i8 %i1083 to i32
  %i1085 = load i8, ptr %i885, align 1, !tbaa !22
  %i1086 = zext i8 %i1085 to i64
  %i1087 = sub nsw i64 0, %i1086
  %i1088 = getelementptr inbounds i8, ptr %i389, i64 %i1087
  %i1089 = load i8, ptr %i1088, align 1, !tbaa !22
  %i1090 = zext i8 %i1089 to i32
  %i1091 = add nuw nsw i32 %i877, %i849
  %i1092 = add nuw nsw i32 %i1091, %i900
  %i1093 = add nuw nsw i32 %i1092, %i928
  %i1094 = add nuw nsw i32 %i1093, %i1063
  %i1095 = add nuw nsw i32 %i1094, %i1084
  %i1096 = shl nuw nsw i32 %i1095, 2
  %i1097 = add nuw nsw i32 %i883, %i842
  %i1098 = add nuw nsw i32 %i1097, %i893
  %i1099 = add nuw nsw i32 %i1098, %i934
  %i1100 = add nuw nsw i32 %i1099, %i1056
  %i1101 = add nuw nsw i32 %i1100, %i1090
  %i1102 = mul nuw nsw i32 %i1101, 9
  %i1103 = add nuw nsw i32 %i797, %i784
  %i1104 = add nuw nsw i32 %i1103, %i806
  %i1105 = add nuw nsw i32 %i1104, %i813
  %i1106 = add nuw nsw i32 %i1105, %i827
  %i1107 = add nuw nsw i32 %i1106, %i834
  %i1108 = add nuw nsw i32 %i1107, %i856
  %i1109 = add nuw nsw i32 %i1108, %i870
  %i1110 = add nuw nsw i32 %i1109, %i907
  %i1111 = add nuw nsw i32 %i1110, %i921
  %i1112 = add nuw nsw i32 %i1111, %i943
  %i1113 = add nuw nsw i32 %i1112, %i950
  %i1114 = add nuw nsw i32 %i1113, %i964
  %i1115 = add nuw nsw i32 %i1114, %i971
  %i1116 = add nuw nsw i32 %i1115, %i979
  %i1117 = add nuw nsw i32 %i1116, %i992
  %i1118 = add nuw nsw i32 %i1117, %i1070
  %i1119 = add nuw nsw i32 %i1118, %i1077
  %i1120 = add nuw nsw i32 %i1119, %i1096
  %i1121 = add nuw nsw i32 %i1120, %i1102
  %i1122 = sitofp i32 %i1121 to float
  %i1123 = sitofp i32 %i1023 to float
  %i1124 = fdiv float %i1122, %i1123
  br label %bb1125

bb1125:                                           ; preds = %bb776.bb1125_crit_edge, %bb1050
  %i1126 = phi float [ %i1124, %bb1050 ], [ 1.000000e+06, %bb776.bb1125_crit_edge ]
  %i1127 = fcmp olt float %i1126, 5.000000e-01
  br i1 %i1127, label %bb1125.bb1133_crit_edge, label %bb1128

bb1125.bb1133_crit_edge:                          ; preds = %bb1125
  br label %bb1133

bb1128:                                           ; preds = %bb1125
  %i1129 = fcmp ogt float %i1126, 2.000000e+00
  br i1 %i1129, label %bb1128.bb1133_crit_edge, label %bb1130

bb1128.bb1133_crit_edge:                          ; preds = %bb1128
  br label %bb1133

bb1130:                                           ; preds = %bb1128
  %i1131 = icmp slt i32 %i1048, 1
  %i1132 = select i1 %i1131, i32 1, i32 -1
  br label %bb1133

bb1133:                                           ; preds = %bb1128.bb1133_crit_edge, %bb1125.bb1133_crit_edge, %bb1130
  %i1134 = phi i32 [ 0, %bb1125.bb1133_crit_edge ], [ 1, %bb1128.bb1133_crit_edge ], [ %i1132, %bb1130 ]
  %i1135 = phi i32 [ 1, %bb1125.bb1133_crit_edge ], [ 0, %bb1128.bb1133_crit_edge ], [ 1, %bb1130 ]
  %i1136 = add nsw i32 %i1134, %i370
  %i1137 = mul nsw i32 %i1136, %arg5
  %i1138 = trunc i64 %i379 to i32
  %i1139 = add nuw nsw i32 %i1135, %i1138
  %i1140 = add i32 %i1139, %i1137
  %i1141 = sext i32 %i1140 to i64
  %i1142 = getelementptr inbounds i32, ptr %arg1, i64 %i1141
  %i1143 = load i32, ptr %i1142, align 4, !tbaa !19
  %i1144 = icmp sgt i32 %i382, %i1143
  br i1 %i1144, label %bb1145, label %bb1133.bb1180_crit_edge

bb1133.bb1180_crit_edge:                          ; preds = %bb1133
  br label %bb1180

bb1145:                                           ; preds = %bb1133
  %i1146 = sub nsw i32 %i371, %i1134
  %i1147 = mul nsw i32 %i1146, %arg5
  %i1148 = trunc i64 %i379 to i32
  %i1149 = sub nsw i32 %i1148, %i1135
  %i1150 = add i32 %i1149, %i1147
  %i1151 = sext i32 %i1150 to i64
  %i1152 = getelementptr inbounds i32, ptr %arg1, i64 %i1151
  %i1153 = load i32, ptr %i1152, align 4, !tbaa !19
  %i1154 = icmp slt i32 %i382, %i1153
  br i1 %i1154, label %bb1145.bb1180_crit_edge, label %bb1155

bb1145.bb1180_crit_edge:                          ; preds = %bb1145
  br label %bb1180

bb1155:                                           ; preds = %bb1145
  %i1156 = shl nsw i32 %i1134, 1
  %i1157 = add nsw i32 %i1156, %i372
  %i1158 = mul nsw i32 %i1157, %arg5
  %i1159 = shl nuw nsw i32 %i1135, 1
  %i1160 = trunc i64 %i379 to i32
  %i1161 = add nuw i32 %i1159, %i1160
  %i1162 = add i32 %i1161, %i1158
  %i1163 = sext i32 %i1162 to i64
  %i1164 = getelementptr inbounds i32, ptr %arg1, i64 %i1163
  %i1165 = load i32, ptr %i1164, align 4, !tbaa !19
  %i1166 = icmp sgt i32 %i382, %i1165
  br i1 %i1166, label %bb1167, label %bb1155.bb1180_crit_edge

bb1155.bb1180_crit_edge:                          ; preds = %bb1155
  br label %bb1180

bb1167:                                           ; preds = %bb1155
  %i1168 = sub nsw i32 %i373, %i1156
  %i1169 = mul nsw i32 %i1168, %arg5
  %i1170 = trunc i64 %i379 to i32
  %i1171 = sub nsw i32 %i1170, %i1159
  %i1172 = add i32 %i1171, %i1169
  %i1173 = sext i32 %i1172 to i64
  %i1174 = getelementptr inbounds i32, ptr %arg1, i64 %i1173
  %i1175 = load i32, ptr %i1174, align 4, !tbaa !19
  %i1176 = icmp slt i32 %i382, %i1175
  br i1 %i1176, label %bb1167.bb1180_crit_edge, label %bb1167.bb1177_crit_edge

bb1167.bb1177_crit_edge:                          ; preds = %bb1167
  br label %bb1177

bb1167.bb1180_crit_edge:                          ; preds = %bb1167
  br label %bb1180

bb1177:                                           ; preds = %bb1167.bb1177_crit_edge, %bb766.bb1177_crit_edge
  %i1178 = phi i8 [ 1, %bb766.bb1177_crit_edge ], [ 2, %bb1167.bb1177_crit_edge ]
  %i1179 = getelementptr inbounds i8, ptr %arg2, i64 %i380
  store i8 %i1178, ptr %i1179, align 1, !tbaa !22
  br label %bb1180

bb1180:                                           ; preds = %bb1167.bb1180_crit_edge, %bb1155.bb1180_crit_edge, %bb1145.bb1180_crit_edge, %bb1133.bb1180_crit_edge, %bb766.bb1180_crit_edge, %bb754.bb1180_crit_edge, %bb744.bb1180_crit_edge, %bb732.bb1180_crit_edge, %bb378.bb1180_crit_edge, %bb1177
  %i1181 = add nuw nsw i64 %i379, 1
  %i1182 = icmp eq i64 %i1181, %i52
  br i1 %i1182, label %bb1183.loopexit, label %bb1180.bb378_crit_edge, !llvm.loop !51

bb1180.bb378_crit_edge:                           ; preds = %bb1180
  br label %bb378

bb1183.loopexit:                                  ; preds = %bb1180
  br label %bb1183

bb1183:                                           ; preds = %bb358.bb1183_crit_edge, %bb1183.loopexit
  %i1184 = add nuw nsw i64 %i359, 1
  %i1185 = icmp eq i64 %i1184, %i51
  br i1 %i1185, label %bb1186.loopexit, label %bb1183.bb358_crit_edge, !llvm.loop !52

bb1183.bb358_crit_edge:                           ; preds = %bb1183
  br label %bb358

bb1186.loopexit:                                  ; preds = %bb1183
  br label %bb1186

bb1186:                                           ; preds = %bb31.bb1186_crit_edge, %bb1186.loopexit
  ret void
}

declare float @sqrtf(float) local_unnamed_addr

; Function Attrs: nofree nounwind memory(readwrite, inaccessiblemem: write) uwtable
define dso_local void @susan_edges_small(ptr nocapture noundef readonly %arg, ptr nocapture noundef %arg1, ptr nocapture noundef writeonly %arg2, ptr nocapture noundef readonly %arg3, i32 %arg4, i32 noundef %arg5, i32 noundef %arg6) local_unnamed_addr #19 {
bb:
  %i = mul nsw i32 %arg6, %arg5
  %i7 = sext i32 %i to i64
  %i8 = shl nsw i64 %i7, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %arg1, i8 0, i64 %i8, i1 false)
  %i9 = icmp sgt i32 %arg6, 2
  br i1 %i9, label %bb10, label %bb.bb28_crit_edge

bb.bb28_crit_edge:                                ; preds = %bb
  br label %bb28

bb10:                                             ; preds = %bb
  %i11 = add nsw i32 %arg6, -1
  %i12 = add i32 %arg5, -1
  %i13 = icmp sgt i32 %arg5, 2
  %i14 = add nsw i32 %arg5, -2
  %i15 = sext i32 %i14 to i64
  %i16 = sext i32 %arg5 to i64
  %i17 = zext i32 %i11 to i64
  %i18 = zext i32 %i12 to i64
  br label %bb19

bb19:                                             ; preds = %bb118.bb19_crit_edge, %bb10
  %i20 = phi i64 [ 1, %bb10 ], [ %i119, %bb118.bb19_crit_edge ]
  br i1 %i13, label %bb21, label %bb19.bb118_crit_edge

bb19.bb118_crit_edge:                             ; preds = %bb19
  br label %bb118

bb21:                                             ; preds = %bb19
  %i22 = add nsw i64 %i20, -1
  %i23 = mul nsw i64 %i22, %i16
  %i24 = getelementptr inbounds i8, ptr %arg, i64 %i23
  %i25 = trunc i64 %i20 to i32
  %i26 = mul i32 %i25, %arg5
  %i27 = zext i32 %i26 to i64
  br label %bb40

bb28.loopexit:                                    ; preds = %bb118
  br label %bb28

bb28:                                             ; preds = %bb.bb28_crit_edge, %bb28.loopexit
  %i29 = icmp sgt i32 %arg6, 4
  br i1 %i29, label %bb30, label %bb28.bb376_crit_edge

bb28.bb376_crit_edge:                             ; preds = %bb28
  br label %bb376

bb30:                                             ; preds = %bb28
  %i31 = add nsw i32 %arg6, -2
  %i32 = add i32 %arg5, -2
  %i33 = icmp sgt i32 %arg5, 4
  %i34 = sext i32 %i32 to i64
  %i35 = sext i32 %i32 to i64
  %i36 = sext i32 %arg5 to i64
  %i37 = sext i32 %arg5 to i64
  %i38 = zext i32 %i31 to i64
  %i39 = zext i32 %i32 to i64
  br label %bb121

bb40:                                             ; preds = %bb115.bb40_crit_edge, %bb21
  %i41 = phi i64 [ 1, %bb21 ], [ %i116, %bb115.bb40_crit_edge ]
  %i42 = getelementptr inbounds i8, ptr %i24, i64 %i41
  %i43 = getelementptr inbounds i8, ptr %i42, i64 -1
  %i44 = add nuw nsw i64 %i41, %i27
  %i45 = getelementptr inbounds i8, ptr %arg, i64 %i44
  %i46 = load i8, ptr %i45, align 1, !tbaa !22
  %i47 = zext i8 %i46 to i64
  %i48 = getelementptr inbounds i8, ptr %arg3, i64 %i47
  %i49 = load i8, ptr %i43, align 1, !tbaa !22
  %i50 = zext i8 %i49 to i64
  %i51 = sub nsw i64 0, %i50
  %i52 = getelementptr inbounds i8, ptr %i48, i64 %i51
  %i53 = load i8, ptr %i52, align 1, !tbaa !22
  %i54 = zext i8 %i53 to i32
  %i55 = add nuw nsw i32 %i54, 100
  %i56 = getelementptr inbounds i8, ptr %i42, i64 1
  %i57 = load i8, ptr %i42, align 1, !tbaa !22
  %i58 = zext i8 %i57 to i64
  %i59 = sub nsw i64 0, %i58
  %i60 = getelementptr inbounds i8, ptr %i48, i64 %i59
  %i61 = load i8, ptr %i60, align 1, !tbaa !22
  %i62 = zext i8 %i61 to i32
  %i63 = add nuw nsw i32 %i55, %i62
  %i64 = load i8, ptr %i56, align 1, !tbaa !22
  %i65 = zext i8 %i64 to i64
  %i66 = sub nsw i64 0, %i65
  %i67 = getelementptr inbounds i8, ptr %i48, i64 %i66
  %i68 = load i8, ptr %i67, align 1, !tbaa !22
  %i69 = zext i8 %i68 to i32
  %i70 = add nuw nsw i32 %i63, %i69
  %i71 = getelementptr inbounds i8, ptr %i56, i64 %i15
  %i72 = load i8, ptr %i71, align 1, !tbaa !22
  %i73 = zext i8 %i72 to i64
  %i74 = sub nsw i64 0, %i73
  %i75 = getelementptr inbounds i8, ptr %i48, i64 %i74
  %i76 = load i8, ptr %i75, align 1, !tbaa !22
  %i77 = zext i8 %i76 to i32
  %i78 = add nuw nsw i32 %i70, %i77
  %i79 = getelementptr inbounds i8, ptr %i71, i64 2
  %i80 = load i8, ptr %i79, align 1, !tbaa !22
  %i81 = zext i8 %i80 to i64
  %i82 = sub nsw i64 0, %i81
  %i83 = getelementptr inbounds i8, ptr %i48, i64 %i82
  %i84 = load i8, ptr %i83, align 1, !tbaa !22
  %i85 = zext i8 %i84 to i32
  %i86 = add nuw nsw i32 %i78, %i85
  %i87 = getelementptr inbounds i8, ptr %i79, i64 %i15
  %i88 = getelementptr inbounds i8, ptr %i87, i64 1
  %i89 = load i8, ptr %i87, align 1, !tbaa !22
  %i90 = zext i8 %i89 to i64
  %i91 = sub nsw i64 0, %i90
  %i92 = getelementptr inbounds i8, ptr %i48, i64 %i91
  %i93 = load i8, ptr %i92, align 1, !tbaa !22
  %i94 = zext i8 %i93 to i32
  %i95 = add nuw nsw i32 %i86, %i94
  %i96 = getelementptr inbounds i8, ptr %i87, i64 2
  %i97 = load i8, ptr %i88, align 1, !tbaa !22
  %i98 = zext i8 %i97 to i64
  %i99 = sub nsw i64 0, %i98
  %i100 = getelementptr inbounds i8, ptr %i48, i64 %i99
  %i101 = load i8, ptr %i100, align 1, !tbaa !22
  %i102 = zext i8 %i101 to i32
  %i103 = add nuw nsw i32 %i95, %i102
  %i104 = load i8, ptr %i96, align 1, !tbaa !22
  %i105 = zext i8 %i104 to i64
  %i106 = sub nsw i64 0, %i105
  %i107 = getelementptr inbounds i8, ptr %i48, i64 %i106
  %i108 = load i8, ptr %i107, align 1, !tbaa !22
  %i109 = zext i8 %i108 to i32
  %i110 = add nuw nsw i32 %i103, %i109
  %i111 = icmp slt i32 %i110, 731
  br i1 %i111, label %bb112, label %bb40.bb115_crit_edge

bb40.bb115_crit_edge:                             ; preds = %bb40
  br label %bb115

bb112:                                            ; preds = %bb40
  %i113 = sub nuw nsw i32 730, %i110
  %i114 = getelementptr inbounds i32, ptr %arg1, i64 %i44
  store i32 %i113, ptr %i114, align 4, !tbaa !19
  br label %bb115

bb115:                                            ; preds = %bb40.bb115_crit_edge, %bb112
  %i116 = add nuw nsw i64 %i41, 1
  %i117 = icmp eq i64 %i116, %i18
  br i1 %i117, label %bb118.loopexit, label %bb115.bb40_crit_edge, !llvm.loop !53

bb115.bb40_crit_edge:                             ; preds = %bb115
  br label %bb40

bb118.loopexit:                                   ; preds = %bb115
  br label %bb118

bb118:                                            ; preds = %bb19.bb118_crit_edge, %bb118.loopexit
  %i119 = add nuw nsw i64 %i20, 1
  %i120 = icmp eq i64 %i119, %i17
  br i1 %i120, label %bb28.loopexit, label %bb118.bb19_crit_edge, !llvm.loop !54

bb118.bb19_crit_edge:                             ; preds = %bb118
  br label %bb19

bb121:                                            ; preds = %bb373.bb121_crit_edge, %bb30
  %i122 = phi i64 [ 2, %bb30 ], [ %i374, %bb373.bb121_crit_edge ]
  br i1 %i33, label %bb123, label %bb121.bb373_crit_edge

bb121.bb373_crit_edge:                            ; preds = %bb121
  br label %bb373

bb123:                                            ; preds = %bb121
  %i124 = add nsw i64 %i122, -1
  %i125 = mul nsw i64 %i124, %i37
  %i126 = getelementptr inbounds i8, ptr %arg, i64 %i125
  %i127 = add nsw i64 %i122, -1
  %i128 = mul nsw i64 %i127, %i36
  %i129 = getelementptr inbounds i8, ptr %arg, i64 %i128
  %i130 = trunc i64 %i122 to i32
  %i131 = mul i32 %i130, %arg5
  %i132 = zext i32 %i131 to i64
  %i133 = trunc i64 %i122 to i32
  %i134 = trunc i64 %i122 to i32
  %i135 = trunc i64 %i122 to i32
  %i136 = trunc i64 %i122 to i32
  br label %bb137

bb137:                                            ; preds = %bb370.bb137_crit_edge, %bb123
  %i138 = phi i64 [ 2, %bb123 ], [ %i371, %bb370.bb137_crit_edge ]
  %i139 = add nuw nsw i64 %i138, %i132
  %i140 = getelementptr inbounds i32, ptr %arg1, i64 %i139
  %i141 = load i32, ptr %i140, align 4, !tbaa !19
  %i142 = icmp sgt i32 %i141, 0
  br i1 %i142, label %bb143, label %bb137.bb370_crit_edge

bb137.bb370_crit_edge:                            ; preds = %bb137
  br label %bb370

bb143:                                            ; preds = %bb137
  %i144 = getelementptr inbounds i8, ptr %arg, i64 %i139
  %i145 = load i8, ptr %i144, align 1, !tbaa !22
  %i146 = zext i8 %i145 to i64
  %i147 = getelementptr inbounds i8, ptr %arg3, i64 %i146
  %i148 = icmp slt i32 %i141, 480
  br i1 %i148, label %bb149, label %bb143.bb263_crit_edge

bb143.bb263_crit_edge:                            ; preds = %bb143
  br label %bb263

bb149:                                            ; preds = %bb143
  %i150 = sub nsw i32 730, %i141
  %i151 = getelementptr inbounds i8, ptr %i126, i64 %i138
  %i152 = getelementptr inbounds i8, ptr %i151, i64 -1
  %i153 = load i8, ptr %i152, align 1, !tbaa !22
  %i154 = zext i8 %i153 to i64
  %i155 = sub nsw i64 0, %i154
  %i156 = getelementptr inbounds i8, ptr %i147, i64 %i155
  %i157 = load i8, ptr %i156, align 1, !tbaa !22
  %i158 = zext i8 %i157 to i32
  %i159 = getelementptr inbounds i8, ptr %i151, i64 1
  %i160 = load i8, ptr %i151, align 1, !tbaa !22
  %i161 = zext i8 %i160 to i64
  %i162 = sub nsw i64 0, %i161
  %i163 = getelementptr inbounds i8, ptr %i147, i64 %i162
  %i164 = load i8, ptr %i163, align 1, !tbaa !22
  %i165 = zext i8 %i164 to i32
  %i166 = load i8, ptr %i159, align 1, !tbaa !22
  %i167 = zext i8 %i166 to i64
  %i168 = sub nsw i64 0, %i167
  %i169 = getelementptr inbounds i8, ptr %i147, i64 %i168
  %i170 = load i8, ptr %i169, align 1, !tbaa !22
  %i171 = zext i8 %i170 to i32
  %i172 = getelementptr inbounds i8, ptr %i159, i64 %i34
  %i173 = load i8, ptr %i172, align 1, !tbaa !22
  %i174 = zext i8 %i173 to i64
  %i175 = sub nsw i64 0, %i174
  %i176 = getelementptr inbounds i8, ptr %i147, i64 %i175
  %i177 = load i8, ptr %i176, align 1, !tbaa !22
  %i178 = zext i8 %i177 to i32
  %i179 = getelementptr inbounds i8, ptr %i172, i64 2
  %i180 = load i8, ptr %i179, align 1, !tbaa !22
  %i181 = zext i8 %i180 to i64
  %i182 = sub nsw i64 0, %i181
  %i183 = getelementptr inbounds i8, ptr %i147, i64 %i182
  %i184 = load i8, ptr %i183, align 1, !tbaa !22
  %i185 = zext i8 %i184 to i32
  %i186 = getelementptr inbounds i8, ptr %i179, i64 %i34
  %i187 = getelementptr inbounds i8, ptr %i186, i64 1
  %i188 = load i8, ptr %i186, align 1, !tbaa !22
  %i189 = zext i8 %i188 to i64
  %i190 = sub nsw i64 0, %i189
  %i191 = getelementptr inbounds i8, ptr %i147, i64 %i190
  %i192 = load i8, ptr %i191, align 1, !tbaa !22
  %i193 = zext i8 %i192 to i32
  %i194 = add nuw nsw i32 %i165, %i158
  %i195 = add nuw nsw i32 %i194, %i171
  %i196 = sub nsw i32 %i193, %i195
  %i197 = getelementptr inbounds i8, ptr %i186, i64 2
  %i198 = load i8, ptr %i187, align 1, !tbaa !22
  %i199 = zext i8 %i198 to i64
  %i200 = sub nsw i64 0, %i199
  %i201 = getelementptr inbounds i8, ptr %i147, i64 %i200
  %i202 = load i8, ptr %i201, align 1, !tbaa !22
  %i203 = zext i8 %i202 to i32
  %i204 = add nsw i32 %i196, %i203
  %i205 = load i8, ptr %i197, align 1, !tbaa !22
  %i206 = zext i8 %i205 to i64
  %i207 = sub nsw i64 0, %i206
  %i208 = getelementptr inbounds i8, ptr %i147, i64 %i207
  %i209 = load i8, ptr %i208, align 1, !tbaa !22
  %i210 = zext i8 %i209 to i32
  %i211 = add nuw nsw i32 %i158, %i178
  %i212 = add nuw nsw i32 %i171, %i185
  %i213 = add nuw nsw i32 %i211, %i193
  %i214 = sub nsw i32 %i212, %i213
  %i215 = add nsw i32 %i214, %i210
  %i216 = add nsw i32 %i204, %i210
  %i217 = mul nsw i32 %i215, %i215
  %i218 = mul nsw i32 %i216, %i216
  %i219 = add nuw nsw i32 %i217, %i218
  %i220 = sitofp i32 %i219 to float
  %i221 = tail call float @sqrtf(float noundef %i220) #11
  %i222 = fpext float %i221 to double
  %i223 = sitofp i32 %i150 to float
  %i224 = fpext float %i223 to double
  %i225 = fmul double %i224, 4.000000e-01
  %i226 = fcmp olt double %i225, %i222
  br i1 %i226, label %bb227, label %bb149.bb263_crit_edge

bb149.bb263_crit_edge:                            ; preds = %bb149
  br label %bb263

bb227:                                            ; preds = %bb149
  %i228 = icmp eq i32 %i215, 0
  %i229 = sitofp i32 %i216 to float
  %i230 = sitofp i32 %i215 to float
  %i231 = fdiv float %i229, %i230
  %i232 = select i1 %i228, float 1.000000e+06, float %i231
  %i233 = fcmp uge float %i232, 0.000000e+00
  %i234 = fneg float %i232
  %i235 = select i1 %i233, float %i232, float %i234
  %i236 = fcmp olt float %i235, 5.000000e-01
  br i1 %i236, label %bb227.bb241_crit_edge, label %bb237

bb227.bb241_crit_edge:                            ; preds = %bb227
  br label %bb241

bb237:                                            ; preds = %bb227
  %i238 = fcmp ogt float %i235, 2.000000e+00
  br i1 %i238, label %bb237.bb241_crit_edge, label %bb239

bb237.bb241_crit_edge:                            ; preds = %bb237
  br label %bb241

bb239:                                            ; preds = %bb237
  %i240 = select i1 %i233, i32 1, i32 -1
  br label %bb241

bb241:                                            ; preds = %bb237.bb241_crit_edge, %bb227.bb241_crit_edge, %bb239
  %i242 = phi i32 [ 0, %bb227.bb241_crit_edge ], [ 1, %bb237.bb241_crit_edge ], [ %i240, %bb239 ]
  %i243 = phi i32 [ 1, %bb227.bb241_crit_edge ], [ 0, %bb237.bb241_crit_edge ], [ 1, %bb239 ]
  %i244 = add nsw i32 %i242, %i135
  %i245 = mul nsw i32 %i244, %arg5
  %i246 = trunc i64 %i138 to i32
  %i247 = add nuw nsw i32 %i243, %i246
  %i248 = add i32 %i247, %i245
  %i249 = sext i32 %i248 to i64
  %i250 = getelementptr inbounds i32, ptr %arg1, i64 %i249
  %i251 = load i32, ptr %i250, align 4, !tbaa !19
  %i252 = icmp sgt i32 %i141, %i251
  br i1 %i252, label %bb253, label %bb241.bb370_crit_edge

bb241.bb370_crit_edge:                            ; preds = %bb241
  br label %bb370

bb253:                                            ; preds = %bb241
  %i254 = sub nsw i32 %i136, %i242
  %i255 = mul nsw i32 %i254, %arg5
  %i256 = trunc i64 %i138 to i32
  %i257 = sub nsw i32 %i256, %i243
  %i258 = add i32 %i257, %i255
  %i259 = sext i32 %i258 to i64
  %i260 = getelementptr inbounds i32, ptr %arg1, i64 %i259
  %i261 = load i32, ptr %i260, align 4, !tbaa !19
  %i262 = icmp slt i32 %i141, %i261
  br i1 %i262, label %bb253.bb370_crit_edge, label %bb253.bb367_crit_edge

bb253.bb367_crit_edge:                            ; preds = %bb253
  br label %bb367

bb253.bb370_crit_edge:                            ; preds = %bb253
  br label %bb370

bb263:                                            ; preds = %bb149.bb263_crit_edge, %bb143.bb263_crit_edge
  %i264 = getelementptr inbounds i8, ptr %i129, i64 %i138
  %i265 = getelementptr inbounds i8, ptr %i264, i64 -1
  %i266 = load i8, ptr %i265, align 1, !tbaa !22
  %i267 = zext i8 %i266 to i64
  %i268 = sub nsw i64 0, %i267
  %i269 = getelementptr inbounds i8, ptr %i147, i64 %i268
  %i270 = load i8, ptr %i269, align 1, !tbaa !22
  %i271 = zext i8 %i270 to i32
  %i272 = getelementptr inbounds i8, ptr %i264, i64 1
  %i273 = load i8, ptr %i264, align 1, !tbaa !22
  %i274 = zext i8 %i273 to i64
  %i275 = sub nsw i64 0, %i274
  %i276 = getelementptr inbounds i8, ptr %i147, i64 %i275
  %i277 = load i8, ptr %i276, align 1, !tbaa !22
  %i278 = zext i8 %i277 to i32
  %i279 = load i8, ptr %i272, align 1, !tbaa !22
  %i280 = zext i8 %i279 to i64
  %i281 = sub nsw i64 0, %i280
  %i282 = getelementptr inbounds i8, ptr %i147, i64 %i281
  %i283 = load i8, ptr %i282, align 1, !tbaa !22
  %i284 = zext i8 %i283 to i32
  %i285 = getelementptr inbounds i8, ptr %i272, i64 %i35
  %i286 = getelementptr inbounds i8, ptr %i285, i64 2
  %i287 = getelementptr inbounds i8, ptr %i286, i64 %i35
  %i288 = getelementptr inbounds i8, ptr %i287, i64 1
  %i289 = load i8, ptr %i287, align 1, !tbaa !22
  %i290 = zext i8 %i289 to i64
  %i291 = sub nsw i64 0, %i290
  %i292 = getelementptr inbounds i8, ptr %i147, i64 %i291
  %i293 = load i8, ptr %i292, align 1, !tbaa !22
  %i294 = zext i8 %i293 to i32
  %i295 = getelementptr inbounds i8, ptr %i287, i64 2
  %i296 = load i8, ptr %i288, align 1, !tbaa !22
  %i297 = zext i8 %i296 to i64
  %i298 = sub nsw i64 0, %i297
  %i299 = getelementptr inbounds i8, ptr %i147, i64 %i298
  %i300 = load i8, ptr %i299, align 1, !tbaa !22
  %i301 = zext i8 %i300 to i32
  %i302 = load i8, ptr %i295, align 1, !tbaa !22
  %i303 = zext i8 %i302 to i64
  %i304 = sub nsw i64 0, %i303
  %i305 = getelementptr inbounds i8, ptr %i147, i64 %i304
  %i306 = load i8, ptr %i305, align 1, !tbaa !22
  %i307 = zext i8 %i306 to i32
  %i308 = add nuw nsw i32 %i294, %i284
  %i309 = add nuw nsw i32 %i308, %i271
  %i310 = add nuw nsw i32 %i309, %i278
  %i311 = add nuw nsw i32 %i310, %i301
  %i312 = add nuw nsw i32 %i311, %i307
  %i313 = add nuw nsw i32 %i307, %i271
  %i314 = add nuw nsw i32 %i284, %i294
  %i315 = icmp eq i32 %i312, 0
  br i1 %i315, label %bb263.bb337_crit_edge, label %bb316

bb263.bb337_crit_edge:                            ; preds = %bb263
  br label %bb337

bb316:                                            ; preds = %bb263
  %i317 = load i8, ptr %i285, align 1, !tbaa !22
  %i318 = zext i8 %i317 to i64
  %i319 = sub nsw i64 0, %i318
  %i320 = getelementptr inbounds i8, ptr %i147, i64 %i319
  %i321 = load i8, ptr %i320, align 1, !tbaa !22
  %i322 = zext i8 %i321 to i32
  %i323 = load i8, ptr %i286, align 1, !tbaa !22
  %i324 = zext i8 %i323 to i64
  %i325 = sub nsw i64 0, %i324
  %i326 = getelementptr inbounds i8, ptr %i147, i64 %i325
  %i327 = load i8, ptr %i326, align 1, !tbaa !22
  %i328 = zext i8 %i327 to i32
  %i329 = add nuw nsw i32 %i294, %i284
  %i330 = add nuw nsw i32 %i329, %i271
  %i331 = add nuw nsw i32 %i330, %i307
  %i332 = add nuw nsw i32 %i331, %i322
  %i333 = add nuw nsw i32 %i332, %i328
  %i334 = sitofp i32 %i333 to float
  %i335 = sitofp i32 %i312 to float
  %i336 = fdiv float %i334, %i335
  br label %bb337

bb337:                                            ; preds = %bb263.bb337_crit_edge, %bb316
  %i338 = phi float [ %i336, %bb316 ], [ 1.000000e+06, %bb263.bb337_crit_edge ]
  %i339 = fcmp olt float %i338, 5.000000e-01
  br i1 %i339, label %bb337.bb345_crit_edge, label %bb340

bb337.bb345_crit_edge:                            ; preds = %bb337
  br label %bb345

bb340:                                            ; preds = %bb337
  %i341 = fcmp ogt float %i338, 2.000000e+00
  br i1 %i341, label %bb340.bb345_crit_edge, label %bb342

bb340.bb345_crit_edge:                            ; preds = %bb340
  br label %bb345

bb342:                                            ; preds = %bb340
  %i343 = icmp ugt i32 %i313, %i314
  %i344 = select i1 %i343, i32 -1, i32 1
  br label %bb345

bb345:                                            ; preds = %bb340.bb345_crit_edge, %bb337.bb345_crit_edge, %bb342
  %i346 = phi i32 [ 0, %bb337.bb345_crit_edge ], [ 1, %bb340.bb345_crit_edge ], [ %i344, %bb342 ]
  %i347 = phi i32 [ 1, %bb337.bb345_crit_edge ], [ 0, %bb340.bb345_crit_edge ], [ 1, %bb342 ]
  %i348 = add nsw i32 %i346, %i133
  %i349 = mul nsw i32 %i348, %arg5
  %i350 = trunc i64 %i138 to i32
  %i351 = add nuw nsw i32 %i347, %i350
  %i352 = add i32 %i351, %i349
  %i353 = sext i32 %i352 to i64
  %i354 = getelementptr inbounds i32, ptr %arg1, i64 %i353
  %i355 = load i32, ptr %i354, align 4, !tbaa !19
  %i356 = icmp sgt i32 %i141, %i355
  br i1 %i356, label %bb357, label %bb345.bb370_crit_edge

bb345.bb370_crit_edge:                            ; preds = %bb345
  br label %bb370

bb357:                                            ; preds = %bb345
  %i358 = sub nsw i32 %i134, %i346
  %i359 = mul nsw i32 %i358, %arg5
  %i360 = trunc i64 %i138 to i32
  %i361 = sub nsw i32 %i360, %i347
  %i362 = add i32 %i361, %i359
  %i363 = sext i32 %i362 to i64
  %i364 = getelementptr inbounds i32, ptr %arg1, i64 %i363
  %i365 = load i32, ptr %i364, align 4, !tbaa !19
  %i366 = icmp slt i32 %i141, %i365
  br i1 %i366, label %bb357.bb370_crit_edge, label %bb357.bb367_crit_edge

bb357.bb367_crit_edge:                            ; preds = %bb357
  br label %bb367

bb357.bb370_crit_edge:                            ; preds = %bb357
  br label %bb370

bb367:                                            ; preds = %bb357.bb367_crit_edge, %bb253.bb367_crit_edge
  %i368 = phi i8 [ 1, %bb253.bb367_crit_edge ], [ 2, %bb357.bb367_crit_edge ]
  %i369 = getelementptr inbounds i8, ptr %arg2, i64 %i139
  store i8 %i368, ptr %i369, align 1, !tbaa !22
  br label %bb370

bb370:                                            ; preds = %bb357.bb370_crit_edge, %bb345.bb370_crit_edge, %bb253.bb370_crit_edge, %bb241.bb370_crit_edge, %bb137.bb370_crit_edge, %bb367
  %i371 = add nuw nsw i64 %i138, 1
  %i372 = icmp eq i64 %i371, %i39
  br i1 %i372, label %bb373.loopexit, label %bb370.bb137_crit_edge, !llvm.loop !55

bb370.bb137_crit_edge:                            ; preds = %bb370
  br label %bb137

bb373.loopexit:                                   ; preds = %bb370
  br label %bb373

bb373:                                            ; preds = %bb121.bb373_crit_edge, %bb373.loopexit
  %i374 = add nuw nsw i64 %i122, 1
  %i375 = icmp eq i64 %i374, %i38
  br i1 %i375, label %bb376.loopexit, label %bb373.bb121_crit_edge, !llvm.loop !56

bb373.bb121_crit_edge:                            ; preds = %bb373
  br label %bb121

bb376.loopexit:                                   ; preds = %bb373
  br label %bb376

bb376:                                            ; preds = %bb28.bb376_crit_edge, %bb376.loopexit
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @corner_draw(ptr nocapture noundef writeonly %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2, i32 noundef %arg3) local_unnamed_addr #17 {
bb:
  %i = getelementptr inbounds %struct.anon, ptr %arg1, i64 0, i32 2
  %i4 = load i32, ptr %i, align 4, !tbaa !57
  %i5 = icmp eq i32 %i4, 7
  br i1 %i5, label %bb.bb44_crit_edge, label %bb6

bb.bb44_crit_edge:                                ; preds = %bb
  br label %bb44

bb6:                                              ; preds = %bb
  %i7 = icmp eq i32 %arg3, 0
  %i8 = add nsw i32 %arg2, -2
  %i9 = sext i32 %i8 to i64
  br label %bb10

bb10:                                             ; preds = %bb38.bb10_crit_edge, %bb6
  %i11 = phi i64 [ 0, %bb6 ], [ %i39, %bb38.bb10_crit_edge ]
  %i12 = phi ptr [ %arg1, %bb6 ], [ %i40, %bb38.bb10_crit_edge ]
  %i13 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i11, i32 1
  %i14 = load i32, ptr %i13, align 4, !tbaa !59
  br i1 %i7, label %bb15, label %bb31

bb15:                                             ; preds = %bb10
  %i16 = add nsw i32 %i14, -1
  %i17 = mul nsw i32 %i16, %arg2
  %i18 = sext i32 %i17 to i64
  %i19 = getelementptr inbounds i8, ptr %arg, i64 %i18
  %i20 = load i32, ptr %i12, align 4, !tbaa !60
  %i21 = sext i32 %i20 to i64
  %i22 = getelementptr inbounds i8, ptr %i19, i64 %i21
  %i23 = getelementptr inbounds i8, ptr %i22, i64 -1
  store i8 -1, ptr %i23, align 1, !tbaa !22
  %i24 = getelementptr inbounds i8, ptr %i22, i64 1
  store i8 -1, ptr %i22, align 1, !tbaa !22
  store i8 -1, ptr %i24, align 1, !tbaa !22
  %i25 = getelementptr inbounds i8, ptr %i24, i64 %i9
  %i26 = getelementptr inbounds i8, ptr %i25, i64 1
  store i8 -1, ptr %i25, align 1, !tbaa !22
  %i27 = getelementptr inbounds i8, ptr %i25, i64 2
  store i8 0, ptr %i26, align 1, !tbaa !22
  store i8 -1, ptr %i27, align 1, !tbaa !22
  %i28 = getelementptr inbounds i8, ptr %i27, i64 %i9
  %i29 = getelementptr inbounds i8, ptr %i28, i64 1
  store i8 -1, ptr %i28, align 1, !tbaa !22
  %i30 = getelementptr inbounds i8, ptr %i28, i64 2
  store i8 -1, ptr %i29, align 1, !tbaa !22
  store i8 -1, ptr %i30, align 1, !tbaa !22
  br label %bb38

bb31:                                             ; preds = %bb10
  %i32 = mul nsw i32 %i14, %arg2
  %i33 = sext i32 %i32 to i64
  %i34 = getelementptr inbounds i8, ptr %arg, i64 %i33
  %i35 = load i32, ptr %i12, align 4, !tbaa !60
  %i36 = sext i32 %i35 to i64
  %i37 = getelementptr inbounds i8, ptr %i34, i64 %i36
  store i8 0, ptr %i37, align 1, !tbaa !22
  br label %bb38

bb38:                                             ; preds = %bb31, %bb15
  %i39 = add nuw nsw i64 %i11, 1
  %i40 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i39
  %i41 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i39, i32 2
  %i42 = load i32, ptr %i41, align 4, !tbaa !57
  %i43 = icmp eq i32 %i42, 7
  br i1 %i43, label %bb44.loopexit, label %bb38.bb10_crit_edge, !llvm.loop !61

bb38.bb10_crit_edge:                              ; preds = %bb38
  br label %bb10

bb44.loopexit:                                    ; preds = %bb38
  br label %bb44

bb44:                                             ; preds = %bb.bb44_crit_edge, %bb44.loopexit
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @susan_corners(ptr nocapture noundef readonly %arg, ptr noundef %arg1, ptr nocapture noundef readonly %arg2, i32 noundef %arg3, ptr nocapture noundef writeonly %arg4, i32 noundef %arg5, i32 noundef %arg6) local_unnamed_addr #0 {
bb:
  %i = mul nsw i32 %arg6, %arg5
  %i7 = sext i32 %i to i64
  %i8 = shl nsw i64 %i7, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %arg1, i8 0, i64 %i8, i1 false)
  %i9 = tail call noalias ptr @malloc(i64 noundef %i8) #24
  %i10 = tail call noalias ptr @malloc(i64 noundef %i8) #24
  %i11 = add i32 %arg6, -5
  %i12 = icmp sgt i32 %arg6, 10
  br i1 %i12, label %bb13, label %bb.bb39_crit_edge

bb.bb39_crit_edge:                                ; preds = %bb
  br label %bb39

bb13:                                             ; preds = %bb
  %i14 = add i32 %arg5, -5
  %i15 = icmp sgt i32 %arg5, 10
  %i16 = add nsw i32 %arg5, -3
  %i17 = sext i32 %i16 to i64
  %i18 = sext i32 %i14 to i64
  %i19 = add nsw i32 %arg5, -6
  %i20 = sext i32 %i19 to i64
  %i21 = sext i32 %arg5 to i64
  %i22 = zext i32 %i11 to i64
  %i23 = zext i32 %i14 to i64
  br label %bb24

bb24:                                             ; preds = %bb596.bb24_crit_edge, %bb13
  %i25 = phi i64 [ 5, %bb13 ], [ %i597, %bb596.bb24_crit_edge ]
  br i1 %i15, label %bb26, label %bb24.bb596_crit_edge

bb24.bb596_crit_edge:                             ; preds = %bb24
  br label %bb596

bb26:                                             ; preds = %bb24
  %i27 = add nsw i64 %i25, -3
  %i28 = mul nsw i64 %i27, %i21
  %i29 = getelementptr inbounds i8, ptr %arg, i64 %i28
  %i30 = trunc i64 %i25 to i32
  %i31 = mul i32 %i30, %arg5
  %i32 = zext i32 %i31 to i64
  %i33 = trunc i64 %i25 to i32
  %i34 = trunc i64 %i25 to i32
  %i35 = trunc i64 %i25 to i32
  %i36 = trunc i64 %i25 to i32
  %i37 = trunc i64 %i25 to i32
  %i38 = trunc i64 %i25 to i32
  br label %bb53

bb39.loopexit:                                    ; preds = %bb596
  br label %bb39

bb39:                                             ; preds = %bb.bb39_crit_edge, %bb39.loopexit
  %i40 = icmp sgt i32 %arg6, 10
  br i1 %i40, label %bb41, label %bb39.bb853_crit_edge

bb39.bb853_crit_edge:                             ; preds = %bb39
  br label %bb853

bb41:                                             ; preds = %bb39
  %i42 = add i32 %arg5, -5
  %i43 = icmp sgt i32 %arg5, 10
  %i44 = sext i32 %arg5 to i64
  %i45 = sext i32 %arg5 to i64
  %i46 = sext i32 %arg5 to i64
  %i47 = sext i32 %arg5 to i64
  %i48 = sext i32 %arg5 to i64
  %i49 = sext i32 %arg5 to i64
  %i50 = sext i32 %arg5 to i64
  %i51 = zext i32 %i11 to i64
  %i52 = zext i32 %i42 to i64
  br label %bb599

bb53:                                             ; preds = %bb593.bb53_crit_edge, %bb26
  %i54 = phi i64 [ 5, %bb26 ], [ %i594, %bb593.bb53_crit_edge ]
  %i55 = getelementptr inbounds i8, ptr %i29, i64 %i54
  %i56 = getelementptr inbounds i8, ptr %i55, i64 -1
  %i57 = add nuw nsw i64 %i54, %i32
  %i58 = getelementptr inbounds i8, ptr %arg, i64 %i57
  %i59 = load i8, ptr %i58, align 1, !tbaa !22
  %i60 = zext i8 %i59 to i64
  %i61 = getelementptr inbounds i8, ptr %arg2, i64 %i60
  %i62 = load i8, ptr %i56, align 1, !tbaa !22
  %i63 = zext i8 %i62 to i64
  %i64 = sub nsw i64 0, %i63
  %i65 = getelementptr inbounds i8, ptr %i61, i64 %i64
  %i66 = load i8, ptr %i65, align 1, !tbaa !22
  %i67 = zext i8 %i66 to i32
  %i68 = add nuw nsw i32 %i67, 100
  %i69 = getelementptr inbounds i8, ptr %i55, i64 1
  %i70 = load i8, ptr %i55, align 1, !tbaa !22
  %i71 = zext i8 %i70 to i64
  %i72 = sub nsw i64 0, %i71
  %i73 = getelementptr inbounds i8, ptr %i61, i64 %i72
  %i74 = load i8, ptr %i73, align 1, !tbaa !22
  %i75 = zext i8 %i74 to i32
  %i76 = add nuw nsw i32 %i68, %i75
  %i77 = load i8, ptr %i69, align 1, !tbaa !22
  %i78 = zext i8 %i77 to i64
  %i79 = sub nsw i64 0, %i78
  %i80 = getelementptr inbounds i8, ptr %i61, i64 %i79
  %i81 = load i8, ptr %i80, align 1, !tbaa !22
  %i82 = zext i8 %i81 to i32
  %i83 = add nuw nsw i32 %i76, %i82
  %i84 = getelementptr inbounds i8, ptr %i69, i64 %i17
  %i85 = getelementptr inbounds i8, ptr %i84, i64 1
  %i86 = load i8, ptr %i84, align 1, !tbaa !22
  %i87 = zext i8 %i86 to i64
  %i88 = sub nsw i64 0, %i87
  %i89 = getelementptr inbounds i8, ptr %i61, i64 %i88
  %i90 = load i8, ptr %i89, align 1, !tbaa !22
  %i91 = zext i8 %i90 to i32
  %i92 = add nuw nsw i32 %i83, %i91
  %i93 = getelementptr inbounds i8, ptr %i84, i64 2
  %i94 = load i8, ptr %i85, align 1, !tbaa !22
  %i95 = zext i8 %i94 to i64
  %i96 = sub nsw i64 0, %i95
  %i97 = getelementptr inbounds i8, ptr %i61, i64 %i96
  %i98 = load i8, ptr %i97, align 1, !tbaa !22
  %i99 = zext i8 %i98 to i32
  %i100 = add nuw nsw i32 %i92, %i99
  %i101 = getelementptr inbounds i8, ptr %i84, i64 3
  %i102 = load i8, ptr %i93, align 1, !tbaa !22
  %i103 = zext i8 %i102 to i64
  %i104 = sub nsw i64 0, %i103
  %i105 = getelementptr inbounds i8, ptr %i61, i64 %i104
  %i106 = load i8, ptr %i105, align 1, !tbaa !22
  %i107 = zext i8 %i106 to i32
  %i108 = add nuw nsw i32 %i100, %i107
  %i109 = getelementptr inbounds i8, ptr %i84, i64 4
  %i110 = load i8, ptr %i101, align 1, !tbaa !22
  %i111 = zext i8 %i110 to i64
  %i112 = sub nsw i64 0, %i111
  %i113 = getelementptr inbounds i8, ptr %i61, i64 %i112
  %i114 = load i8, ptr %i113, align 1, !tbaa !22
  %i115 = zext i8 %i114 to i32
  %i116 = add nuw nsw i32 %i108, %i115
  %i117 = load i8, ptr %i109, align 1, !tbaa !22
  %i118 = zext i8 %i117 to i64
  %i119 = sub nsw i64 0, %i118
  %i120 = getelementptr inbounds i8, ptr %i61, i64 %i119
  %i121 = load i8, ptr %i120, align 1, !tbaa !22
  %i122 = zext i8 %i121 to i32
  %i123 = add nuw nsw i32 %i116, %i122
  %i124 = getelementptr inbounds i8, ptr %i109, i64 %i18
  %i125 = getelementptr inbounds i8, ptr %i124, i64 1
  %i126 = load i8, ptr %i124, align 1, !tbaa !22
  %i127 = zext i8 %i126 to i64
  %i128 = sub nsw i64 0, %i127
  %i129 = getelementptr inbounds i8, ptr %i61, i64 %i128
  %i130 = load i8, ptr %i129, align 1, !tbaa !22
  %i131 = zext i8 %i130 to i32
  %i132 = add nuw nsw i32 %i123, %i131
  %i133 = getelementptr inbounds i8, ptr %i124, i64 2
  %i134 = load i8, ptr %i125, align 1, !tbaa !22
  %i135 = zext i8 %i134 to i64
  %i136 = sub nsw i64 0, %i135
  %i137 = getelementptr inbounds i8, ptr %i61, i64 %i136
  %i138 = load i8, ptr %i137, align 1, !tbaa !22
  %i139 = zext i8 %i138 to i32
  %i140 = add nuw nsw i32 %i132, %i139
  %i141 = getelementptr inbounds i8, ptr %i124, i64 3
  %i142 = load i8, ptr %i133, align 1, !tbaa !22
  %i143 = zext i8 %i142 to i64
  %i144 = sub nsw i64 0, %i143
  %i145 = getelementptr inbounds i8, ptr %i61, i64 %i144
  %i146 = load i8, ptr %i145, align 1, !tbaa !22
  %i147 = zext i8 %i146 to i32
  %i148 = add nuw nsw i32 %i140, %i147
  %i149 = getelementptr inbounds i8, ptr %i124, i64 4
  %i150 = load i8, ptr %i141, align 1, !tbaa !22
  %i151 = zext i8 %i150 to i64
  %i152 = sub nsw i64 0, %i151
  %i153 = getelementptr inbounds i8, ptr %i61, i64 %i152
  %i154 = load i8, ptr %i153, align 1, !tbaa !22
  %i155 = zext i8 %i154 to i32
  %i156 = add nuw nsw i32 %i148, %i155
  %i157 = getelementptr inbounds i8, ptr %i124, i64 5
  %i158 = load i8, ptr %i149, align 1, !tbaa !22
  %i159 = zext i8 %i158 to i64
  %i160 = sub nsw i64 0, %i159
  %i161 = getelementptr inbounds i8, ptr %i61, i64 %i160
  %i162 = load i8, ptr %i161, align 1, !tbaa !22
  %i163 = zext i8 %i162 to i32
  %i164 = add nuw nsw i32 %i156, %i163
  %i165 = getelementptr inbounds i8, ptr %i124, i64 6
  %i166 = load i8, ptr %i157, align 1, !tbaa !22
  %i167 = zext i8 %i166 to i64
  %i168 = sub nsw i64 0, %i167
  %i169 = getelementptr inbounds i8, ptr %i61, i64 %i168
  %i170 = load i8, ptr %i169, align 1, !tbaa !22
  %i171 = zext i8 %i170 to i32
  %i172 = add nuw nsw i32 %i164, %i171
  %i173 = load i8, ptr %i165, align 1, !tbaa !22
  %i174 = zext i8 %i173 to i64
  %i175 = sub nsw i64 0, %i174
  %i176 = getelementptr inbounds i8, ptr %i61, i64 %i175
  %i177 = load i8, ptr %i176, align 1, !tbaa !22
  %i178 = zext i8 %i177 to i32
  %i179 = add nuw nsw i32 %i172, %i178
  %i180 = getelementptr inbounds i8, ptr %i165, i64 %i20
  %i181 = getelementptr inbounds i8, ptr %i180, i64 1
  %i182 = load i8, ptr %i180, align 1, !tbaa !22
  %i183 = zext i8 %i182 to i64
  %i184 = sub nsw i64 0, %i183
  %i185 = getelementptr inbounds i8, ptr %i61, i64 %i184
  %i186 = load i8, ptr %i185, align 1, !tbaa !22
  %i187 = zext i8 %i186 to i32
  %i188 = add nuw nsw i32 %i179, %i187
  %i189 = getelementptr inbounds i8, ptr %i180, i64 2
  %i190 = load i8, ptr %i181, align 1, !tbaa !22
  %i191 = zext i8 %i190 to i64
  %i192 = sub nsw i64 0, %i191
  %i193 = getelementptr inbounds i8, ptr %i61, i64 %i192
  %i194 = load i8, ptr %i193, align 1, !tbaa !22
  %i195 = zext i8 %i194 to i32
  %i196 = add nuw nsw i32 %i188, %i195
  %i197 = load i8, ptr %i189, align 1, !tbaa !22
  %i198 = zext i8 %i197 to i64
  %i199 = sub nsw i64 0, %i198
  %i200 = getelementptr inbounds i8, ptr %i61, i64 %i199
  %i201 = load i8, ptr %i200, align 1, !tbaa !22
  %i202 = zext i8 %i201 to i32
  %i203 = add nuw nsw i32 %i196, %i202
  %i204 = icmp slt i32 %i203, %arg3
  br i1 %i204, label %bb205, label %bb53.bb593_crit_edge

bb53.bb593_crit_edge:                             ; preds = %bb53
  br label %bb593

bb205:                                            ; preds = %bb53
  %i206 = getelementptr inbounds i8, ptr %i180, i64 4
  %i207 = load i8, ptr %i206, align 1, !tbaa !22
  %i208 = zext i8 %i207 to i64
  %i209 = sub nsw i64 0, %i208
  %i210 = getelementptr inbounds i8, ptr %i61, i64 %i209
  %i211 = load i8, ptr %i210, align 1, !tbaa !22
  %i212 = zext i8 %i211 to i32
  %i213 = add nuw nsw i32 %i203, %i212
  %i214 = icmp slt i32 %i213, %arg3
  br i1 %i214, label %bb215, label %bb205.bb593_crit_edge

bb205.bb593_crit_edge:                            ; preds = %bb205
  br label %bb593

bb215:                                            ; preds = %bb205
  %i216 = getelementptr inbounds i8, ptr %i180, i64 5
  %i217 = getelementptr inbounds i8, ptr %i180, i64 6
  %i218 = load i8, ptr %i216, align 1, !tbaa !22
  %i219 = zext i8 %i218 to i64
  %i220 = sub nsw i64 0, %i219
  %i221 = getelementptr inbounds i8, ptr %i61, i64 %i220
  %i222 = load i8, ptr %i221, align 1, !tbaa !22
  %i223 = zext i8 %i222 to i32
  %i224 = add nuw nsw i32 %i213, %i223
  %i225 = icmp slt i32 %i224, %arg3
  br i1 %i225, label %bb226, label %bb215.bb593_crit_edge

bb215.bb593_crit_edge:                            ; preds = %bb215
  br label %bb593

bb226:                                            ; preds = %bb215
  %i227 = load i8, ptr %i217, align 1, !tbaa !22
  %i228 = zext i8 %i227 to i64
  %i229 = sub nsw i64 0, %i228
  %i230 = getelementptr inbounds i8, ptr %i61, i64 %i229
  %i231 = load i8, ptr %i230, align 1, !tbaa !22
  %i232 = zext i8 %i231 to i32
  %i233 = add nuw nsw i32 %i224, %i232
  %i234 = icmp slt i32 %i233, %arg3
  br i1 %i234, label %bb235, label %bb226.bb593_crit_edge

bb226.bb593_crit_edge:                            ; preds = %bb226
  br label %bb593

bb235:                                            ; preds = %bb226
  %i236 = getelementptr inbounds i8, ptr %i217, i64 %i20
  %i237 = load i8, ptr %i236, align 1, !tbaa !22
  %i238 = zext i8 %i237 to i64
  %i239 = sub nsw i64 0, %i238
  %i240 = getelementptr inbounds i8, ptr %i61, i64 %i239
  %i241 = load i8, ptr %i240, align 1, !tbaa !22
  %i242 = zext i8 %i241 to i32
  %i243 = add nuw nsw i32 %i233, %i242
  %i244 = icmp slt i32 %i243, %arg3
  br i1 %i244, label %bb245, label %bb235.bb593_crit_edge

bb235.bb593_crit_edge:                            ; preds = %bb235
  br label %bb593

bb245:                                            ; preds = %bb235
  %i246 = getelementptr inbounds i8, ptr %i236, i64 1
  %i247 = load i8, ptr %i246, align 1, !tbaa !22
  %i248 = zext i8 %i247 to i64
  %i249 = sub nsw i64 0, %i248
  %i250 = getelementptr inbounds i8, ptr %i61, i64 %i249
  %i251 = load i8, ptr %i250, align 1, !tbaa !22
  %i252 = zext i8 %i251 to i32
  %i253 = add nuw nsw i32 %i243, %i252
  %i254 = icmp slt i32 %i253, %arg3
  br i1 %i254, label %bb255, label %bb245.bb593_crit_edge

bb245.bb593_crit_edge:                            ; preds = %bb245
  br label %bb593

bb255:                                            ; preds = %bb245
  %i256 = getelementptr inbounds i8, ptr %i236, i64 2
  %i257 = load i8, ptr %i256, align 1, !tbaa !22
  %i258 = zext i8 %i257 to i64
  %i259 = sub nsw i64 0, %i258
  %i260 = getelementptr inbounds i8, ptr %i61, i64 %i259
  %i261 = load i8, ptr %i260, align 1, !tbaa !22
  %i262 = zext i8 %i261 to i32
  %i263 = add nuw nsw i32 %i253, %i262
  %i264 = icmp slt i32 %i263, %arg3
  br i1 %i264, label %bb265, label %bb255.bb593_crit_edge

bb255.bb593_crit_edge:                            ; preds = %bb255
  br label %bb593

bb265:                                            ; preds = %bb255
  %i266 = getelementptr inbounds i8, ptr %i236, i64 3
  %i267 = load i8, ptr %i266, align 1, !tbaa !22
  %i268 = zext i8 %i267 to i64
  %i269 = sub nsw i64 0, %i268
  %i270 = getelementptr inbounds i8, ptr %i61, i64 %i269
  %i271 = load i8, ptr %i270, align 1, !tbaa !22
  %i272 = zext i8 %i271 to i32
  %i273 = add nuw nsw i32 %i263, %i272
  %i274 = icmp slt i32 %i273, %arg3
  br i1 %i274, label %bb275, label %bb265.bb593_crit_edge

bb265.bb593_crit_edge:                            ; preds = %bb265
  br label %bb593

bb275:                                            ; preds = %bb265
  %i276 = getelementptr inbounds i8, ptr %i236, i64 4
  %i277 = load i8, ptr %i276, align 1, !tbaa !22
  %i278 = zext i8 %i277 to i64
  %i279 = sub nsw i64 0, %i278
  %i280 = getelementptr inbounds i8, ptr %i61, i64 %i279
  %i281 = load i8, ptr %i280, align 1, !tbaa !22
  %i282 = zext i8 %i281 to i32
  %i283 = add nuw nsw i32 %i273, %i282
  %i284 = icmp slt i32 %i283, %arg3
  br i1 %i284, label %bb285, label %bb275.bb593_crit_edge

bb275.bb593_crit_edge:                            ; preds = %bb275
  br label %bb593

bb285:                                            ; preds = %bb275
  %i286 = getelementptr inbounds i8, ptr %i236, i64 5
  %i287 = getelementptr inbounds i8, ptr %i236, i64 6
  %i288 = load i8, ptr %i286, align 1, !tbaa !22
  %i289 = zext i8 %i288 to i64
  %i290 = sub nsw i64 0, %i289
  %i291 = getelementptr inbounds i8, ptr %i61, i64 %i290
  %i292 = load i8, ptr %i291, align 1, !tbaa !22
  %i293 = zext i8 %i292 to i32
  %i294 = add nuw nsw i32 %i283, %i293
  %i295 = icmp slt i32 %i294, %arg3
  br i1 %i295, label %bb296, label %bb285.bb593_crit_edge

bb285.bb593_crit_edge:                            ; preds = %bb285
  br label %bb593

bb296:                                            ; preds = %bb285
  %i297 = load i8, ptr %i287, align 1, !tbaa !22
  %i298 = zext i8 %i297 to i64
  %i299 = sub nsw i64 0, %i298
  %i300 = getelementptr inbounds i8, ptr %i61, i64 %i299
  %i301 = load i8, ptr %i300, align 1, !tbaa !22
  %i302 = zext i8 %i301 to i32
  %i303 = add nuw nsw i32 %i294, %i302
  %i304 = icmp slt i32 %i303, %arg3
  br i1 %i304, label %bb305, label %bb296.bb593_crit_edge

bb296.bb593_crit_edge:                            ; preds = %bb296
  br label %bb593

bb305:                                            ; preds = %bb296
  %i306 = getelementptr inbounds i8, ptr %i287, i64 %i18
  %i307 = load i8, ptr %i306, align 1, !tbaa !22
  %i308 = zext i8 %i307 to i64
  %i309 = sub nsw i64 0, %i308
  %i310 = getelementptr inbounds i8, ptr %i61, i64 %i309
  %i311 = load i8, ptr %i310, align 1, !tbaa !22
  %i312 = zext i8 %i311 to i32
  %i313 = add nuw nsw i32 %i303, %i312
  %i314 = icmp slt i32 %i313, %arg3
  br i1 %i314, label %bb315, label %bb305.bb593_crit_edge

bb305.bb593_crit_edge:                            ; preds = %bb305
  br label %bb593

bb315:                                            ; preds = %bb305
  %i316 = getelementptr inbounds i8, ptr %i306, i64 1
  %i317 = load i8, ptr %i316, align 1, !tbaa !22
  %i318 = zext i8 %i317 to i64
  %i319 = sub nsw i64 0, %i318
  %i320 = getelementptr inbounds i8, ptr %i61, i64 %i319
  %i321 = load i8, ptr %i320, align 1, !tbaa !22
  %i322 = zext i8 %i321 to i32
  %i323 = add nuw nsw i32 %i313, %i322
  %i324 = icmp slt i32 %i323, %arg3
  br i1 %i324, label %bb325, label %bb315.bb593_crit_edge

bb315.bb593_crit_edge:                            ; preds = %bb315
  br label %bb593

bb325:                                            ; preds = %bb315
  %i326 = getelementptr inbounds i8, ptr %i306, i64 2
  %i327 = load i8, ptr %i326, align 1, !tbaa !22
  %i328 = zext i8 %i327 to i64
  %i329 = sub nsw i64 0, %i328
  %i330 = getelementptr inbounds i8, ptr %i61, i64 %i329
  %i331 = load i8, ptr %i330, align 1, !tbaa !22
  %i332 = zext i8 %i331 to i32
  %i333 = add nuw nsw i32 %i323, %i332
  %i334 = icmp slt i32 %i333, %arg3
  br i1 %i334, label %bb335, label %bb325.bb593_crit_edge

bb325.bb593_crit_edge:                            ; preds = %bb325
  br label %bb593

bb335:                                            ; preds = %bb325
  %i336 = getelementptr inbounds i8, ptr %i306, i64 3
  %i337 = getelementptr inbounds i8, ptr %i306, i64 4
  %i338 = load i8, ptr %i336, align 1, !tbaa !22
  %i339 = zext i8 %i338 to i64
  %i340 = sub nsw i64 0, %i339
  %i341 = getelementptr inbounds i8, ptr %i61, i64 %i340
  %i342 = load i8, ptr %i341, align 1, !tbaa !22
  %i343 = zext i8 %i342 to i32
  %i344 = add nuw nsw i32 %i333, %i343
  %i345 = icmp slt i32 %i344, %arg3
  br i1 %i345, label %bb346, label %bb335.bb593_crit_edge

bb335.bb593_crit_edge:                            ; preds = %bb335
  br label %bb593

bb346:                                            ; preds = %bb335
  %i347 = load i8, ptr %i337, align 1, !tbaa !22
  %i348 = zext i8 %i347 to i64
  %i349 = sub nsw i64 0, %i348
  %i350 = getelementptr inbounds i8, ptr %i61, i64 %i349
  %i351 = load i8, ptr %i350, align 1, !tbaa !22
  %i352 = zext i8 %i351 to i32
  %i353 = add nuw nsw i32 %i344, %i352
  %i354 = icmp slt i32 %i353, %arg3
  br i1 %i354, label %bb355, label %bb346.bb593_crit_edge

bb346.bb593_crit_edge:                            ; preds = %bb346
  br label %bb593

bb355:                                            ; preds = %bb346
  %i356 = getelementptr inbounds i8, ptr %i337, i64 %i17
  %i357 = load i8, ptr %i356, align 1, !tbaa !22
  %i358 = zext i8 %i357 to i64
  %i359 = sub nsw i64 0, %i358
  %i360 = getelementptr inbounds i8, ptr %i61, i64 %i359
  %i361 = load i8, ptr %i360, align 1, !tbaa !22
  %i362 = zext i8 %i361 to i32
  %i363 = add nuw nsw i32 %i353, %i362
  %i364 = icmp slt i32 %i363, %arg3
  br i1 %i364, label %bb365, label %bb355.bb593_crit_edge

bb355.bb593_crit_edge:                            ; preds = %bb355
  br label %bb593

bb365:                                            ; preds = %bb355
  %i366 = getelementptr inbounds i8, ptr %i356, i64 1
  %i367 = load i8, ptr %i366, align 1, !tbaa !22
  %i368 = zext i8 %i367 to i64
  %i369 = sub nsw i64 0, %i368
  %i370 = getelementptr inbounds i8, ptr %i61, i64 %i369
  %i371 = load i8, ptr %i370, align 1, !tbaa !22
  %i372 = zext i8 %i371 to i32
  %i373 = add nuw nsw i32 %i363, %i372
  %i374 = icmp slt i32 %i373, %arg3
  br i1 %i374, label %bb375, label %bb365.bb593_crit_edge

bb365.bb593_crit_edge:                            ; preds = %bb365
  br label %bb593

bb375:                                            ; preds = %bb365
  %i376 = getelementptr inbounds i8, ptr %i356, i64 2
  %i377 = load i8, ptr %i376, align 1, !tbaa !22
  %i378 = zext i8 %i377 to i64
  %i379 = sub nsw i64 0, %i378
  %i380 = getelementptr inbounds i8, ptr %i61, i64 %i379
  %i381 = load i8, ptr %i380, align 1, !tbaa !22
  %i382 = zext i8 %i381 to i32
  %i383 = add nuw nsw i32 %i373, %i382
  %i384 = icmp slt i32 %i383, %arg3
  br i1 %i384, label %bb385, label %bb375.bb593_crit_edge

bb375.bb593_crit_edge:                            ; preds = %bb375
  br label %bb593

bb385:                                            ; preds = %bb375
  %i386 = add nuw nsw i32 %i75, %i67
  %i387 = add nuw nsw i32 %i386, %i82
  %i388 = add nuw nsw i32 %i99, %i91
  %i389 = add nuw nsw i32 %i388, %i107
  %i390 = add nuw nsw i32 %i389, %i115
  %i391 = add nuw nsw i32 %i390, %i122
  %i392 = shl nuw nsw i32 %i312, 1
  %i393 = shl nuw nsw i32 %i352, 1
  %i394 = add nuw nsw i32 %i131, %i187
  %i395 = add nuw nsw i32 %i178, %i232
  %i396 = add nuw nsw i32 %i394, %i242
  %i397 = sub nsw i32 %i395, %i396
  %i398 = add nsw i32 %i397, %i302
  %i399 = mul nsw i32 %i398, 3
  %i400 = add nuw nsw i32 %i91, %i139
  %i401 = add nuw nsw i32 %i122, %i171
  %i402 = add nuw nsw i32 %i400, %i195
  %i403 = add nuw nsw i32 %i401, %i223
  %i404 = add nuw nsw i32 %i402, %i252
  %i405 = sub nsw i32 %i403, %i404
  %i406 = add nsw i32 %i405, %i293
  %i407 = shl nsw i32 %i406, 1
  %i408 = add nuw nsw i32 %i67, %i99
  %i409 = add nuw nsw i32 %i82, %i115
  %i410 = add nuw nsw i32 %i408, %i147
  %i411 = add nuw nsw i32 %i409, %i163
  %i412 = add nuw nsw i32 %i410, %i202
  %i413 = add nuw nsw i32 %i411, %i212
  %i414 = add nuw nsw i32 %i412, %i262
  %i415 = sub nsw i32 %i413, %i414
  %i416 = add nsw i32 %i415, %i282
  %i417 = add i32 %i416, %i407
  %i418 = add i32 %i417, %i399
  %i419 = add nuw nsw i32 %i392, %i322
  %i420 = sub i32 %i418, %i419
  %i421 = add i32 %i420, %i343
  %i422 = add i32 %i421, %i393
  %i423 = sub i32 %i422, %i362
  %i424 = add i32 %i423, %i382
  %i425 = sub nsw i32 %i362, %i387
  %i426 = add nsw i32 %i425, %i372
  %i427 = add nsw i32 %i426, %i382
  %i428 = mul nsw i32 %i427, 3
  %i429 = sub nsw i32 %i322, %i391
  %i430 = add nsw i32 %i429, %i332
  %i431 = add nsw i32 %i430, %i343
  %i432 = shl nsw i32 %i431, 1
  %i433 = add nuw nsw i32 %i139, %i131
  %i434 = add nuw nsw i32 %i433, %i147
  %i435 = add nuw nsw i32 %i434, %i155
  %i436 = add nuw nsw i32 %i435, %i163
  %i437 = add nuw nsw i32 %i436, %i171
  %i438 = add nuw nsw i32 %i437, %i178
  %i439 = sub nsw i32 %i242, %i438
  %i440 = add nsw i32 %i439, %i252
  %i441 = add nsw i32 %i440, %i262
  %i442 = add nsw i32 %i441, %i272
  %i443 = add nsw i32 %i442, %i282
  %i444 = add nsw i32 %i443, %i293
  %i445 = add nsw i32 %i444, %i302
  %i446 = add nsw i32 %i445, %i392
  %i447 = add i32 %i446, %i432
  %i448 = add i32 %i447, %i393
  %i449 = add i32 %i448, %i428
  %i450 = mul nsw i32 %i424, %i424
  %i451 = mul nsw i32 %i449, %i449
  %i452 = add nuw nsw i32 %i451, %i450
  %i453 = mul nuw nsw i32 %i383, %i383
  %i454 = lshr i32 %i453, 1
  %i455 = icmp ugt i32 %i452, %i454
  br i1 %i455, label %bb456, label %bb385.bb593_crit_edge

bb385.bb593_crit_edge:                            ; preds = %bb385
  br label %bb593

bb456:                                            ; preds = %bb385
  %i457 = icmp ult i32 %i451, %i450
  %i458 = trunc i64 %i54 to i32
  br i1 %i457, label %bb459, label %bb515

bb459:                                            ; preds = %bb456
  %i460 = sitofp i32 %i449 to float
  %i461 = tail call i32 @llvm.abs.i32(i32 %i424, i1 true)
  %i462 = sitofp i32 %i461 to float
  %i463 = fdiv float %i460, %i462
  %i464 = sdiv i32 %i461, %i424
  %i465 = fcmp olt float %i463, 0.000000e+00
  %i466 = fpext float %i463 to double
  %i467 = select i1 %i465, double -5.000000e-01, double 5.000000e-01
  %i468 = fadd double %i467, %i466
  %i469 = fptosi double %i468 to i32
  %i470 = add nsw i32 %i36, %i469
  %i471 = mul nsw i32 %i470, %arg5
  %i472 = add nsw i32 %i471, %i458
  %i473 = add nsw i32 %i472, %i464
  %i474 = sext i32 %i473 to i64
  %i475 = getelementptr inbounds i8, ptr %arg, i64 %i474
  %i476 = load i8, ptr %i475, align 1, !tbaa !22
  %i477 = zext i8 %i476 to i64
  %i478 = sub nsw i64 0, %i477
  %i479 = getelementptr inbounds i8, ptr %i61, i64 %i478
  %i480 = load i8, ptr %i479, align 1, !tbaa !22
  %i481 = zext i8 %i480 to i32
  %i482 = fmul float %i463, 2.000000e+00
  %i483 = fcmp olt float %i482, 0.000000e+00
  %i484 = fpext float %i482 to double
  %i485 = select i1 %i483, double -5.000000e-01, double 5.000000e-01
  %i486 = fadd double %i485, %i484
  %i487 = fptosi double %i486 to i32
  %i488 = add nsw i32 %i37, %i487
  %i489 = mul nsw i32 %i488, %arg5
  %i490 = trunc i64 %i54 to i32
  %i491 = add nsw i32 %i489, %i490
  %i492 = shl nsw i32 %i464, 1
  %i493 = add nsw i32 %i491, %i492
  %i494 = sext i32 %i493 to i64
  %i495 = getelementptr inbounds i8, ptr %arg, i64 %i494
  %i496 = load i8, ptr %i495, align 1, !tbaa !22
  %i497 = zext i8 %i496 to i64
  %i498 = sub nsw i64 0, %i497
  %i499 = getelementptr inbounds i8, ptr %i61, i64 %i498
  %i500 = load i8, ptr %i499, align 1, !tbaa !22
  %i501 = zext i8 %i500 to i32
  %i502 = add nuw nsw i32 %i501, %i481
  %i503 = fmul float %i463, 3.000000e+00
  %i504 = fcmp olt float %i503, 0.000000e+00
  %i505 = fpext float %i503 to double
  %i506 = select i1 %i504, double -5.000000e-01, double 5.000000e-01
  %i507 = fadd double %i506, %i505
  %i508 = fptosi double %i507 to i32
  %i509 = add nsw i32 %i38, %i508
  %i510 = mul nsw i32 %i509, %arg5
  %i511 = trunc i64 %i54 to i32
  %i512 = add nsw i32 %i510, %i511
  %i513 = mul nsw i32 %i464, 3
  %i514 = add nsw i32 %i512, %i513
  br label %bb571

bb515:                                            ; preds = %bb456
  %i516 = sitofp i32 %i424 to float
  %i517 = tail call i32 @llvm.abs.i32(i32 %i449, i1 true)
  %i518 = sitofp i32 %i517 to float
  %i519 = fdiv float %i516, %i518
  %i520 = sdiv i32 %i517, %i449
  %i521 = add nsw i32 %i520, %i33
  %i522 = mul nsw i32 %i521, %arg5
  %i523 = fcmp olt float %i519, 0.000000e+00
  %i524 = fpext float %i519 to double
  %i525 = select i1 %i523, double -5.000000e-01, double 5.000000e-01
  %i526 = fadd double %i525, %i524
  %i527 = fptosi double %i526 to i32
  %i528 = add i32 %i458, %i527
  %i529 = add i32 %i528, %i522
  %i530 = sext i32 %i529 to i64
  %i531 = getelementptr inbounds i8, ptr %arg, i64 %i530
  %i532 = load i8, ptr %i531, align 1, !tbaa !22
  %i533 = zext i8 %i532 to i64
  %i534 = sub nsw i64 0, %i533
  %i535 = getelementptr inbounds i8, ptr %i61, i64 %i534
  %i536 = load i8, ptr %i535, align 1, !tbaa !22
  %i537 = zext i8 %i536 to i32
  %i538 = shl nsw i32 %i520, 1
  %i539 = add nsw i32 %i538, %i34
  %i540 = mul nsw i32 %i539, %arg5
  %i541 = fmul float %i519, 2.000000e+00
  %i542 = fcmp olt float %i541, 0.000000e+00
  %i543 = fpext float %i541 to double
  %i544 = select i1 %i542, double -5.000000e-01, double 5.000000e-01
  %i545 = fadd double %i544, %i543
  %i546 = fptosi double %i545 to i32
  %i547 = trunc i64 %i54 to i32
  %i548 = add i32 %i547, %i546
  %i549 = add i32 %i548, %i540
  %i550 = sext i32 %i549 to i64
  %i551 = getelementptr inbounds i8, ptr %arg, i64 %i550
  %i552 = load i8, ptr %i551, align 1, !tbaa !22
  %i553 = zext i8 %i552 to i64
  %i554 = sub nsw i64 0, %i553
  %i555 = getelementptr inbounds i8, ptr %i61, i64 %i554
  %i556 = load i8, ptr %i555, align 1, !tbaa !22
  %i557 = zext i8 %i556 to i32
  %i558 = add nuw nsw i32 %i557, %i537
  %i559 = mul nsw i32 %i520, 3
  %i560 = add nsw i32 %i559, %i35
  %i561 = mul nsw i32 %i560, %arg5
  %i562 = fmul float %i519, 3.000000e+00
  %i563 = fcmp olt float %i562, 0.000000e+00
  %i564 = fpext float %i562 to double
  %i565 = select i1 %i563, double -5.000000e-01, double 5.000000e-01
  %i566 = fadd double %i565, %i564
  %i567 = fptosi double %i566 to i32
  %i568 = trunc i64 %i54 to i32
  %i569 = add i32 %i568, %i567
  %i570 = add i32 %i569, %i561
  br label %bb571

bb571:                                            ; preds = %bb515, %bb459
  %i572 = phi i32 [ %i570, %bb515 ], [ %i514, %bb459 ]
  %i573 = phi i32 [ %i558, %bb515 ], [ %i502, %bb459 ]
  %i574 = sext i32 %i572 to i64
  %i575 = getelementptr inbounds i8, ptr %arg, i64 %i574
  %i576 = load i8, ptr %i575, align 1, !tbaa !22
  %i577 = zext i8 %i576 to i64
  %i578 = sub nsw i64 0, %i577
  %i579 = getelementptr inbounds i8, ptr %i61, i64 %i578
  %i580 = load i8, ptr %i579, align 1, !tbaa !22
  %i581 = zext i8 %i580 to i32
  %i582 = add nuw nsw i32 %i573, %i581
  %i583 = icmp sgt i32 %i582, 290
  br i1 %i583, label %bb584, label %bb571.bb593_crit_edge

bb571.bb593_crit_edge:                            ; preds = %bb571
  br label %bb593

bb584:                                            ; preds = %bb571
  %i585 = sub nsw i32 %arg3, %i383
  %i586 = getelementptr inbounds i32, ptr %arg1, i64 %i57
  store i32 %i585, ptr %i586, align 4, !tbaa !19
  %i587 = mul nsw i32 %i424, 51
  %i588 = sdiv i32 %i587, %i383
  %i589 = getelementptr inbounds i32, ptr %i9, i64 %i57
  store i32 %i588, ptr %i589, align 4, !tbaa !19
  %i590 = mul nsw i32 %i449, 51
  %i591 = sdiv i32 %i590, %i383
  %i592 = getelementptr inbounds i32, ptr %i10, i64 %i57
  store i32 %i591, ptr %i592, align 4, !tbaa !19
  br label %bb593

bb593:                                            ; preds = %bb571.bb593_crit_edge, %bb385.bb593_crit_edge, %bb375.bb593_crit_edge, %bb365.bb593_crit_edge, %bb355.bb593_crit_edge, %bb346.bb593_crit_edge, %bb335.bb593_crit_edge, %bb325.bb593_crit_edge, %bb315.bb593_crit_edge, %bb305.bb593_crit_edge, %bb296.bb593_crit_edge, %bb285.bb593_crit_edge, %bb275.bb593_crit_edge, %bb265.bb593_crit_edge, %bb255.bb593_crit_edge, %bb245.bb593_crit_edge, %bb235.bb593_crit_edge, %bb226.bb593_crit_edge, %bb215.bb593_crit_edge, %bb205.bb593_crit_edge, %bb53.bb593_crit_edge, %bb584
  %i594 = add nuw nsw i64 %i54, 1
  %i595 = icmp eq i64 %i594, %i23
  br i1 %i595, label %bb596.loopexit, label %bb593.bb53_crit_edge, !llvm.loop !62

bb593.bb53_crit_edge:                             ; preds = %bb593
  br label %bb53

bb596.loopexit:                                   ; preds = %bb593
  br label %bb596

bb596:                                            ; preds = %bb24.bb596_crit_edge, %bb596.loopexit
  %i597 = add nuw nsw i64 %i25, 1
  %i598 = icmp eq i64 %i597, %i22
  br i1 %i598, label %bb39.loopexit, label %bb596.bb24_crit_edge, !llvm.loop !63

bb596.bb24_crit_edge:                             ; preds = %bb596
  br label %bb24

bb599:                                            ; preds = %bb847.bb599_crit_edge, %bb41
  %i600 = phi i64 [ 5, %bb41 ], [ %i849, %bb847.bb599_crit_edge ]
  %i601 = phi i32 [ 0, %bb41 ], [ %i848, %bb847.bb599_crit_edge ]
  br i1 %i43, label %bb602, label %bb599.bb847_crit_edge

bb599.bb847_crit_edge:                            ; preds = %bb599
  br label %bb847

bb602:                                            ; preds = %bb599
  %i603 = mul nsw i64 %i600, %i47
  %i604 = add nsw i64 %i600, -3
  %i605 = mul nsw i64 %i604, %i46
  %i606 = add nsw i64 %i600, -2
  %i607 = mul nsw i64 %i606, %i45
  %i608 = add nsw i64 %i600, -1
  %i609 = mul nsw i64 %i608, %i44
  %i610 = add nuw nsw i64 %i600, 1
  %i611 = mul nsw i64 %i610, %i48
  %i612 = add nuw nsw i64 %i600, 2
  %i613 = mul nsw i64 %i612, %i49
  %i614 = add nuw nsw i64 %i600, 3
  %i615 = mul nsw i64 %i614, %i50
  %i616 = getelementptr i32, ptr %arg1, i64 %i605
  %i617 = getelementptr i32, ptr %arg1, i64 %i607
  %i618 = getelementptr i32, ptr %arg1, i64 %i609
  %i619 = getelementptr i32, ptr %arg1, i64 %i611
  %i620 = getelementptr i32, ptr %arg1, i64 %i613
  %i621 = getelementptr i32, ptr %arg1, i64 %i615
  %i622 = trunc i64 %i600 to i32
  br label %bb623

bb623:                                            ; preds = %bb843.bb623_crit_edge, %bb602
  %i624 = phi i64 [ 5, %bb602 ], [ %i845, %bb843.bb623_crit_edge ]
  %i625 = phi i32 [ %i601, %bb602 ], [ %i844, %bb843.bb623_crit_edge ]
  %i626 = add nuw nsw i64 %i624, %i603
  %i627 = getelementptr inbounds i32, ptr %arg1, i64 %i626
  %i628 = load i32, ptr %i627, align 4, !tbaa !19
  %i629 = icmp sgt i32 %i628, 0
  br i1 %i629, label %bb630, label %bb623.bb843_crit_edge

bb623.bb843_crit_edge:                            ; preds = %bb623
  br label %bb843

bb630:                                            ; preds = %bb623
  %i631 = getelementptr i32, ptr %i616, i64 %i624
  %i632 = getelementptr i32, ptr %i631, i64 -3
  %i633 = load i32, ptr %i632, align 4, !tbaa !19
  %i634 = icmp sgt i32 %i628, %i633
  br i1 %i634, label %bb635, label %bb630.bb843_crit_edge

bb630.bb843_crit_edge:                            ; preds = %bb630
  br label %bb843

bb635:                                            ; preds = %bb630
  %i636 = getelementptr i32, ptr %i631, i64 -2
  %i637 = load i32, ptr %i636, align 4, !tbaa !19
  %i638 = icmp sgt i32 %i628, %i637
  br i1 %i638, label %bb639, label %bb635.bb843_crit_edge

bb635.bb843_crit_edge:                            ; preds = %bb635
  br label %bb843

bb639:                                            ; preds = %bb635
  %i640 = getelementptr i32, ptr %i631, i64 -1
  %i641 = load i32, ptr %i640, align 4, !tbaa !19
  %i642 = icmp sgt i32 %i628, %i641
  br i1 %i642, label %bb643, label %bb639.bb843_crit_edge

bb639.bb843_crit_edge:                            ; preds = %bb639
  br label %bb843

bb643:                                            ; preds = %bb639
  %i644 = load i32, ptr %i631, align 4, !tbaa !19
  %i645 = icmp sgt i32 %i628, %i644
  br i1 %i645, label %bb646, label %bb643.bb843_crit_edge

bb643.bb843_crit_edge:                            ; preds = %bb643
  br label %bb843

bb646:                                            ; preds = %bb643
  %i647 = getelementptr i32, ptr %i631, i64 1
  %i648 = load i32, ptr %i647, align 4, !tbaa !19
  %i649 = icmp sgt i32 %i628, %i648
  br i1 %i649, label %bb650, label %bb646.bb843_crit_edge

bb646.bb843_crit_edge:                            ; preds = %bb646
  br label %bb843

bb650:                                            ; preds = %bb646
  %i651 = getelementptr i32, ptr %i631, i64 2
  %i652 = load i32, ptr %i651, align 4, !tbaa !19
  %i653 = icmp sgt i32 %i628, %i652
  br i1 %i653, label %bb654, label %bb650.bb843_crit_edge

bb650.bb843_crit_edge:                            ; preds = %bb650
  br label %bb843

bb654:                                            ; preds = %bb650
  %i655 = getelementptr i32, ptr %i631, i64 3
  %i656 = load i32, ptr %i655, align 4, !tbaa !19
  %i657 = icmp sgt i32 %i628, %i656
  br i1 %i657, label %bb658, label %bb654.bb843_crit_edge

bb654.bb843_crit_edge:                            ; preds = %bb654
  br label %bb843

bb658:                                            ; preds = %bb654
  %i659 = getelementptr i32, ptr %i617, i64 %i624
  %i660 = getelementptr i32, ptr %i659, i64 -3
  %i661 = load i32, ptr %i660, align 4, !tbaa !19
  %i662 = icmp sgt i32 %i628, %i661
  br i1 %i662, label %bb663, label %bb658.bb843_crit_edge

bb658.bb843_crit_edge:                            ; preds = %bb658
  br label %bb843

bb663:                                            ; preds = %bb658
  %i664 = getelementptr i32, ptr %i659, i64 -2
  %i665 = load i32, ptr %i664, align 4, !tbaa !19
  %i666 = icmp sgt i32 %i628, %i665
  br i1 %i666, label %bb667, label %bb663.bb843_crit_edge

bb663.bb843_crit_edge:                            ; preds = %bb663
  br label %bb843

bb667:                                            ; preds = %bb663
  %i668 = getelementptr i32, ptr %i659, i64 -1
  %i669 = load i32, ptr %i668, align 4, !tbaa !19
  %i670 = icmp sgt i32 %i628, %i669
  br i1 %i670, label %bb671, label %bb667.bb843_crit_edge

bb667.bb843_crit_edge:                            ; preds = %bb667
  br label %bb843

bb671:                                            ; preds = %bb667
  %i672 = load i32, ptr %i659, align 4, !tbaa !19
  %i673 = icmp sgt i32 %i628, %i672
  br i1 %i673, label %bb674, label %bb671.bb843_crit_edge

bb671.bb843_crit_edge:                            ; preds = %bb671
  br label %bb843

bb674:                                            ; preds = %bb671
  %i675 = getelementptr i32, ptr %i659, i64 1
  %i676 = load i32, ptr %i675, align 4, !tbaa !19
  %i677 = icmp sgt i32 %i628, %i676
  br i1 %i677, label %bb678, label %bb674.bb843_crit_edge

bb674.bb843_crit_edge:                            ; preds = %bb674
  br label %bb843

bb678:                                            ; preds = %bb674
  %i679 = getelementptr i32, ptr %i659, i64 2
  %i680 = load i32, ptr %i679, align 4, !tbaa !19
  %i681 = icmp sgt i32 %i628, %i680
  br i1 %i681, label %bb682, label %bb678.bb843_crit_edge

bb678.bb843_crit_edge:                            ; preds = %bb678
  br label %bb843

bb682:                                            ; preds = %bb678
  %i683 = getelementptr i32, ptr %i659, i64 3
  %i684 = load i32, ptr %i683, align 4, !tbaa !19
  %i685 = icmp sgt i32 %i628, %i684
  br i1 %i685, label %bb686, label %bb682.bb843_crit_edge

bb682.bb843_crit_edge:                            ; preds = %bb682
  br label %bb843

bb686:                                            ; preds = %bb682
  %i687 = getelementptr i32, ptr %i618, i64 %i624
  %i688 = getelementptr i32, ptr %i687, i64 -3
  %i689 = load i32, ptr %i688, align 4, !tbaa !19
  %i690 = icmp sgt i32 %i628, %i689
  br i1 %i690, label %bb691, label %bb686.bb843_crit_edge

bb686.bb843_crit_edge:                            ; preds = %bb686
  br label %bb843

bb691:                                            ; preds = %bb686
  %i692 = getelementptr i32, ptr %i687, i64 -2
  %i693 = load i32, ptr %i692, align 4, !tbaa !19
  %i694 = icmp sgt i32 %i628, %i693
  br i1 %i694, label %bb695, label %bb691.bb843_crit_edge

bb691.bb843_crit_edge:                            ; preds = %bb691
  br label %bb843

bb695:                                            ; preds = %bb691
  %i696 = getelementptr i32, ptr %i687, i64 -1
  %i697 = load i32, ptr %i696, align 4, !tbaa !19
  %i698 = icmp sgt i32 %i628, %i697
  br i1 %i698, label %bb699, label %bb695.bb843_crit_edge

bb695.bb843_crit_edge:                            ; preds = %bb695
  br label %bb843

bb699:                                            ; preds = %bb695
  %i700 = load i32, ptr %i687, align 4, !tbaa !19
  %i701 = icmp sgt i32 %i628, %i700
  br i1 %i701, label %bb702, label %bb699.bb843_crit_edge

bb699.bb843_crit_edge:                            ; preds = %bb699
  br label %bb843

bb702:                                            ; preds = %bb699
  %i703 = getelementptr i32, ptr %i687, i64 1
  %i704 = load i32, ptr %i703, align 4, !tbaa !19
  %i705 = icmp sgt i32 %i628, %i704
  br i1 %i705, label %bb706, label %bb702.bb843_crit_edge

bb702.bb843_crit_edge:                            ; preds = %bb702
  br label %bb843

bb706:                                            ; preds = %bb702
  %i707 = getelementptr i32, ptr %i687, i64 2
  %i708 = load i32, ptr %i707, align 4, !tbaa !19
  %i709 = icmp sgt i32 %i628, %i708
  br i1 %i709, label %bb710, label %bb706.bb843_crit_edge

bb706.bb843_crit_edge:                            ; preds = %bb706
  br label %bb843

bb710:                                            ; preds = %bb706
  %i711 = getelementptr i32, ptr %i687, i64 3
  %i712 = load i32, ptr %i711, align 4, !tbaa !19
  %i713 = icmp sgt i32 %i628, %i712
  br i1 %i713, label %bb714, label %bb710.bb843_crit_edge

bb710.bb843_crit_edge:                            ; preds = %bb710
  br label %bb843

bb714:                                            ; preds = %bb710
  %i715 = getelementptr i32, ptr %i627, i64 -3
  %i716 = load i32, ptr %i715, align 4, !tbaa !19
  %i717 = icmp sgt i32 %i628, %i716
  br i1 %i717, label %bb718, label %bb714.bb843_crit_edge

bb714.bb843_crit_edge:                            ; preds = %bb714
  br label %bb843

bb718:                                            ; preds = %bb714
  %i719 = getelementptr i32, ptr %i627, i64 -2
  %i720 = load i32, ptr %i719, align 4, !tbaa !19
  %i721 = icmp sgt i32 %i628, %i720
  br i1 %i721, label %bb722, label %bb718.bb843_crit_edge

bb718.bb843_crit_edge:                            ; preds = %bb718
  br label %bb843

bb722:                                            ; preds = %bb718
  %i723 = getelementptr i32, ptr %i627, i64 -1
  %i724 = load i32, ptr %i723, align 4, !tbaa !19
  %i725 = icmp sgt i32 %i628, %i724
  br i1 %i725, label %bb726, label %bb722.bb843_crit_edge

bb722.bb843_crit_edge:                            ; preds = %bb722
  br label %bb843

bb726:                                            ; preds = %bb722
  %i727 = getelementptr i32, ptr %i627, i64 1
  %i728 = load i32, ptr %i727, align 4, !tbaa !19
  %i729 = icmp slt i32 %i628, %i728
  br i1 %i729, label %bb726.bb843_crit_edge, label %bb730

bb726.bb843_crit_edge:                            ; preds = %bb726
  br label %bb843

bb730:                                            ; preds = %bb726
  %i731 = getelementptr i32, ptr %i627, i64 2
  %i732 = load i32, ptr %i731, align 4, !tbaa !19
  %i733 = icmp slt i32 %i628, %i732
  br i1 %i733, label %bb730.bb843_crit_edge, label %bb734

bb730.bb843_crit_edge:                            ; preds = %bb730
  br label %bb843

bb734:                                            ; preds = %bb730
  %i735 = getelementptr i32, ptr %i627, i64 3
  %i736 = load i32, ptr %i735, align 4, !tbaa !19
  %i737 = icmp slt i32 %i628, %i736
  br i1 %i737, label %bb734.bb843_crit_edge, label %bb738

bb734.bb843_crit_edge:                            ; preds = %bb734
  br label %bb843

bb738:                                            ; preds = %bb734
  %i739 = getelementptr i32, ptr %i619, i64 %i624
  %i740 = getelementptr i32, ptr %i739, i64 -3
  %i741 = load i32, ptr %i740, align 4, !tbaa !19
  %i742 = icmp slt i32 %i628, %i741
  br i1 %i742, label %bb738.bb843_crit_edge, label %bb743

bb738.bb843_crit_edge:                            ; preds = %bb738
  br label %bb843

bb743:                                            ; preds = %bb738
  %i744 = getelementptr i32, ptr %i739, i64 -2
  %i745 = load i32, ptr %i744, align 4, !tbaa !19
  %i746 = icmp slt i32 %i628, %i745
  br i1 %i746, label %bb743.bb843_crit_edge, label %bb747

bb743.bb843_crit_edge:                            ; preds = %bb743
  br label %bb843

bb747:                                            ; preds = %bb743
  %i748 = getelementptr i32, ptr %i739, i64 -1
  %i749 = load i32, ptr %i748, align 4, !tbaa !19
  %i750 = icmp slt i32 %i628, %i749
  br i1 %i750, label %bb747.bb843_crit_edge, label %bb751

bb747.bb843_crit_edge:                            ; preds = %bb747
  br label %bb843

bb751:                                            ; preds = %bb747
  %i752 = load i32, ptr %i739, align 4, !tbaa !19
  %i753 = icmp slt i32 %i628, %i752
  br i1 %i753, label %bb751.bb843_crit_edge, label %bb754

bb751.bb843_crit_edge:                            ; preds = %bb751
  br label %bb843

bb754:                                            ; preds = %bb751
  %i755 = getelementptr i32, ptr %i739, i64 1
  %i756 = load i32, ptr %i755, align 4, !tbaa !19
  %i757 = icmp slt i32 %i628, %i756
  br i1 %i757, label %bb754.bb843_crit_edge, label %bb758

bb754.bb843_crit_edge:                            ; preds = %bb754
  br label %bb843

bb758:                                            ; preds = %bb754
  %i759 = getelementptr i32, ptr %i739, i64 2
  %i760 = load i32, ptr %i759, align 4, !tbaa !19
  %i761 = icmp slt i32 %i628, %i760
  br i1 %i761, label %bb758.bb843_crit_edge, label %bb762

bb758.bb843_crit_edge:                            ; preds = %bb758
  br label %bb843

bb762:                                            ; preds = %bb758
  %i763 = getelementptr i32, ptr %i739, i64 3
  %i764 = load i32, ptr %i763, align 4, !tbaa !19
  %i765 = icmp slt i32 %i628, %i764
  br i1 %i765, label %bb762.bb843_crit_edge, label %bb766

bb762.bb843_crit_edge:                            ; preds = %bb762
  br label %bb843

bb766:                                            ; preds = %bb762
  %i767 = getelementptr i32, ptr %i620, i64 %i624
  %i768 = getelementptr i32, ptr %i767, i64 -3
  %i769 = load i32, ptr %i768, align 4, !tbaa !19
  %i770 = icmp slt i32 %i628, %i769
  br i1 %i770, label %bb766.bb843_crit_edge, label %bb771

bb766.bb843_crit_edge:                            ; preds = %bb766
  br label %bb843

bb771:                                            ; preds = %bb766
  %i772 = getelementptr i32, ptr %i767, i64 -2
  %i773 = load i32, ptr %i772, align 4, !tbaa !19
  %i774 = icmp slt i32 %i628, %i773
  br i1 %i774, label %bb771.bb843_crit_edge, label %bb775

bb771.bb843_crit_edge:                            ; preds = %bb771
  br label %bb843

bb775:                                            ; preds = %bb771
  %i776 = getelementptr i32, ptr %i767, i64 -1
  %i777 = load i32, ptr %i776, align 4, !tbaa !19
  %i778 = icmp slt i32 %i628, %i777
  br i1 %i778, label %bb775.bb843_crit_edge, label %bb779

bb775.bb843_crit_edge:                            ; preds = %bb775
  br label %bb843

bb779:                                            ; preds = %bb775
  %i780 = load i32, ptr %i767, align 4, !tbaa !19
  %i781 = icmp slt i32 %i628, %i780
  br i1 %i781, label %bb779.bb843_crit_edge, label %bb782

bb779.bb843_crit_edge:                            ; preds = %bb779
  br label %bb843

bb782:                                            ; preds = %bb779
  %i783 = getelementptr i32, ptr %i767, i64 1
  %i784 = load i32, ptr %i783, align 4, !tbaa !19
  %i785 = icmp slt i32 %i628, %i784
  br i1 %i785, label %bb782.bb843_crit_edge, label %bb786

bb782.bb843_crit_edge:                            ; preds = %bb782
  br label %bb843

bb786:                                            ; preds = %bb782
  %i787 = getelementptr i32, ptr %i767, i64 2
  %i788 = load i32, ptr %i787, align 4, !tbaa !19
  %i789 = icmp slt i32 %i628, %i788
  br i1 %i789, label %bb786.bb843_crit_edge, label %bb790

bb786.bb843_crit_edge:                            ; preds = %bb786
  br label %bb843

bb790:                                            ; preds = %bb786
  %i791 = getelementptr i32, ptr %i767, i64 3
  %i792 = load i32, ptr %i791, align 4, !tbaa !19
  %i793 = icmp slt i32 %i628, %i792
  br i1 %i793, label %bb790.bb843_crit_edge, label %bb794

bb790.bb843_crit_edge:                            ; preds = %bb790
  br label %bb843

bb794:                                            ; preds = %bb790
  %i795 = getelementptr i32, ptr %i621, i64 %i624
  %i796 = getelementptr i32, ptr %i795, i64 -3
  %i797 = load i32, ptr %i796, align 4, !tbaa !19
  %i798 = icmp slt i32 %i628, %i797
  br i1 %i798, label %bb794.bb843_crit_edge, label %bb799

bb794.bb843_crit_edge:                            ; preds = %bb794
  br label %bb843

bb799:                                            ; preds = %bb794
  %i800 = getelementptr i32, ptr %i795, i64 -2
  %i801 = load i32, ptr %i800, align 4, !tbaa !19
  %i802 = icmp slt i32 %i628, %i801
  br i1 %i802, label %bb799.bb843_crit_edge, label %bb803

bb799.bb843_crit_edge:                            ; preds = %bb799
  br label %bb843

bb803:                                            ; preds = %bb799
  %i804 = getelementptr i32, ptr %i795, i64 -1
  %i805 = load i32, ptr %i804, align 4, !tbaa !19
  %i806 = icmp slt i32 %i628, %i805
  br i1 %i806, label %bb803.bb843_crit_edge, label %bb807

bb803.bb843_crit_edge:                            ; preds = %bb803
  br label %bb843

bb807:                                            ; preds = %bb803
  %i808 = load i32, ptr %i795, align 4, !tbaa !19
  %i809 = icmp slt i32 %i628, %i808
  br i1 %i809, label %bb807.bb843_crit_edge, label %bb810

bb807.bb843_crit_edge:                            ; preds = %bb807
  br label %bb843

bb810:                                            ; preds = %bb807
  %i811 = getelementptr i32, ptr %i795, i64 1
  %i812 = load i32, ptr %i811, align 4, !tbaa !19
  %i813 = icmp slt i32 %i628, %i812
  br i1 %i813, label %bb810.bb843_crit_edge, label %bb814

bb810.bb843_crit_edge:                            ; preds = %bb810
  br label %bb843

bb814:                                            ; preds = %bb810
  %i815 = getelementptr i32, ptr %i795, i64 2
  %i816 = load i32, ptr %i815, align 4, !tbaa !19
  %i817 = icmp slt i32 %i628, %i816
  br i1 %i817, label %bb814.bb843_crit_edge, label %bb818

bb814.bb843_crit_edge:                            ; preds = %bb814
  br label %bb843

bb818:                                            ; preds = %bb814
  %i819 = getelementptr i32, ptr %i795, i64 3
  %i820 = load i32, ptr %i819, align 4, !tbaa !19
  %i821 = icmp slt i32 %i628, %i820
  br i1 %i821, label %bb818.bb843_crit_edge, label %bb822

bb818.bb843_crit_edge:                            ; preds = %bb818
  br label %bb843

bb822:                                            ; preds = %bb818
  %i823 = sext i32 %i625 to i64
  %i824 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i823
  %i825 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i823, i32 2
  store i32 0, ptr %i825, align 4, !tbaa !57
  %i826 = trunc i64 %i624 to i32
  store i32 %i826, ptr %i824, align 4, !tbaa !60
  %i827 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i823, i32 1
  store i32 %i622, ptr %i827, align 4, !tbaa !59
  %i828 = getelementptr inbounds i32, ptr %i9, i64 %i626
  %i829 = load i32, ptr %i828, align 4, !tbaa !19
  %i830 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i823, i32 3
  store i32 %i829, ptr %i830, align 4, !tbaa !64
  %i831 = getelementptr inbounds i32, ptr %i10, i64 %i626
  %i832 = load i32, ptr %i831, align 4, !tbaa !19
  %i833 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i823, i32 4
  store i32 %i832, ptr %i833, align 4, !tbaa !65
  %i834 = getelementptr inbounds i8, ptr %arg, i64 %i626
  %i835 = load i8, ptr %i834, align 1, !tbaa !22
  %i836 = zext i8 %i835 to i32
  %i837 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i823, i32 5
  store i32 %i836, ptr %i837, align 4, !tbaa !66
  %i838 = add nsw i32 %i625, 1
  %i839 = icmp eq i32 %i838, 15000
  br i1 %i839, label %bb840, label %bb822.bb843_crit_edge

bb822.bb843_crit_edge:                            ; preds = %bb822
  br label %bb843

bb840:                                            ; preds = %bb822
  %i841 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i842 = tail call i64 @fwrite(ptr nonnull @.str.29, i64 18, i64 1, ptr %i841) #22
  tail call void @exit(i32 noundef 1) #23
  unreachable

bb843:                                            ; preds = %bb822.bb843_crit_edge, %bb818.bb843_crit_edge, %bb814.bb843_crit_edge, %bb810.bb843_crit_edge, %bb807.bb843_crit_edge, %bb803.bb843_crit_edge, %bb799.bb843_crit_edge, %bb794.bb843_crit_edge, %bb790.bb843_crit_edge, %bb786.bb843_crit_edge, %bb782.bb843_crit_edge, %bb779.bb843_crit_edge, %bb775.bb843_crit_edge, %bb771.bb843_crit_edge, %bb766.bb843_crit_edge, %bb762.bb843_crit_edge, %bb758.bb843_crit_edge, %bb754.bb843_crit_edge, %bb751.bb843_crit_edge, %bb747.bb843_crit_edge, %bb743.bb843_crit_edge, %bb738.bb843_crit_edge, %bb734.bb843_crit_edge, %bb730.bb843_crit_edge, %bb726.bb843_crit_edge, %bb722.bb843_crit_edge, %bb718.bb843_crit_edge, %bb714.bb843_crit_edge, %bb710.bb843_crit_edge, %bb706.bb843_crit_edge, %bb702.bb843_crit_edge, %bb699.bb843_crit_edge, %bb695.bb843_crit_edge, %bb691.bb843_crit_edge, %bb686.bb843_crit_edge, %bb682.bb843_crit_edge, %bb678.bb843_crit_edge, %bb674.bb843_crit_edge, %bb671.bb843_crit_edge, %bb667.bb843_crit_edge, %bb663.bb843_crit_edge, %bb658.bb843_crit_edge, %bb654.bb843_crit_edge, %bb650.bb843_crit_edge, %bb646.bb843_crit_edge, %bb643.bb843_crit_edge, %bb639.bb843_crit_edge, %bb635.bb843_crit_edge, %bb630.bb843_crit_edge, %bb623.bb843_crit_edge
  %i844 = phi i32 [ %i838, %bb822.bb843_crit_edge ], [ %i625, %bb818.bb843_crit_edge ], [ %i625, %bb814.bb843_crit_edge ], [ %i625, %bb810.bb843_crit_edge ], [ %i625, %bb807.bb843_crit_edge ], [ %i625, %bb803.bb843_crit_edge ], [ %i625, %bb799.bb843_crit_edge ], [ %i625, %bb794.bb843_crit_edge ], [ %i625, %bb790.bb843_crit_edge ], [ %i625, %bb786.bb843_crit_edge ], [ %i625, %bb782.bb843_crit_edge ], [ %i625, %bb779.bb843_crit_edge ], [ %i625, %bb775.bb843_crit_edge ], [ %i625, %bb771.bb843_crit_edge ], [ %i625, %bb766.bb843_crit_edge ], [ %i625, %bb762.bb843_crit_edge ], [ %i625, %bb758.bb843_crit_edge ], [ %i625, %bb754.bb843_crit_edge ], [ %i625, %bb751.bb843_crit_edge ], [ %i625, %bb747.bb843_crit_edge ], [ %i625, %bb743.bb843_crit_edge ], [ %i625, %bb738.bb843_crit_edge ], [ %i625, %bb734.bb843_crit_edge ], [ %i625, %bb730.bb843_crit_edge ], [ %i625, %bb726.bb843_crit_edge ], [ %i625, %bb722.bb843_crit_edge ], [ %i625, %bb718.bb843_crit_edge ], [ %i625, %bb714.bb843_crit_edge ], [ %i625, %bb710.bb843_crit_edge ], [ %i625, %bb706.bb843_crit_edge ], [ %i625, %bb702.bb843_crit_edge ], [ %i625, %bb699.bb843_crit_edge ], [ %i625, %bb695.bb843_crit_edge ], [ %i625, %bb691.bb843_crit_edge ], [ %i625, %bb686.bb843_crit_edge ], [ %i625, %bb682.bb843_crit_edge ], [ %i625, %bb678.bb843_crit_edge ], [ %i625, %bb674.bb843_crit_edge ], [ %i625, %bb671.bb843_crit_edge ], [ %i625, %bb667.bb843_crit_edge ], [ %i625, %bb663.bb843_crit_edge ], [ %i625, %bb658.bb843_crit_edge ], [ %i625, %bb654.bb843_crit_edge ], [ %i625, %bb650.bb843_crit_edge ], [ %i625, %bb646.bb843_crit_edge ], [ %i625, %bb643.bb843_crit_edge ], [ %i625, %bb639.bb843_crit_edge ], [ %i625, %bb635.bb843_crit_edge ], [ %i625, %bb630.bb843_crit_edge ], [ %i625, %bb623.bb843_crit_edge ]
  %i845 = add nuw nsw i64 %i624, 1
  %i846 = icmp eq i64 %i845, %i52
  br i1 %i846, label %bb847.loopexit, label %bb843.bb623_crit_edge, !llvm.loop !67

bb843.bb623_crit_edge:                            ; preds = %bb843
  br label %bb623

bb847.loopexit:                                   ; preds = %bb843
  br label %bb847

bb847:                                            ; preds = %bb599.bb847_crit_edge, %bb847.loopexit
  %i848 = phi i32 [ %i601, %bb599.bb847_crit_edge ], [ %i844, %bb847.loopexit ]
  %i849 = add nuw nsw i64 %i600, 1
  %i850 = icmp eq i64 %i849, %i51
  br i1 %i850, label %bb851, label %bb847.bb599_crit_edge, !llvm.loop !68

bb847.bb599_crit_edge:                            ; preds = %bb847
  br label %bb599

bb851:                                            ; preds = %bb847
  %i852 = sext i32 %i848 to i64
  br label %bb853

bb853:                                            ; preds = %bb39.bb853_crit_edge, %bb851
  %i854 = phi i64 [ 0, %bb39.bb853_crit_edge ], [ %i852, %bb851 ]
  %i855 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i854, i32 2
  store i32 7, ptr %i855, align 4, !tbaa !57
  tail call void @free(ptr noundef %i9) #21
  tail call void @free(ptr noundef %i10) #21
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #9

; Function Attrs: nounwind uwtable
define dso_local void @susan_corners_quick(ptr noundef readonly %arg, ptr noundef %arg1, ptr nocapture noundef readonly %arg2, i32 noundef %arg3, ptr nocapture noundef writeonly %arg4, i32 noundef %arg5, i32 noundef %arg6) local_unnamed_addr #0 {
bb:
  %i = mul nsw i32 %arg6, %arg5
  %i7 = sext i32 %i to i64
  %i8 = shl nsw i64 %i7, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %arg1, i8 0, i64 %i8, i1 false)
  %i9 = add i32 %arg6, -7
  %i10 = icmp sgt i32 %arg6, 14
  br i1 %i10, label %bb11, label %bb.bb32_crit_edge

bb.bb32_crit_edge:                                ; preds = %bb
  br label %bb32

bb11:                                             ; preds = %bb
  %i12 = add i32 %arg5, -7
  %i13 = icmp sgt i32 %arg5, 14
  %i14 = add nsw i32 %arg5, -3
  %i15 = sext i32 %i14 to i64
  %i16 = add nsw i32 %arg5, -5
  %i17 = sext i32 %i16 to i64
  %i18 = add nsw i32 %arg5, -6
  %i19 = sext i32 %i18 to i64
  %i20 = sext i32 %arg5 to i64
  %i21 = zext i32 %i9 to i64
  %i22 = zext i32 %i12 to i64
  br label %bb23

bb23:                                             ; preds = %bb384.bb23_crit_edge, %bb11
  %i24 = phi i64 [ 7, %bb11 ], [ %i385, %bb384.bb23_crit_edge ]
  br i1 %i13, label %bb25, label %bb23.bb384_crit_edge

bb23.bb384_crit_edge:                             ; preds = %bb23
  br label %bb384

bb25:                                             ; preds = %bb23
  %i26 = add nsw i64 %i24, -3
  %i27 = mul nsw i64 %i26, %i20
  %i28 = getelementptr inbounds i8, ptr %arg, i64 %i27
  %i29 = trunc i64 %i24 to i32
  %i30 = mul i32 %i29, %arg5
  %i31 = zext i32 %i30 to i64
  br label %bb46

bb32.loopexit:                                    ; preds = %bb384
  br label %bb32

bb32:                                             ; preds = %bb.bb32_crit_edge, %bb32.loopexit
  %i33 = icmp sgt i32 %arg6, 14
  br i1 %i33, label %bb34, label %bb32.bb844_crit_edge

bb32.bb844_crit_edge:                             ; preds = %bb32
  br label %bb844

bb34:                                             ; preds = %bb32
  %i35 = add i32 %arg5, -7
  %i36 = icmp sgt i32 %arg5, 14
  %i37 = sext i32 %arg5 to i64
  %i38 = sext i32 %arg5 to i64
  %i39 = sext i32 %arg5 to i64
  %i40 = sext i32 %arg5 to i64
  %i41 = sext i32 %arg5 to i64
  %i42 = sext i32 %arg5 to i64
  %i43 = sext i32 %arg5 to i64
  %i44 = zext i32 %i9 to i64
  %i45 = zext i32 %i35 to i64
  br label %bb387

bb46:                                             ; preds = %bb381.bb46_crit_edge, %bb25
  %i47 = phi i64 [ 7, %bb25 ], [ %i382, %bb381.bb46_crit_edge ]
  %i48 = getelementptr inbounds i8, ptr %i28, i64 %i47
  %i49 = getelementptr inbounds i8, ptr %i48, i64 -1
  %i50 = add nuw nsw i64 %i47, %i31
  %i51 = getelementptr inbounds i8, ptr %arg, i64 %i50
  %i52 = load i8, ptr %i51, align 1, !tbaa !22
  %i53 = zext i8 %i52 to i64
  %i54 = getelementptr inbounds i8, ptr %arg2, i64 %i53
  %i55 = load i8, ptr %i49, align 1, !tbaa !22
  %i56 = zext i8 %i55 to i64
  %i57 = sub nsw i64 0, %i56
  %i58 = getelementptr inbounds i8, ptr %i54, i64 %i57
  %i59 = load i8, ptr %i58, align 1, !tbaa !22
  %i60 = zext i8 %i59 to i32
  %i61 = add nuw nsw i32 %i60, 100
  %i62 = getelementptr inbounds i8, ptr %i48, i64 1
  %i63 = load i8, ptr %i48, align 1, !tbaa !22
  %i64 = zext i8 %i63 to i64
  %i65 = sub nsw i64 0, %i64
  %i66 = getelementptr inbounds i8, ptr %i54, i64 %i65
  %i67 = load i8, ptr %i66, align 1, !tbaa !22
  %i68 = zext i8 %i67 to i32
  %i69 = add nuw nsw i32 %i61, %i68
  %i70 = load i8, ptr %i62, align 1, !tbaa !22
  %i71 = zext i8 %i70 to i64
  %i72 = sub nsw i64 0, %i71
  %i73 = getelementptr inbounds i8, ptr %i54, i64 %i72
  %i74 = load i8, ptr %i73, align 1, !tbaa !22
  %i75 = zext i8 %i74 to i32
  %i76 = add nuw nsw i32 %i69, %i75
  %i77 = getelementptr inbounds i8, ptr %i62, i64 %i15
  %i78 = getelementptr inbounds i8, ptr %i77, i64 1
  %i79 = load i8, ptr %i77, align 1, !tbaa !22
  %i80 = zext i8 %i79 to i64
  %i81 = sub nsw i64 0, %i80
  %i82 = getelementptr inbounds i8, ptr %i54, i64 %i81
  %i83 = load i8, ptr %i82, align 1, !tbaa !22
  %i84 = zext i8 %i83 to i32
  %i85 = add nuw nsw i32 %i76, %i84
  %i86 = getelementptr inbounds i8, ptr %i77, i64 2
  %i87 = load i8, ptr %i78, align 1, !tbaa !22
  %i88 = zext i8 %i87 to i64
  %i89 = sub nsw i64 0, %i88
  %i90 = getelementptr inbounds i8, ptr %i54, i64 %i89
  %i91 = load i8, ptr %i90, align 1, !tbaa !22
  %i92 = zext i8 %i91 to i32
  %i93 = add nuw nsw i32 %i85, %i92
  %i94 = getelementptr inbounds i8, ptr %i77, i64 3
  %i95 = load i8, ptr %i86, align 1, !tbaa !22
  %i96 = zext i8 %i95 to i64
  %i97 = sub nsw i64 0, %i96
  %i98 = getelementptr inbounds i8, ptr %i54, i64 %i97
  %i99 = load i8, ptr %i98, align 1, !tbaa !22
  %i100 = zext i8 %i99 to i32
  %i101 = add nuw nsw i32 %i93, %i100
  %i102 = getelementptr inbounds i8, ptr %i77, i64 4
  %i103 = load i8, ptr %i94, align 1, !tbaa !22
  %i104 = zext i8 %i103 to i64
  %i105 = sub nsw i64 0, %i104
  %i106 = getelementptr inbounds i8, ptr %i54, i64 %i105
  %i107 = load i8, ptr %i106, align 1, !tbaa !22
  %i108 = zext i8 %i107 to i32
  %i109 = add nuw nsw i32 %i101, %i108
  %i110 = load i8, ptr %i102, align 1, !tbaa !22
  %i111 = zext i8 %i110 to i64
  %i112 = sub nsw i64 0, %i111
  %i113 = getelementptr inbounds i8, ptr %i54, i64 %i112
  %i114 = load i8, ptr %i113, align 1, !tbaa !22
  %i115 = zext i8 %i114 to i32
  %i116 = add nuw nsw i32 %i109, %i115
  %i117 = getelementptr inbounds i8, ptr %i102, i64 %i17
  %i118 = getelementptr inbounds i8, ptr %i117, i64 1
  %i119 = load i8, ptr %i117, align 1, !tbaa !22
  %i120 = zext i8 %i119 to i64
  %i121 = sub nsw i64 0, %i120
  %i122 = getelementptr inbounds i8, ptr %i54, i64 %i121
  %i123 = load i8, ptr %i122, align 1, !tbaa !22
  %i124 = zext i8 %i123 to i32
  %i125 = add nuw nsw i32 %i116, %i124
  %i126 = getelementptr inbounds i8, ptr %i117, i64 2
  %i127 = load i8, ptr %i118, align 1, !tbaa !22
  %i128 = zext i8 %i127 to i64
  %i129 = sub nsw i64 0, %i128
  %i130 = getelementptr inbounds i8, ptr %i54, i64 %i129
  %i131 = load i8, ptr %i130, align 1, !tbaa !22
  %i132 = zext i8 %i131 to i32
  %i133 = add nuw nsw i32 %i125, %i132
  %i134 = getelementptr inbounds i8, ptr %i117, i64 3
  %i135 = load i8, ptr %i126, align 1, !tbaa !22
  %i136 = zext i8 %i135 to i64
  %i137 = sub nsw i64 0, %i136
  %i138 = getelementptr inbounds i8, ptr %i54, i64 %i137
  %i139 = load i8, ptr %i138, align 1, !tbaa !22
  %i140 = zext i8 %i139 to i32
  %i141 = add nuw nsw i32 %i133, %i140
  %i142 = getelementptr inbounds i8, ptr %i117, i64 4
  %i143 = load i8, ptr %i134, align 1, !tbaa !22
  %i144 = zext i8 %i143 to i64
  %i145 = sub nsw i64 0, %i144
  %i146 = getelementptr inbounds i8, ptr %i54, i64 %i145
  %i147 = load i8, ptr %i146, align 1, !tbaa !22
  %i148 = zext i8 %i147 to i32
  %i149 = add nuw nsw i32 %i141, %i148
  %i150 = getelementptr inbounds i8, ptr %i117, i64 5
  %i151 = load i8, ptr %i142, align 1, !tbaa !22
  %i152 = zext i8 %i151 to i64
  %i153 = sub nsw i64 0, %i152
  %i154 = getelementptr inbounds i8, ptr %i54, i64 %i153
  %i155 = load i8, ptr %i154, align 1, !tbaa !22
  %i156 = zext i8 %i155 to i32
  %i157 = add nuw nsw i32 %i149, %i156
  %i158 = getelementptr inbounds i8, ptr %i117, i64 6
  %i159 = load i8, ptr %i150, align 1, !tbaa !22
  %i160 = zext i8 %i159 to i64
  %i161 = sub nsw i64 0, %i160
  %i162 = getelementptr inbounds i8, ptr %i54, i64 %i161
  %i163 = load i8, ptr %i162, align 1, !tbaa !22
  %i164 = zext i8 %i163 to i32
  %i165 = add nuw nsw i32 %i157, %i164
  %i166 = load i8, ptr %i158, align 1, !tbaa !22
  %i167 = zext i8 %i166 to i64
  %i168 = sub nsw i64 0, %i167
  %i169 = getelementptr inbounds i8, ptr %i54, i64 %i168
  %i170 = load i8, ptr %i169, align 1, !tbaa !22
  %i171 = zext i8 %i170 to i32
  %i172 = add nuw nsw i32 %i165, %i171
  %i173 = getelementptr inbounds i8, ptr %i158, i64 %i19
  %i174 = getelementptr inbounds i8, ptr %i173, i64 1
  %i175 = load i8, ptr %i173, align 1, !tbaa !22
  %i176 = zext i8 %i175 to i64
  %i177 = sub nsw i64 0, %i176
  %i178 = getelementptr inbounds i8, ptr %i54, i64 %i177
  %i179 = load i8, ptr %i178, align 1, !tbaa !22
  %i180 = zext i8 %i179 to i32
  %i181 = add nuw nsw i32 %i172, %i180
  %i182 = getelementptr inbounds i8, ptr %i173, i64 2
  %i183 = load i8, ptr %i174, align 1, !tbaa !22
  %i184 = zext i8 %i183 to i64
  %i185 = sub nsw i64 0, %i184
  %i186 = getelementptr inbounds i8, ptr %i54, i64 %i185
  %i187 = load i8, ptr %i186, align 1, !tbaa !22
  %i188 = zext i8 %i187 to i32
  %i189 = add nuw nsw i32 %i181, %i188
  %i190 = load i8, ptr %i182, align 1, !tbaa !22
  %i191 = zext i8 %i190 to i64
  %i192 = sub nsw i64 0, %i191
  %i193 = getelementptr inbounds i8, ptr %i54, i64 %i192
  %i194 = load i8, ptr %i193, align 1, !tbaa !22
  %i195 = zext i8 %i194 to i32
  %i196 = add nuw nsw i32 %i189, %i195
  %i197 = icmp slt i32 %i196, %arg3
  br i1 %i197, label %bb198, label %bb46.bb381_crit_edge

bb46.bb381_crit_edge:                             ; preds = %bb46
  br label %bb381

bb198:                                            ; preds = %bb46
  %i199 = getelementptr inbounds i8, ptr %i173, i64 4
  %i200 = load i8, ptr %i199, align 1, !tbaa !22
  %i201 = zext i8 %i200 to i64
  %i202 = sub nsw i64 0, %i201
  %i203 = getelementptr inbounds i8, ptr %i54, i64 %i202
  %i204 = load i8, ptr %i203, align 1, !tbaa !22
  %i205 = zext i8 %i204 to i32
  %i206 = add nuw nsw i32 %i196, %i205
  %i207 = icmp slt i32 %i206, %arg3
  br i1 %i207, label %bb208, label %bb198.bb381_crit_edge

bb198.bb381_crit_edge:                            ; preds = %bb198
  br label %bb381

bb208:                                            ; preds = %bb198
  %i209 = getelementptr inbounds i8, ptr %i173, i64 5
  %i210 = getelementptr inbounds i8, ptr %i173, i64 6
  %i211 = load i8, ptr %i209, align 1, !tbaa !22
  %i212 = zext i8 %i211 to i64
  %i213 = sub nsw i64 0, %i212
  %i214 = getelementptr inbounds i8, ptr %i54, i64 %i213
  %i215 = load i8, ptr %i214, align 1, !tbaa !22
  %i216 = zext i8 %i215 to i32
  %i217 = add nuw nsw i32 %i206, %i216
  %i218 = icmp slt i32 %i217, %arg3
  br i1 %i218, label %bb219, label %bb208.bb381_crit_edge

bb208.bb381_crit_edge:                            ; preds = %bb208
  br label %bb381

bb219:                                            ; preds = %bb208
  %i220 = load i8, ptr %i210, align 1, !tbaa !22
  %i221 = zext i8 %i220 to i64
  %i222 = sub nsw i64 0, %i221
  %i223 = getelementptr inbounds i8, ptr %i54, i64 %i222
  %i224 = load i8, ptr %i223, align 1, !tbaa !22
  %i225 = zext i8 %i224 to i32
  %i226 = add nuw nsw i32 %i217, %i225
  %i227 = icmp slt i32 %i226, %arg3
  br i1 %i227, label %bb228, label %bb219.bb381_crit_edge

bb219.bb381_crit_edge:                            ; preds = %bb219
  br label %bb381

bb228:                                            ; preds = %bb219
  %i229 = getelementptr inbounds i8, ptr %i210, i64 %i19
  %i230 = load i8, ptr %i229, align 1, !tbaa !22
  %i231 = zext i8 %i230 to i64
  %i232 = sub nsw i64 0, %i231
  %i233 = getelementptr inbounds i8, ptr %i54, i64 %i232
  %i234 = load i8, ptr %i233, align 1, !tbaa !22
  %i235 = zext i8 %i234 to i32
  %i236 = add nuw nsw i32 %i226, %i235
  %i237 = icmp slt i32 %i236, %arg3
  br i1 %i237, label %bb238, label %bb228.bb381_crit_edge

bb228.bb381_crit_edge:                            ; preds = %bb228
  br label %bb381

bb238:                                            ; preds = %bb228
  %i239 = getelementptr inbounds i8, ptr %i229, i64 1
  %i240 = load i8, ptr %i239, align 1, !tbaa !22
  %i241 = zext i8 %i240 to i64
  %i242 = sub nsw i64 0, %i241
  %i243 = getelementptr inbounds i8, ptr %i54, i64 %i242
  %i244 = load i8, ptr %i243, align 1, !tbaa !22
  %i245 = zext i8 %i244 to i32
  %i246 = add nuw nsw i32 %i236, %i245
  %i247 = icmp slt i32 %i246, %arg3
  br i1 %i247, label %bb248, label %bb238.bb381_crit_edge

bb238.bb381_crit_edge:                            ; preds = %bb238
  br label %bb381

bb248:                                            ; preds = %bb238
  %i249 = getelementptr inbounds i8, ptr %i229, i64 2
  %i250 = load i8, ptr %i249, align 1, !tbaa !22
  %i251 = zext i8 %i250 to i64
  %i252 = sub nsw i64 0, %i251
  %i253 = getelementptr inbounds i8, ptr %i54, i64 %i252
  %i254 = load i8, ptr %i253, align 1, !tbaa !22
  %i255 = zext i8 %i254 to i32
  %i256 = add nuw nsw i32 %i246, %i255
  %i257 = icmp slt i32 %i256, %arg3
  br i1 %i257, label %bb258, label %bb248.bb381_crit_edge

bb248.bb381_crit_edge:                            ; preds = %bb248
  br label %bb381

bb258:                                            ; preds = %bb248
  %i259 = getelementptr inbounds i8, ptr %i229, i64 3
  %i260 = load i8, ptr %i259, align 1, !tbaa !22
  %i261 = zext i8 %i260 to i64
  %i262 = sub nsw i64 0, %i261
  %i263 = getelementptr inbounds i8, ptr %i54, i64 %i262
  %i264 = load i8, ptr %i263, align 1, !tbaa !22
  %i265 = zext i8 %i264 to i32
  %i266 = add nuw nsw i32 %i256, %i265
  %i267 = icmp slt i32 %i266, %arg3
  br i1 %i267, label %bb268, label %bb258.bb381_crit_edge

bb258.bb381_crit_edge:                            ; preds = %bb258
  br label %bb381

bb268:                                            ; preds = %bb258
  %i269 = getelementptr inbounds i8, ptr %i229, i64 4
  %i270 = load i8, ptr %i269, align 1, !tbaa !22
  %i271 = zext i8 %i270 to i64
  %i272 = sub nsw i64 0, %i271
  %i273 = getelementptr inbounds i8, ptr %i54, i64 %i272
  %i274 = load i8, ptr %i273, align 1, !tbaa !22
  %i275 = zext i8 %i274 to i32
  %i276 = add nuw nsw i32 %i266, %i275
  %i277 = icmp slt i32 %i276, %arg3
  br i1 %i277, label %bb278, label %bb268.bb381_crit_edge

bb268.bb381_crit_edge:                            ; preds = %bb268
  br label %bb381

bb278:                                            ; preds = %bb268
  %i279 = getelementptr inbounds i8, ptr %i229, i64 5
  %i280 = getelementptr inbounds i8, ptr %i229, i64 6
  %i281 = load i8, ptr %i279, align 1, !tbaa !22
  %i282 = zext i8 %i281 to i64
  %i283 = sub nsw i64 0, %i282
  %i284 = getelementptr inbounds i8, ptr %i54, i64 %i283
  %i285 = load i8, ptr %i284, align 1, !tbaa !22
  %i286 = zext i8 %i285 to i32
  %i287 = add nuw nsw i32 %i276, %i286
  %i288 = icmp slt i32 %i287, %arg3
  br i1 %i288, label %bb289, label %bb278.bb381_crit_edge

bb278.bb381_crit_edge:                            ; preds = %bb278
  br label %bb381

bb289:                                            ; preds = %bb278
  %i290 = load i8, ptr %i280, align 1, !tbaa !22
  %i291 = zext i8 %i290 to i64
  %i292 = sub nsw i64 0, %i291
  %i293 = getelementptr inbounds i8, ptr %i54, i64 %i292
  %i294 = load i8, ptr %i293, align 1, !tbaa !22
  %i295 = zext i8 %i294 to i32
  %i296 = add nuw nsw i32 %i287, %i295
  %i297 = icmp slt i32 %i296, %arg3
  br i1 %i297, label %bb298, label %bb289.bb381_crit_edge

bb289.bb381_crit_edge:                            ; preds = %bb289
  br label %bb381

bb298:                                            ; preds = %bb289
  %i299 = getelementptr inbounds i8, ptr %i280, i64 %i17
  %i300 = load i8, ptr %i299, align 1, !tbaa !22
  %i301 = zext i8 %i300 to i64
  %i302 = sub nsw i64 0, %i301
  %i303 = getelementptr inbounds i8, ptr %i54, i64 %i302
  %i304 = load i8, ptr %i303, align 1, !tbaa !22
  %i305 = zext i8 %i304 to i32
  %i306 = add nuw nsw i32 %i296, %i305
  %i307 = icmp slt i32 %i306, %arg3
  br i1 %i307, label %bb308, label %bb298.bb381_crit_edge

bb298.bb381_crit_edge:                            ; preds = %bb298
  br label %bb381

bb308:                                            ; preds = %bb298
  %i309 = getelementptr inbounds i8, ptr %i299, i64 1
  %i310 = load i8, ptr %i309, align 1, !tbaa !22
  %i311 = zext i8 %i310 to i64
  %i312 = sub nsw i64 0, %i311
  %i313 = getelementptr inbounds i8, ptr %i54, i64 %i312
  %i314 = load i8, ptr %i313, align 1, !tbaa !22
  %i315 = zext i8 %i314 to i32
  %i316 = add nuw nsw i32 %i306, %i315
  %i317 = icmp slt i32 %i316, %arg3
  br i1 %i317, label %bb318, label %bb308.bb381_crit_edge

bb308.bb381_crit_edge:                            ; preds = %bb308
  br label %bb381

bb318:                                            ; preds = %bb308
  %i319 = getelementptr inbounds i8, ptr %i299, i64 2
  %i320 = load i8, ptr %i319, align 1, !tbaa !22
  %i321 = zext i8 %i320 to i64
  %i322 = sub nsw i64 0, %i321
  %i323 = getelementptr inbounds i8, ptr %i54, i64 %i322
  %i324 = load i8, ptr %i323, align 1, !tbaa !22
  %i325 = zext i8 %i324 to i32
  %i326 = add nuw nsw i32 %i316, %i325
  %i327 = icmp slt i32 %i326, %arg3
  br i1 %i327, label %bb328, label %bb318.bb381_crit_edge

bb318.bb381_crit_edge:                            ; preds = %bb318
  br label %bb381

bb328:                                            ; preds = %bb318
  %i329 = getelementptr inbounds i8, ptr %i299, i64 3
  %i330 = getelementptr inbounds i8, ptr %i299, i64 4
  %i331 = load i8, ptr %i329, align 1, !tbaa !22
  %i332 = zext i8 %i331 to i64
  %i333 = sub nsw i64 0, %i332
  %i334 = getelementptr inbounds i8, ptr %i54, i64 %i333
  %i335 = load i8, ptr %i334, align 1, !tbaa !22
  %i336 = zext i8 %i335 to i32
  %i337 = add nuw nsw i32 %i326, %i336
  %i338 = icmp slt i32 %i337, %arg3
  br i1 %i338, label %bb339, label %bb328.bb381_crit_edge

bb328.bb381_crit_edge:                            ; preds = %bb328
  br label %bb381

bb339:                                            ; preds = %bb328
  %i340 = load i8, ptr %i330, align 1, !tbaa !22
  %i341 = zext i8 %i340 to i64
  %i342 = sub nsw i64 0, %i341
  %i343 = getelementptr inbounds i8, ptr %i54, i64 %i342
  %i344 = load i8, ptr %i343, align 1, !tbaa !22
  %i345 = zext i8 %i344 to i32
  %i346 = add nuw nsw i32 %i337, %i345
  %i347 = icmp slt i32 %i346, %arg3
  br i1 %i347, label %bb348, label %bb339.bb381_crit_edge

bb339.bb381_crit_edge:                            ; preds = %bb339
  br label %bb381

bb348:                                            ; preds = %bb339
  %i349 = getelementptr inbounds i8, ptr %i330, i64 %i15
  %i350 = load i8, ptr %i349, align 1, !tbaa !22
  %i351 = zext i8 %i350 to i64
  %i352 = sub nsw i64 0, %i351
  %i353 = getelementptr inbounds i8, ptr %i54, i64 %i352
  %i354 = load i8, ptr %i353, align 1, !tbaa !22
  %i355 = zext i8 %i354 to i32
  %i356 = add nuw nsw i32 %i346, %i355
  %i357 = icmp slt i32 %i356, %arg3
  br i1 %i357, label %bb358, label %bb348.bb381_crit_edge

bb348.bb381_crit_edge:                            ; preds = %bb348
  br label %bb381

bb358:                                            ; preds = %bb348
  %i359 = getelementptr inbounds i8, ptr %i349, i64 1
  %i360 = load i8, ptr %i359, align 1, !tbaa !22
  %i361 = zext i8 %i360 to i64
  %i362 = sub nsw i64 0, %i361
  %i363 = getelementptr inbounds i8, ptr %i54, i64 %i362
  %i364 = load i8, ptr %i363, align 1, !tbaa !22
  %i365 = zext i8 %i364 to i32
  %i366 = add nuw nsw i32 %i356, %i365
  %i367 = icmp slt i32 %i366, %arg3
  br i1 %i367, label %bb368, label %bb358.bb381_crit_edge

bb358.bb381_crit_edge:                            ; preds = %bb358
  br label %bb381

bb368:                                            ; preds = %bb358
  %i369 = getelementptr inbounds i8, ptr %i349, i64 2
  %i370 = load i8, ptr %i369, align 1, !tbaa !22
  %i371 = zext i8 %i370 to i64
  %i372 = sub nsw i64 0, %i371
  %i373 = getelementptr inbounds i8, ptr %i54, i64 %i372
  %i374 = load i8, ptr %i373, align 1, !tbaa !22
  %i375 = zext i8 %i374 to i32
  %i376 = add nuw nsw i32 %i366, %i375
  %i377 = icmp slt i32 %i376, %arg3
  br i1 %i377, label %bb378, label %bb368.bb381_crit_edge

bb368.bb381_crit_edge:                            ; preds = %bb368
  br label %bb381

bb378:                                            ; preds = %bb368
  %i379 = sub nsw i32 %arg3, %i376
  %i380 = getelementptr inbounds i32, ptr %arg1, i64 %i50
  store i32 %i379, ptr %i380, align 4, !tbaa !19
  br label %bb381

bb381:                                            ; preds = %bb368.bb381_crit_edge, %bb358.bb381_crit_edge, %bb348.bb381_crit_edge, %bb339.bb381_crit_edge, %bb328.bb381_crit_edge, %bb318.bb381_crit_edge, %bb308.bb381_crit_edge, %bb298.bb381_crit_edge, %bb289.bb381_crit_edge, %bb278.bb381_crit_edge, %bb268.bb381_crit_edge, %bb258.bb381_crit_edge, %bb248.bb381_crit_edge, %bb238.bb381_crit_edge, %bb228.bb381_crit_edge, %bb219.bb381_crit_edge, %bb208.bb381_crit_edge, %bb198.bb381_crit_edge, %bb46.bb381_crit_edge, %bb378
  %i382 = add nuw nsw i64 %i47, 1
  %i383 = icmp eq i64 %i382, %i22
  br i1 %i383, label %bb384.loopexit, label %bb381.bb46_crit_edge, !llvm.loop !69

bb381.bb46_crit_edge:                             ; preds = %bb381
  br label %bb46

bb384.loopexit:                                   ; preds = %bb381
  br label %bb384

bb384:                                            ; preds = %bb23.bb384_crit_edge, %bb384.loopexit
  %i385 = add nuw nsw i64 %i24, 1
  %i386 = icmp eq i64 %i385, %i21
  br i1 %i386, label %bb32.loopexit, label %bb384.bb23_crit_edge, !llvm.loop !70

bb384.bb23_crit_edge:                             ; preds = %bb384
  br label %bb23

bb387:                                            ; preds = %bb838.bb387_crit_edge, %bb34
  %i388 = phi i64 [ 7, %bb34 ], [ %i840, %bb838.bb387_crit_edge ]
  %i389 = phi i32 [ 0, %bb34 ], [ %i839, %bb838.bb387_crit_edge ]
  br i1 %i36, label %bb390, label %bb387.bb838_crit_edge

bb387.bb838_crit_edge:                            ; preds = %bb387
  br label %bb838

bb390:                                            ; preds = %bb387
  %i391 = mul nsw i64 %i388, %i40
  %i392 = add nsw i64 %i388, -3
  %i393 = mul nsw i64 %i392, %i39
  %i394 = add nsw i64 %i388, -2
  %i395 = mul nsw i64 %i394, %i38
  %i396 = add nsw i64 %i388, -1
  %i397 = mul nsw i64 %i396, %i37
  %i398 = add nuw nsw i64 %i388, 1
  %i399 = mul nsw i64 %i398, %i41
  %i400 = add nuw nsw i64 %i388, 2
  %i401 = mul nsw i64 %i400, %i42
  %i402 = add nuw nsw i64 %i388, 3
  %i403 = mul nsw i64 %i402, %i43
  %i404 = getelementptr i32, ptr %arg1, i64 %i393
  %i405 = getelementptr i32, ptr %arg1, i64 %i403
  %i406 = trunc i64 %i388 to i32
  br label %bb407

bb407:                                            ; preds = %bb834.bb407_crit_edge, %bb390
  %i408 = phi i64 [ 7, %bb390 ], [ %i836, %bb834.bb407_crit_edge ]
  %i409 = phi i32 [ %i389, %bb390 ], [ %i835, %bb834.bb407_crit_edge ]
  %i410 = add nuw nsw i64 %i408, %i391
  %i411 = getelementptr inbounds i32, ptr %arg1, i64 %i410
  %i412 = load i32, ptr %i411, align 4, !tbaa !19
  %i413 = icmp sgt i32 %i412, 0
  br i1 %i413, label %bb414, label %bb407.bb834_crit_edge

bb407.bb834_crit_edge:                            ; preds = %bb407
  br label %bb834

bb414:                                            ; preds = %bb407
  %i415 = getelementptr i32, ptr %i404, i64 %i408
  %i416 = getelementptr i32, ptr %i415, i64 -3
  %i417 = load i32, ptr %i416, align 4, !tbaa !19
  %i418 = icmp sgt i32 %i412, %i417
  br i1 %i418, label %bb419, label %bb414.bb834_crit_edge

bb414.bb834_crit_edge:                            ; preds = %bb414
  br label %bb834

bb419:                                            ; preds = %bb414
  %i420 = getelementptr i32, ptr %i415, i64 -2
  %i421 = load i32, ptr %i420, align 4, !tbaa !19
  %i422 = icmp sgt i32 %i412, %i421
  br i1 %i422, label %bb423, label %bb419.bb834_crit_edge

bb419.bb834_crit_edge:                            ; preds = %bb419
  br label %bb834

bb423:                                            ; preds = %bb419
  %i424 = getelementptr i32, ptr %i415, i64 -1
  %i425 = load i32, ptr %i424, align 4, !tbaa !19
  %i426 = icmp sgt i32 %i412, %i425
  br i1 %i426, label %bb427, label %bb423.bb834_crit_edge

bb423.bb834_crit_edge:                            ; preds = %bb423
  br label %bb834

bb427:                                            ; preds = %bb423
  %i428 = load i32, ptr %i415, align 4, !tbaa !19
  %i429 = icmp sgt i32 %i412, %i428
  br i1 %i429, label %bb430, label %bb427.bb834_crit_edge

bb427.bb834_crit_edge:                            ; preds = %bb427
  br label %bb834

bb430:                                            ; preds = %bb427
  %i431 = getelementptr i32, ptr %i415, i64 1
  %i432 = load i32, ptr %i431, align 4, !tbaa !19
  %i433 = icmp sgt i32 %i412, %i432
  br i1 %i433, label %bb434, label %bb430.bb834_crit_edge

bb430.bb834_crit_edge:                            ; preds = %bb430
  br label %bb834

bb434:                                            ; preds = %bb430
  %i435 = getelementptr i32, ptr %i415, i64 2
  %i436 = load i32, ptr %i435, align 4, !tbaa !19
  %i437 = icmp sgt i32 %i412, %i436
  br i1 %i437, label %bb438, label %bb434.bb834_crit_edge

bb434.bb834_crit_edge:                            ; preds = %bb434
  br label %bb834

bb438:                                            ; preds = %bb434
  %i439 = getelementptr i32, ptr %i415, i64 3
  %i440 = load i32, ptr %i439, align 4, !tbaa !19
  %i441 = icmp sgt i32 %i412, %i440
  br i1 %i441, label %bb442, label %bb438.bb834_crit_edge

bb438.bb834_crit_edge:                            ; preds = %bb438
  br label %bb834

bb442:                                            ; preds = %bb438
  %i443 = add nsw i64 %i408, %i395
  %i444 = getelementptr i32, ptr %arg1, i64 %i443
  %i445 = getelementptr i32, ptr %i444, i64 -3
  %i446 = load i32, ptr %i445, align 4, !tbaa !19
  %i447 = icmp sgt i32 %i412, %i446
  br i1 %i447, label %bb448, label %bb442.bb834_crit_edge

bb442.bb834_crit_edge:                            ; preds = %bb442
  br label %bb834

bb448:                                            ; preds = %bb442
  %i449 = add nsw i64 %i443, -2
  %i450 = getelementptr inbounds i32, ptr %arg1, i64 %i449
  %i451 = load i32, ptr %i450, align 4, !tbaa !19
  %i452 = icmp sgt i32 %i412, %i451
  br i1 %i452, label %bb453, label %bb448.bb834_crit_edge

bb448.bb834_crit_edge:                            ; preds = %bb448
  br label %bb834

bb453:                                            ; preds = %bb448
  %i454 = add nsw i64 %i443, -1
  %i455 = getelementptr inbounds i32, ptr %arg1, i64 %i454
  %i456 = load i32, ptr %i455, align 4, !tbaa !19
  %i457 = icmp sgt i32 %i412, %i456
  br i1 %i457, label %bb458, label %bb453.bb834_crit_edge

bb453.bb834_crit_edge:                            ; preds = %bb453
  br label %bb834

bb458:                                            ; preds = %bb453
  %i459 = load i32, ptr %i444, align 4, !tbaa !19
  %i460 = icmp sgt i32 %i412, %i459
  br i1 %i460, label %bb461, label %bb458.bb834_crit_edge

bb458.bb834_crit_edge:                            ; preds = %bb458
  br label %bb834

bb461:                                            ; preds = %bb458
  %i462 = add nsw i64 %i443, 1
  %i463 = getelementptr inbounds i32, ptr %arg1, i64 %i462
  %i464 = load i32, ptr %i463, align 4, !tbaa !19
  %i465 = icmp sgt i32 %i412, %i464
  br i1 %i465, label %bb466, label %bb461.bb834_crit_edge

bb461.bb834_crit_edge:                            ; preds = %bb461
  br label %bb834

bb466:                                            ; preds = %bb461
  %i467 = add nsw i64 %i443, 2
  %i468 = getelementptr inbounds i32, ptr %arg1, i64 %i467
  %i469 = load i32, ptr %i468, align 4, !tbaa !19
  %i470 = icmp sgt i32 %i412, %i469
  br i1 %i470, label %bb471, label %bb466.bb834_crit_edge

bb466.bb834_crit_edge:                            ; preds = %bb466
  br label %bb834

bb471:                                            ; preds = %bb466
  %i472 = getelementptr i32, ptr %i444, i64 3
  %i473 = load i32, ptr %i472, align 4, !tbaa !19
  %i474 = icmp sgt i32 %i412, %i473
  br i1 %i474, label %bb475, label %bb471.bb834_crit_edge

bb471.bb834_crit_edge:                            ; preds = %bb471
  br label %bb834

bb475:                                            ; preds = %bb471
  %i476 = add nsw i64 %i408, %i397
  %i477 = getelementptr i32, ptr %arg1, i64 %i476
  %i478 = getelementptr i32, ptr %i477, i64 -3
  %i479 = load i32, ptr %i478, align 4, !tbaa !19
  %i480 = icmp sgt i32 %i412, %i479
  br i1 %i480, label %bb481, label %bb475.bb834_crit_edge

bb475.bb834_crit_edge:                            ; preds = %bb475
  br label %bb834

bb481:                                            ; preds = %bb475
  %i482 = add nsw i64 %i476, -2
  %i483 = getelementptr inbounds i32, ptr %arg1, i64 %i482
  %i484 = load i32, ptr %i483, align 4, !tbaa !19
  %i485 = icmp sgt i32 %i412, %i484
  br i1 %i485, label %bb486, label %bb481.bb834_crit_edge

bb481.bb834_crit_edge:                            ; preds = %bb481
  br label %bb834

bb486:                                            ; preds = %bb481
  %i487 = add nsw i64 %i476, -1
  %i488 = getelementptr inbounds i32, ptr %arg1, i64 %i487
  %i489 = load i32, ptr %i488, align 4, !tbaa !19
  %i490 = icmp sgt i32 %i412, %i489
  br i1 %i490, label %bb491, label %bb486.bb834_crit_edge

bb486.bb834_crit_edge:                            ; preds = %bb486
  br label %bb834

bb491:                                            ; preds = %bb486
  %i492 = load i32, ptr %i477, align 4, !tbaa !19
  %i493 = icmp sgt i32 %i412, %i492
  br i1 %i493, label %bb494, label %bb491.bb834_crit_edge

bb491.bb834_crit_edge:                            ; preds = %bb491
  br label %bb834

bb494:                                            ; preds = %bb491
  %i495 = add nsw i64 %i476, 1
  %i496 = getelementptr inbounds i32, ptr %arg1, i64 %i495
  %i497 = load i32, ptr %i496, align 4, !tbaa !19
  %i498 = icmp sgt i32 %i412, %i497
  br i1 %i498, label %bb499, label %bb494.bb834_crit_edge

bb494.bb834_crit_edge:                            ; preds = %bb494
  br label %bb834

bb499:                                            ; preds = %bb494
  %i500 = add nsw i64 %i476, 2
  %i501 = getelementptr inbounds i32, ptr %arg1, i64 %i500
  %i502 = load i32, ptr %i501, align 4, !tbaa !19
  %i503 = icmp sgt i32 %i412, %i502
  br i1 %i503, label %bb504, label %bb499.bb834_crit_edge

bb499.bb834_crit_edge:                            ; preds = %bb499
  br label %bb834

bb504:                                            ; preds = %bb499
  %i505 = getelementptr i32, ptr %i477, i64 3
  %i506 = load i32, ptr %i505, align 4, !tbaa !19
  %i507 = icmp sgt i32 %i412, %i506
  br i1 %i507, label %bb508, label %bb504.bb834_crit_edge

bb504.bb834_crit_edge:                            ; preds = %bb504
  br label %bb834

bb508:                                            ; preds = %bb504
  %i509 = getelementptr i32, ptr %i411, i64 -3
  %i510 = load i32, ptr %i509, align 4, !tbaa !19
  %i511 = icmp sgt i32 %i412, %i510
  br i1 %i511, label %bb512, label %bb508.bb834_crit_edge

bb508.bb834_crit_edge:                            ; preds = %bb508
  br label %bb834

bb512:                                            ; preds = %bb508
  %i513 = add nsw i64 %i410, -2
  %i514 = getelementptr inbounds i32, ptr %arg1, i64 %i513
  %i515 = load i32, ptr %i514, align 4, !tbaa !19
  %i516 = icmp sgt i32 %i412, %i515
  br i1 %i516, label %bb517, label %bb512.bb834_crit_edge

bb512.bb834_crit_edge:                            ; preds = %bb512
  br label %bb834

bb517:                                            ; preds = %bb512
  %i518 = add nsw i64 %i410, -1
  %i519 = getelementptr inbounds i32, ptr %arg1, i64 %i518
  %i520 = load i32, ptr %i519, align 4, !tbaa !19
  %i521 = icmp sgt i32 %i412, %i520
  br i1 %i521, label %bb522, label %bb517.bb834_crit_edge

bb517.bb834_crit_edge:                            ; preds = %bb517
  br label %bb834

bb522:                                            ; preds = %bb517
  %i523 = add nuw nsw i64 %i410, 1
  %i524 = getelementptr inbounds i32, ptr %arg1, i64 %i523
  %i525 = load i32, ptr %i524, align 4, !tbaa !19
  %i526 = icmp slt i32 %i412, %i525
  br i1 %i526, label %bb522.bb834_crit_edge, label %bb527

bb522.bb834_crit_edge:                            ; preds = %bb522
  br label %bb834

bb527:                                            ; preds = %bb522
  %i528 = add nuw nsw i64 %i410, 2
  %i529 = getelementptr inbounds i32, ptr %arg1, i64 %i528
  %i530 = load i32, ptr %i529, align 4, !tbaa !19
  %i531 = icmp slt i32 %i412, %i530
  br i1 %i531, label %bb527.bb834_crit_edge, label %bb532

bb527.bb834_crit_edge:                            ; preds = %bb527
  br label %bb834

bb532:                                            ; preds = %bb527
  %i533 = getelementptr i32, ptr %i411, i64 3
  %i534 = load i32, ptr %i533, align 4, !tbaa !19
  %i535 = icmp slt i32 %i412, %i534
  br i1 %i535, label %bb532.bb834_crit_edge, label %bb536

bb532.bb834_crit_edge:                            ; preds = %bb532
  br label %bb834

bb536:                                            ; preds = %bb532
  %i537 = add nuw nsw i64 %i408, %i399
  %i538 = getelementptr i32, ptr %arg1, i64 %i537
  %i539 = getelementptr i32, ptr %i538, i64 -3
  %i540 = load i32, ptr %i539, align 4, !tbaa !19
  %i541 = icmp slt i32 %i412, %i540
  br i1 %i541, label %bb536.bb834_crit_edge, label %bb542

bb536.bb834_crit_edge:                            ; preds = %bb536
  br label %bb834

bb542:                                            ; preds = %bb536
  %i543 = add nsw i64 %i537, -2
  %i544 = getelementptr inbounds i32, ptr %arg1, i64 %i543
  %i545 = load i32, ptr %i544, align 4, !tbaa !19
  %i546 = icmp slt i32 %i412, %i545
  br i1 %i546, label %bb542.bb834_crit_edge, label %bb547

bb542.bb834_crit_edge:                            ; preds = %bb542
  br label %bb834

bb547:                                            ; preds = %bb542
  %i548 = add nsw i64 %i537, -1
  %i549 = getelementptr inbounds i32, ptr %arg1, i64 %i548
  %i550 = load i32, ptr %i549, align 4, !tbaa !19
  %i551 = icmp slt i32 %i412, %i550
  br i1 %i551, label %bb547.bb834_crit_edge, label %bb552

bb547.bb834_crit_edge:                            ; preds = %bb547
  br label %bb834

bb552:                                            ; preds = %bb547
  %i553 = load i32, ptr %i538, align 4, !tbaa !19
  %i554 = icmp slt i32 %i412, %i553
  br i1 %i554, label %bb552.bb834_crit_edge, label %bb555

bb552.bb834_crit_edge:                            ; preds = %bb552
  br label %bb834

bb555:                                            ; preds = %bb552
  %i556 = add nuw nsw i64 %i537, 1
  %i557 = getelementptr inbounds i32, ptr %arg1, i64 %i556
  %i558 = load i32, ptr %i557, align 4, !tbaa !19
  %i559 = icmp slt i32 %i412, %i558
  br i1 %i559, label %bb555.bb834_crit_edge, label %bb560

bb555.bb834_crit_edge:                            ; preds = %bb555
  br label %bb834

bb560:                                            ; preds = %bb555
  %i561 = add nuw nsw i64 %i537, 2
  %i562 = getelementptr inbounds i32, ptr %arg1, i64 %i561
  %i563 = load i32, ptr %i562, align 4, !tbaa !19
  %i564 = icmp slt i32 %i412, %i563
  br i1 %i564, label %bb560.bb834_crit_edge, label %bb565

bb560.bb834_crit_edge:                            ; preds = %bb560
  br label %bb834

bb565:                                            ; preds = %bb560
  %i566 = getelementptr i32, ptr %i538, i64 3
  %i567 = load i32, ptr %i566, align 4, !tbaa !19
  %i568 = icmp slt i32 %i412, %i567
  br i1 %i568, label %bb565.bb834_crit_edge, label %bb569

bb565.bb834_crit_edge:                            ; preds = %bb565
  br label %bb834

bb569:                                            ; preds = %bb565
  %i570 = add nuw nsw i64 %i408, %i401
  %i571 = getelementptr i32, ptr %arg1, i64 %i570
  %i572 = getelementptr i32, ptr %i571, i64 -3
  %i573 = load i32, ptr %i572, align 4, !tbaa !19
  %i574 = icmp slt i32 %i412, %i573
  br i1 %i574, label %bb569.bb834_crit_edge, label %bb575

bb569.bb834_crit_edge:                            ; preds = %bb569
  br label %bb834

bb575:                                            ; preds = %bb569
  %i576 = add nsw i64 %i570, -2
  %i577 = getelementptr inbounds i32, ptr %arg1, i64 %i576
  %i578 = load i32, ptr %i577, align 4, !tbaa !19
  %i579 = icmp slt i32 %i412, %i578
  br i1 %i579, label %bb575.bb834_crit_edge, label %bb580

bb575.bb834_crit_edge:                            ; preds = %bb575
  br label %bb834

bb580:                                            ; preds = %bb575
  %i581 = add nsw i64 %i570, -1
  %i582 = getelementptr inbounds i32, ptr %arg1, i64 %i581
  %i583 = load i32, ptr %i582, align 4, !tbaa !19
  %i584 = icmp slt i32 %i412, %i583
  br i1 %i584, label %bb580.bb834_crit_edge, label %bb585

bb580.bb834_crit_edge:                            ; preds = %bb580
  br label %bb834

bb585:                                            ; preds = %bb580
  %i586 = load i32, ptr %i571, align 4, !tbaa !19
  %i587 = icmp slt i32 %i412, %i586
  br i1 %i587, label %bb585.bb834_crit_edge, label %bb588

bb585.bb834_crit_edge:                            ; preds = %bb585
  br label %bb834

bb588:                                            ; preds = %bb585
  %i589 = add nuw nsw i64 %i570, 1
  %i590 = getelementptr inbounds i32, ptr %arg1, i64 %i589
  %i591 = load i32, ptr %i590, align 4, !tbaa !19
  %i592 = icmp slt i32 %i412, %i591
  br i1 %i592, label %bb588.bb834_crit_edge, label %bb593

bb588.bb834_crit_edge:                            ; preds = %bb588
  br label %bb834

bb593:                                            ; preds = %bb588
  %i594 = add nuw nsw i64 %i570, 2
  %i595 = getelementptr inbounds i32, ptr %arg1, i64 %i594
  %i596 = load i32, ptr %i595, align 4, !tbaa !19
  %i597 = icmp slt i32 %i412, %i596
  br i1 %i597, label %bb593.bb834_crit_edge, label %bb598

bb593.bb834_crit_edge:                            ; preds = %bb593
  br label %bb834

bb598:                                            ; preds = %bb593
  %i599 = getelementptr i32, ptr %i571, i64 3
  %i600 = load i32, ptr %i599, align 4, !tbaa !19
  %i601 = icmp slt i32 %i412, %i600
  br i1 %i601, label %bb598.bb834_crit_edge, label %bb602

bb598.bb834_crit_edge:                            ; preds = %bb598
  br label %bb834

bb602:                                            ; preds = %bb598
  %i603 = getelementptr i32, ptr %i405, i64 %i408
  %i604 = getelementptr i32, ptr %i603, i64 -3
  %i605 = load i32, ptr %i604, align 4, !tbaa !19
  %i606 = icmp slt i32 %i412, %i605
  br i1 %i606, label %bb602.bb834_crit_edge, label %bb607

bb602.bb834_crit_edge:                            ; preds = %bb602
  br label %bb834

bb607:                                            ; preds = %bb602
  %i608 = getelementptr i32, ptr %i603, i64 -2
  %i609 = load i32, ptr %i608, align 4, !tbaa !19
  %i610 = icmp slt i32 %i412, %i609
  br i1 %i610, label %bb607.bb834_crit_edge, label %bb611

bb607.bb834_crit_edge:                            ; preds = %bb607
  br label %bb834

bb611:                                            ; preds = %bb607
  %i612 = getelementptr i32, ptr %i603, i64 -1
  %i613 = load i32, ptr %i612, align 4, !tbaa !19
  %i614 = icmp slt i32 %i412, %i613
  br i1 %i614, label %bb611.bb834_crit_edge, label %bb615

bb611.bb834_crit_edge:                            ; preds = %bb611
  br label %bb834

bb615:                                            ; preds = %bb611
  %i616 = load i32, ptr %i603, align 4, !tbaa !19
  %i617 = icmp slt i32 %i412, %i616
  br i1 %i617, label %bb615.bb834_crit_edge, label %bb618

bb615.bb834_crit_edge:                            ; preds = %bb615
  br label %bb834

bb618:                                            ; preds = %bb615
  %i619 = getelementptr i32, ptr %i603, i64 1
  %i620 = load i32, ptr %i619, align 4, !tbaa !19
  %i621 = icmp slt i32 %i412, %i620
  br i1 %i621, label %bb618.bb834_crit_edge, label %bb622

bb618.bb834_crit_edge:                            ; preds = %bb618
  br label %bb834

bb622:                                            ; preds = %bb618
  %i623 = getelementptr i32, ptr %i603, i64 2
  %i624 = load i32, ptr %i623, align 4, !tbaa !19
  %i625 = icmp slt i32 %i412, %i624
  br i1 %i625, label %bb622.bb834_crit_edge, label %bb626

bb622.bb834_crit_edge:                            ; preds = %bb622
  br label %bb834

bb626:                                            ; preds = %bb622
  %i627 = getelementptr i32, ptr %i603, i64 3
  %i628 = load i32, ptr %i627, align 4, !tbaa !19
  %i629 = icmp slt i32 %i412, %i628
  br i1 %i629, label %bb626.bb834_crit_edge, label %bb630

bb626.bb834_crit_edge:                            ; preds = %bb626
  br label %bb834

bb630:                                            ; preds = %bb626
  %i631 = sext i32 %i409 to i64
  %i632 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i631
  %i633 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i631, i32 2
  store i32 0, ptr %i633, align 4, !tbaa !57
  %i634 = trunc i64 %i408 to i32
  store i32 %i634, ptr %i632, align 4, !tbaa !60
  %i635 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i631, i32 1
  store i32 %i406, ptr %i635, align 4, !tbaa !59
  %i636 = getelementptr inbounds i8, ptr %arg, i64 %i449
  %i637 = load i8, ptr %i636, align 1, !tbaa !22
  %i638 = zext i8 %i637 to i32
  %i639 = getelementptr inbounds i8, ptr %arg, i64 %i454
  %i640 = load i8, ptr %i639, align 1, !tbaa !22
  %i641 = zext i8 %i640 to i32
  %i642 = add nuw nsw i32 %i641, %i638
  %i643 = getelementptr inbounds i8, ptr %arg, i64 %i443
  %i644 = load i8, ptr %i643, align 1, !tbaa !22
  %i645 = zext i8 %i644 to i32
  %i646 = add nuw nsw i32 %i642, %i645
  %i647 = getelementptr inbounds i8, ptr %arg, i64 %i462
  %i648 = load i8, ptr %i647, align 1, !tbaa !22
  %i649 = zext i8 %i648 to i32
  %i650 = add nuw nsw i32 %i646, %i649
  %i651 = getelementptr inbounds i8, ptr %arg, i64 %i467
  %i652 = load i8, ptr %i651, align 1, !tbaa !22
  %i653 = zext i8 %i652 to i32
  %i654 = add nuw nsw i32 %i650, %i653
  %i655 = getelementptr inbounds i8, ptr %arg, i64 %i482
  %i656 = load i8, ptr %i655, align 1, !tbaa !22
  %i657 = zext i8 %i656 to i32
  %i658 = add nuw nsw i32 %i654, %i657
  %i659 = getelementptr inbounds i8, ptr %arg, i64 %i487
  %i660 = load i8, ptr %i659, align 1, !tbaa !22
  %i661 = zext i8 %i660 to i32
  %i662 = add nuw nsw i32 %i658, %i661
  %i663 = getelementptr inbounds i8, ptr %arg, i64 %i476
  %i664 = load i8, ptr %i663, align 1, !tbaa !22
  %i665 = zext i8 %i664 to i32
  %i666 = add nuw nsw i32 %i662, %i665
  %i667 = getelementptr inbounds i8, ptr %arg, i64 %i495
  %i668 = load i8, ptr %i667, align 1, !tbaa !22
  %i669 = zext i8 %i668 to i32
  %i670 = add nuw nsw i32 %i666, %i669
  %i671 = getelementptr inbounds i8, ptr %arg, i64 %i500
  %i672 = load i8, ptr %i671, align 1, !tbaa !22
  %i673 = zext i8 %i672 to i32
  %i674 = add nuw nsw i32 %i670, %i673
  %i675 = getelementptr inbounds i8, ptr %arg, i64 %i513
  %i676 = load i8, ptr %i675, align 1, !tbaa !22
  %i677 = zext i8 %i676 to i32
  %i678 = add nuw nsw i32 %i674, %i677
  %i679 = getelementptr inbounds i8, ptr %arg, i64 %i518
  %i680 = load i8, ptr %i679, align 1, !tbaa !22
  %i681 = zext i8 %i680 to i32
  %i682 = add nuw nsw i32 %i678, %i681
  %i683 = getelementptr inbounds i8, ptr %arg, i64 %i410
  %i684 = load i8, ptr %i683, align 1, !tbaa !22
  %i685 = zext i8 %i684 to i32
  %i686 = add nuw nsw i32 %i682, %i685
  %i687 = getelementptr inbounds i8, ptr %arg, i64 %i523
  %i688 = load i8, ptr %i687, align 1, !tbaa !22
  %i689 = zext i8 %i688 to i32
  %i690 = add nuw nsw i32 %i686, %i689
  %i691 = getelementptr inbounds i8, ptr %arg, i64 %i528
  %i692 = load i8, ptr %i691, align 1, !tbaa !22
  %i693 = zext i8 %i692 to i32
  %i694 = add nuw nsw i32 %i690, %i693
  %i695 = getelementptr inbounds i8, ptr %arg, i64 %i543
  %i696 = load i8, ptr %i695, align 1, !tbaa !22
  %i697 = zext i8 %i696 to i32
  %i698 = add nuw nsw i32 %i694, %i697
  %i699 = getelementptr inbounds i8, ptr %arg, i64 %i548
  %i700 = load i8, ptr %i699, align 1, !tbaa !22
  %i701 = zext i8 %i700 to i32
  %i702 = add nuw nsw i32 %i698, %i701
  %i703 = getelementptr inbounds i8, ptr %arg, i64 %i537
  %i704 = load i8, ptr %i703, align 1, !tbaa !22
  %i705 = zext i8 %i704 to i32
  %i706 = add nuw nsw i32 %i702, %i705
  %i707 = getelementptr inbounds i8, ptr %arg, i64 %i556
  %i708 = load i8, ptr %i707, align 1, !tbaa !22
  %i709 = zext i8 %i708 to i32
  %i710 = add nuw nsw i32 %i706, %i709
  %i711 = getelementptr inbounds i8, ptr %arg, i64 %i561
  %i712 = load i8, ptr %i711, align 1, !tbaa !22
  %i713 = zext i8 %i712 to i32
  %i714 = add nuw nsw i32 %i710, %i713
  %i715 = getelementptr inbounds i8, ptr %arg, i64 %i576
  %i716 = load i8, ptr %i715, align 1, !tbaa !22
  %i717 = zext i8 %i716 to i32
  %i718 = add nuw nsw i32 %i714, %i717
  %i719 = getelementptr inbounds i8, ptr %arg, i64 %i581
  %i720 = load i8, ptr %i719, align 1, !tbaa !22
  %i721 = zext i8 %i720 to i32
  %i722 = add nuw nsw i32 %i718, %i721
  %i723 = getelementptr inbounds i8, ptr %arg, i64 %i570
  %i724 = load i8, ptr %i723, align 1, !tbaa !22
  %i725 = zext i8 %i724 to i32
  %i726 = add nuw nsw i32 %i722, %i725
  %i727 = getelementptr inbounds i8, ptr %arg, i64 %i589
  %i728 = load i8, ptr %i727, align 1, !tbaa !22
  %i729 = zext i8 %i728 to i32
  %i730 = add nuw nsw i32 %i726, %i729
  %i731 = getelementptr inbounds i8, ptr %arg, i64 %i594
  %i732 = load i8, ptr %i731, align 1, !tbaa !22
  %i733 = zext i8 %i732 to i32
  %i734 = add nuw nsw i32 %i730, %i733
  %i735 = udiv i32 %i734, 25
  %i736 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i631, i32 5
  store i32 %i735, ptr %i736, align 4, !tbaa !66
  %i737 = load i8, ptr %i651, align 1, !tbaa !22
  %i738 = zext i8 %i737 to i32
  %i739 = load i8, ptr %i671, align 1, !tbaa !22
  %i740 = zext i8 %i739 to i32
  %i741 = load i8, ptr %i691, align 1, !tbaa !22
  %i742 = zext i8 %i741 to i32
  %i743 = load i8, ptr %i711, align 1, !tbaa !22
  %i744 = zext i8 %i743 to i32
  %i745 = load i8, ptr %i731, align 1, !tbaa !22
  %i746 = zext i8 %i745 to i32
  %i747 = load i8, ptr %i636, align 1, !tbaa !22
  %i748 = zext i8 %i747 to i32
  %i749 = load i8, ptr %i655, align 1, !tbaa !22
  %i750 = zext i8 %i749 to i32
  %i751 = load i8, ptr %i675, align 1, !tbaa !22
  %i752 = zext i8 %i751 to i32
  %i753 = load i8, ptr %i695, align 1, !tbaa !22
  %i754 = zext i8 %i753 to i32
  %i755 = load i8, ptr %i715, align 1, !tbaa !22
  %i756 = zext i8 %i755 to i32
  %i757 = add nuw nsw i32 %i740, %i738
  %i758 = add nuw nsw i32 %i757, %i742
  %i759 = add nuw nsw i32 %i758, %i744
  %i760 = add nuw nsw i32 %i759, %i746
  %i761 = add nuw nsw i32 %i748, %i750
  %i762 = add nuw nsw i32 %i761, %i752
  %i763 = add nuw nsw i32 %i762, %i754
  %i764 = add nuw nsw i32 %i763, %i756
  %i765 = sub nsw i32 %i760, %i764
  %i766 = load i8, ptr %i647, align 1, !tbaa !22
  %i767 = zext i8 %i766 to i32
  %i768 = load i8, ptr %i667, align 1, !tbaa !22
  %i769 = zext i8 %i768 to i32
  %i770 = load i8, ptr %i687, align 1, !tbaa !22
  %i771 = zext i8 %i770 to i32
  %i772 = load i8, ptr %i707, align 1, !tbaa !22
  %i773 = zext i8 %i772 to i32
  %i774 = load i8, ptr %i727, align 1, !tbaa !22
  %i775 = zext i8 %i774 to i32
  %i776 = load i8, ptr %i639, align 1, !tbaa !22
  %i777 = zext i8 %i776 to i32
  %i778 = load i8, ptr %i659, align 1, !tbaa !22
  %i779 = zext i8 %i778 to i32
  %i780 = load i8, ptr %i679, align 1, !tbaa !22
  %i781 = zext i8 %i780 to i32
  %i782 = load i8, ptr %i699, align 1, !tbaa !22
  %i783 = zext i8 %i782 to i32
  %i784 = load i8, ptr %i719, align 1, !tbaa !22
  %i785 = zext i8 %i784 to i32
  %i786 = shl nsw i32 %i765, 1
  %i787 = add nuw nsw i32 %i769, %i767
  %i788 = add i32 %i787, %i786
  %i789 = add i32 %i788, %i771
  %i790 = add i32 %i789, %i773
  %i791 = add i32 %i790, %i775
  %i792 = add nuw nsw i32 %i777, %i779
  %i793 = add nuw nsw i32 %i792, %i781
  %i794 = add nuw nsw i32 %i793, %i783
  %i795 = add nuw nsw i32 %i794, %i785
  %i796 = sub i32 %i791, %i795
  %i797 = load i8, ptr %i723, align 1, !tbaa !22
  %i798 = zext i8 %i797 to i32
  %i799 = load i8, ptr %i643, align 1, !tbaa !22
  %i800 = zext i8 %i799 to i32
  %i801 = add nuw nsw i32 %i738, %i748
  %i802 = add nuw nsw i32 %i746, %i756
  %i803 = add nuw nsw i32 %i801, %i767
  %i804 = add nuw nsw i32 %i802, %i775
  %i805 = add nuw nsw i32 %i803, %i777
  %i806 = sub nsw i32 %i804, %i805
  %i807 = add nsw i32 %i806, %i785
  %i808 = add nsw i32 %i807, %i798
  %i809 = sub nsw i32 %i808, %i800
  %i810 = load i8, ptr %i703, align 1, !tbaa !22
  %i811 = zext i8 %i810 to i32
  %i812 = load i8, ptr %i663, align 1, !tbaa !22
  %i813 = zext i8 %i812 to i32
  %i814 = shl nsw i32 %i809, 1
  %i815 = add nuw nsw i32 %i740, %i750
  %i816 = add nuw nsw i32 %i744, %i754
  %i817 = add nuw nsw i32 %i815, %i769
  %i818 = add nuw nsw i32 %i816, %i773
  %i819 = add nuw nsw i32 %i817, %i779
  %i820 = sub nsw i32 %i818, %i819
  %i821 = add nsw i32 %i820, %i783
  %i822 = add nsw i32 %i821, %i811
  %i823 = sub nsw i32 %i822, %i813
  %i824 = add i32 %i823, %i814
  %i825 = sdiv i32 %i796, 15
  %i826 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i631, i32 3
  store i32 %i825, ptr %i826, align 4, !tbaa !64
  %i827 = sdiv i32 %i824, 15
  %i828 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i631, i32 4
  store i32 %i827, ptr %i828, align 4, !tbaa !65
  %i829 = add nsw i32 %i409, 1
  %i830 = icmp eq i32 %i829, 15000
  br i1 %i830, label %bb831, label %bb630.bb834_crit_edge

bb630.bb834_crit_edge:                            ; preds = %bb630
  br label %bb834

bb831:                                            ; preds = %bb630
  %i832 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i833 = tail call i64 @fwrite(ptr nonnull @.str.29, i64 18, i64 1, ptr %i832) #22
  tail call void @exit(i32 noundef 1) #23
  unreachable

bb834:                                            ; preds = %bb630.bb834_crit_edge, %bb626.bb834_crit_edge, %bb622.bb834_crit_edge, %bb618.bb834_crit_edge, %bb615.bb834_crit_edge, %bb611.bb834_crit_edge, %bb607.bb834_crit_edge, %bb602.bb834_crit_edge, %bb598.bb834_crit_edge, %bb593.bb834_crit_edge, %bb588.bb834_crit_edge, %bb585.bb834_crit_edge, %bb580.bb834_crit_edge, %bb575.bb834_crit_edge, %bb569.bb834_crit_edge, %bb565.bb834_crit_edge, %bb560.bb834_crit_edge, %bb555.bb834_crit_edge, %bb552.bb834_crit_edge, %bb547.bb834_crit_edge, %bb542.bb834_crit_edge, %bb536.bb834_crit_edge, %bb532.bb834_crit_edge, %bb527.bb834_crit_edge, %bb522.bb834_crit_edge, %bb517.bb834_crit_edge, %bb512.bb834_crit_edge, %bb508.bb834_crit_edge, %bb504.bb834_crit_edge, %bb499.bb834_crit_edge, %bb494.bb834_crit_edge, %bb491.bb834_crit_edge, %bb486.bb834_crit_edge, %bb481.bb834_crit_edge, %bb475.bb834_crit_edge, %bb471.bb834_crit_edge, %bb466.bb834_crit_edge, %bb461.bb834_crit_edge, %bb458.bb834_crit_edge, %bb453.bb834_crit_edge, %bb448.bb834_crit_edge, %bb442.bb834_crit_edge, %bb438.bb834_crit_edge, %bb434.bb834_crit_edge, %bb430.bb834_crit_edge, %bb427.bb834_crit_edge, %bb423.bb834_crit_edge, %bb419.bb834_crit_edge, %bb414.bb834_crit_edge, %bb407.bb834_crit_edge
  %i835 = phi i32 [ %i829, %bb630.bb834_crit_edge ], [ %i409, %bb626.bb834_crit_edge ], [ %i409, %bb622.bb834_crit_edge ], [ %i409, %bb618.bb834_crit_edge ], [ %i409, %bb615.bb834_crit_edge ], [ %i409, %bb611.bb834_crit_edge ], [ %i409, %bb607.bb834_crit_edge ], [ %i409, %bb602.bb834_crit_edge ], [ %i409, %bb598.bb834_crit_edge ], [ %i409, %bb593.bb834_crit_edge ], [ %i409, %bb588.bb834_crit_edge ], [ %i409, %bb585.bb834_crit_edge ], [ %i409, %bb580.bb834_crit_edge ], [ %i409, %bb575.bb834_crit_edge ], [ %i409, %bb569.bb834_crit_edge ], [ %i409, %bb565.bb834_crit_edge ], [ %i409, %bb560.bb834_crit_edge ], [ %i409, %bb555.bb834_crit_edge ], [ %i409, %bb552.bb834_crit_edge ], [ %i409, %bb547.bb834_crit_edge ], [ %i409, %bb542.bb834_crit_edge ], [ %i409, %bb536.bb834_crit_edge ], [ %i409, %bb532.bb834_crit_edge ], [ %i409, %bb527.bb834_crit_edge ], [ %i409, %bb522.bb834_crit_edge ], [ %i409, %bb517.bb834_crit_edge ], [ %i409, %bb512.bb834_crit_edge ], [ %i409, %bb508.bb834_crit_edge ], [ %i409, %bb504.bb834_crit_edge ], [ %i409, %bb499.bb834_crit_edge ], [ %i409, %bb494.bb834_crit_edge ], [ %i409, %bb491.bb834_crit_edge ], [ %i409, %bb486.bb834_crit_edge ], [ %i409, %bb481.bb834_crit_edge ], [ %i409, %bb475.bb834_crit_edge ], [ %i409, %bb471.bb834_crit_edge ], [ %i409, %bb466.bb834_crit_edge ], [ %i409, %bb461.bb834_crit_edge ], [ %i409, %bb458.bb834_crit_edge ], [ %i409, %bb453.bb834_crit_edge ], [ %i409, %bb448.bb834_crit_edge ], [ %i409, %bb442.bb834_crit_edge ], [ %i409, %bb438.bb834_crit_edge ], [ %i409, %bb434.bb834_crit_edge ], [ %i409, %bb430.bb834_crit_edge ], [ %i409, %bb427.bb834_crit_edge ], [ %i409, %bb423.bb834_crit_edge ], [ %i409, %bb419.bb834_crit_edge ], [ %i409, %bb414.bb834_crit_edge ], [ %i409, %bb407.bb834_crit_edge ]
  %i836 = add nuw nsw i64 %i408, 1
  %i837 = icmp eq i64 %i836, %i45
  br i1 %i837, label %bb838.loopexit, label %bb834.bb407_crit_edge, !llvm.loop !71

bb834.bb407_crit_edge:                            ; preds = %bb834
  br label %bb407

bb838.loopexit:                                   ; preds = %bb834
  br label %bb838

bb838:                                            ; preds = %bb387.bb838_crit_edge, %bb838.loopexit
  %i839 = phi i32 [ %i389, %bb387.bb838_crit_edge ], [ %i835, %bb838.loopexit ]
  %i840 = add nuw nsw i64 %i388, 1
  %i841 = icmp eq i64 %i840, %i44
  br i1 %i841, label %bb842, label %bb838.bb387_crit_edge, !llvm.loop !72

bb838.bb387_crit_edge:                            ; preds = %bb838
  br label %bb387

bb842:                                            ; preds = %bb838
  %i843 = sext i32 %i839 to i64
  br label %bb844

bb844:                                            ; preds = %bb32.bb844_crit_edge, %bb842
  %i845 = phi i64 [ 0, %bb32.bb844_crit_edge ], [ %i843, %bb842 ]
  %i846 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i845, i32 2
  store i32 7, ptr %i846, align 4, !tbaa !57
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @main1(i32 noundef %arg, ptr nocapture noundef readonly %arg1) local_unnamed_addr #0 {
bb:
  %i = alloca ptr, align 8
  %i2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %i4 = alloca [15000 x %struct.anon], align 16
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #21
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i2) #21
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i3) #21
  call void @llvm.lifetime.start.p0(i64 360000, ptr nonnull %i4) #21
  %i5 = icmp slt i32 %arg, 3
  br i1 %i5, label %bb6, label %bb7

bb6:                                              ; preds = %bb
  tail call void @usage()
  unreachable

bb7:                                              ; preds = %bb
  %i8 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i9 = load ptr, ptr %i8, align 8, !tbaa !8
  call void @get_image(ptr noundef %i9, ptr noundef nonnull %i, ptr noundef nonnull %i2, ptr noundef nonnull %i3)
  %i10 = icmp eq i32 %arg, 3
  br i1 %i10, label %bb7.bb74_crit_edge, label %bb11.preheader

bb7.bb74_crit_edge:                               ; preds = %bb7
  br label %bb74

bb11.preheader:                                   ; preds = %bb7
  br label %bb11

bb11:                                             ; preds = %bb62.bb11_crit_edge, %bb11.preheader
  %i12 = phi i32 [ %i71, %bb62.bb11_crit_edge ], [ 0, %bb11.preheader ]
  %i13 = phi float [ %i70, %bb62.bb11_crit_edge ], [ 4.000000e+00, %bb11.preheader ]
  %i14 = phi i32 [ %i69, %bb62.bb11_crit_edge ], [ 0, %bb11.preheader ]
  %i15 = phi i32 [ %i68, %bb62.bb11_crit_edge ], [ 0, %bb11.preheader ]
  %i16 = phi i32 [ %i67, %bb62.bb11_crit_edge ], [ 0, %bb11.preheader ]
  %i17 = phi i32 [ %i66, %bb62.bb11_crit_edge ], [ 1, %bb11.preheader ]
  %i18 = phi i32 [ %i65, %bb62.bb11_crit_edge ], [ 0, %bb11.preheader ]
  %i19 = phi i32 [ %i64, %bb62.bb11_crit_edge ], [ 20, %bb11.preheader ]
  %i20 = phi i32 [ %i72, %bb62.bb11_crit_edge ], [ 3, %bb11.preheader ]
  %i21 = sext i32 %i20 to i64
  %i22 = getelementptr inbounds ptr, ptr %arg1, i64 %i21
  %i23 = load ptr, ptr %i22, align 8, !tbaa !8
  %i24 = load i8, ptr %i23, align 1, !tbaa !22
  %i25 = icmp eq i8 %i24, 45
  br i1 %i25, label %bb26, label %bb61

bb26:                                             ; preds = %bb11
  %i27 = getelementptr inbounds i8, ptr %i23, i64 1
  %i28 = load i8, ptr %i27, align 1, !tbaa !22
  switch i8 %i28, label %bb26.bb62_crit_edge [
    i8 115, label %bb29
    i8 101, label %bb30
    i8 99, label %bb31
    i8 112, label %bb32
    i8 110, label %bb33
    i8 98, label %bb34
    i8 51, label %bb35
    i8 113, label %bb36
    i8 100, label %bb37
    i8 116, label %bb50
  ]

bb26.bb62_crit_edge:                              ; preds = %bb26
  br label %bb62

bb29:                                             ; preds = %bb26
  br label %bb62

bb30:                                             ; preds = %bb26
  br label %bb62

bb31:                                             ; preds = %bb26
  br label %bb62

bb32:                                             ; preds = %bb26
  br label %bb62

bb33:                                             ; preds = %bb26
  br label %bb62

bb34:                                             ; preds = %bb26
  br label %bb62

bb35:                                             ; preds = %bb26
  br label %bb62

bb36:                                             ; preds = %bb26
  br label %bb62

bb37:                                             ; preds = %bb26
  %i38 = add nsw i32 %i20, 1
  %i39 = icmp slt i32 %i38, %arg
  br i1 %i39, label %bb42, label %bb40

bb40:                                             ; preds = %bb37
  %i41 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.47)
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb42:                                             ; preds = %bb37
  %i43 = sext i32 %i38 to i64
  %i44 = getelementptr inbounds ptr, ptr %arg1, i64 %i43
  %i45 = load ptr, ptr %i44, align 8, !tbaa !8
  %i46 = tail call double @strtod(ptr nocapture noundef nonnull %i45, ptr noundef null) #21
  %i47 = fptrunc double %i46 to float
  %i48 = fcmp olt float %i47, 0.000000e+00
  br i1 %i48, label %bb49, label %bb42.bb62_crit_edge

bb42.bb62_crit_edge:                              ; preds = %bb42
  br label %bb62

bb49:                                             ; preds = %bb42
  br label %bb62

bb50:                                             ; preds = %bb26
  %i51 = add nsw i32 %i20, 1
  %i52 = icmp slt i32 %i51, %arg
  br i1 %i52, label %bb55, label %bb53

bb53:                                             ; preds = %bb50
  %i54 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.46)
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb55:                                             ; preds = %bb50
  %i56 = sext i32 %i51 to i64
  %i57 = getelementptr inbounds ptr, ptr %arg1, i64 %i56
  %i58 = load ptr, ptr %i57, align 8, !tbaa !8
  %i59 = tail call i64 @strtol(ptr nocapture noundef nonnull %i58, ptr noundef null, i32 noundef 10) #21
  %i60 = trunc i64 %i59 to i32
  br label %bb62

bb61:                                             ; preds = %bb11
  tail call void @usage()
  unreachable

bb62:                                             ; preds = %bb42.bb62_crit_edge, %bb26.bb62_crit_edge, %bb55, %bb49, %bb36, %bb35, %bb34, %bb33, %bb32, %bb31, %bb30, %bb29
  %i63 = phi i32 [ %i20, %bb26.bb62_crit_edge ], [ %i51, %bb55 ], [ %i38, %bb49 ], [ %i38, %bb42.bb62_crit_edge ], [ %i20, %bb36 ], [ %i20, %bb35 ], [ %i20, %bb34 ], [ %i20, %bb33 ], [ %i20, %bb32 ], [ %i20, %bb31 ], [ %i20, %bb30 ], [ %i20, %bb29 ]
  %i64 = phi i32 [ %i19, %bb26.bb62_crit_edge ], [ %i60, %bb55 ], [ %i19, %bb49 ], [ %i19, %bb42.bb62_crit_edge ], [ %i19, %bb36 ], [ %i19, %bb35 ], [ %i19, %bb34 ], [ %i19, %bb33 ], [ %i19, %bb32 ], [ %i19, %bb31 ], [ %i19, %bb30 ], [ %i19, %bb29 ]
  %i65 = phi i32 [ %i18, %bb26.bb62_crit_edge ], [ %i18, %bb55 ], [ %i18, %bb49 ], [ %i18, %bb42.bb62_crit_edge ], [ %i18, %bb36 ], [ %i18, %bb35 ], [ %i18, %bb34 ], [ %i18, %bb33 ], [ 1, %bb32 ], [ %i18, %bb31 ], [ %i18, %bb30 ], [ %i18, %bb29 ]
  %i66 = phi i32 [ %i17, %bb26.bb62_crit_edge ], [ %i17, %bb55 ], [ %i17, %bb49 ], [ %i17, %bb42.bb62_crit_edge ], [ %i17, %bb36 ], [ %i17, %bb35 ], [ %i17, %bb34 ], [ 0, %bb33 ], [ %i17, %bb32 ], [ %i17, %bb31 ], [ %i17, %bb30 ], [ %i17, %bb29 ]
  %i67 = phi i32 [ %i16, %bb26.bb62_crit_edge ], [ %i16, %bb55 ], [ 1, %bb49 ], [ %i16, %bb42.bb62_crit_edge ], [ %i16, %bb36 ], [ 1, %bb35 ], [ %i16, %bb34 ], [ %i16, %bb33 ], [ %i16, %bb32 ], [ %i16, %bb31 ], [ %i16, %bb30 ], [ %i16, %bb29 ]
  %i68 = phi i32 [ %i15, %bb26.bb62_crit_edge ], [ %i15, %bb55 ], [ %i15, %bb49 ], [ %i15, %bb42.bb62_crit_edge ], [ %i15, %bb36 ], [ %i15, %bb35 ], [ 1, %bb34 ], [ %i15, %bb33 ], [ %i15, %bb32 ], [ %i15, %bb31 ], [ %i15, %bb30 ], [ %i15, %bb29 ]
  %i69 = phi i32 [ %i14, %bb26.bb62_crit_edge ], [ %i14, %bb55 ], [ %i14, %bb49 ], [ %i14, %bb42.bb62_crit_edge ], [ 1, %bb36 ], [ %i14, %bb35 ], [ %i14, %bb34 ], [ %i14, %bb33 ], [ %i14, %bb32 ], [ %i14, %bb31 ], [ %i14, %bb30 ], [ %i14, %bb29 ]
  %i70 = phi float [ %i13, %bb26.bb62_crit_edge ], [ %i13, %bb55 ], [ %i47, %bb49 ], [ %i47, %bb42.bb62_crit_edge ], [ %i13, %bb36 ], [ %i13, %bb35 ], [ %i13, %bb34 ], [ %i13, %bb33 ], [ %i13, %bb32 ], [ %i13, %bb31 ], [ %i13, %bb30 ], [ %i13, %bb29 ]
  %i71 = phi i32 [ %i12, %bb26.bb62_crit_edge ], [ %i12, %bb55 ], [ %i12, %bb49 ], [ %i12, %bb42.bb62_crit_edge ], [ %i12, %bb36 ], [ %i12, %bb35 ], [ %i12, %bb34 ], [ %i12, %bb33 ], [ %i12, %bb32 ], [ 2, %bb31 ], [ 1, %bb30 ], [ 0, %bb29 ]
  %i72 = add nsw i32 %i63, 1
  %i73 = icmp slt i32 %i72, %arg
  br i1 %i73, label %bb62.bb11_crit_edge, label %bb74.loopexit, !llvm.loop !73

bb62.bb11_crit_edge:                              ; preds = %bb62
  br label %bb11

bb74.loopexit:                                    ; preds = %bb62
  br label %bb74

bb74:                                             ; preds = %bb7.bb74_crit_edge, %bb74.loopexit
  %i75 = phi i32 [ 20, %bb7.bb74_crit_edge ], [ %i64, %bb74.loopexit ]
  %i76 = phi i32 [ 0, %bb7.bb74_crit_edge ], [ %i65, %bb74.loopexit ]
  %i77 = phi i32 [ 1, %bb7.bb74_crit_edge ], [ %i66, %bb74.loopexit ]
  %i78 = phi i32 [ 0, %bb7.bb74_crit_edge ], [ %i67, %bb74.loopexit ]
  %i79 = phi i32 [ 0, %bb7.bb74_crit_edge ], [ %i68, %bb74.loopexit ]
  %i80 = phi i32 [ 0, %bb7.bb74_crit_edge ], [ %i69, %bb74.loopexit ]
  %i81 = phi float [ 4.000000e+00, %bb7.bb74_crit_edge ], [ %i70, %bb74.loopexit ]
  %i82 = phi i32 [ 0, %bb7.bb74_crit_edge ], [ %i71, %bb74.loopexit ]
  %i83 = icmp eq i32 %i76, 1
  %i84 = icmp eq i32 %i82, 0
  %i85 = select i1 %i83, i1 %i84, i1 false
  %i86 = select i1 %i85, i32 1, i32 %i82
  switch i32 %i86, label %bb345 [
    i32 0, label %bb87
    i32 1, label %bb109
    i32 2, label %bb235
  ]

bb87:                                             ; preds = %bb74
  %i88 = tail call noalias dereferenceable_or_null(516) ptr @malloc(i64 noundef 516) #24
  %i89 = getelementptr inbounds i8, ptr %i88, i64 258
  %i90 = sitofp i32 %i75 to float
  br label %bb91

bb91:                                             ; preds = %bb91.bb91_crit_edge, %bb87
  %i92 = phi i64 [ -256, %bb87 ], [ %i103, %bb91.bb91_crit_edge ]
  %i93 = trunc i64 %i92 to i32
  %i94 = sitofp i32 %i93 to float
  %i95 = fdiv float %i94, %i90
  %i96 = fpext float %i95 to double
  %i97 = fneg double %i96
  %i98 = fmul double %i97, %i96
  %i99 = tail call double @exp(double noundef %i98) #21
  %i100 = fmul double %i99, 1.000000e+02
  %i101 = fptoui double %i100 to i8
  %i102 = getelementptr inbounds i8, ptr %i89, i64 %i92
  store i8 %i101, ptr %i102, align 1, !tbaa !22
  %i103 = add nsw i64 %i92, 1
  %i104 = icmp eq i64 %i103, 257
  br i1 %i104, label %bb105, label %bb91.bb91_crit_edge, !llvm.loop !24

bb91.bb91_crit_edge:                              ; preds = %bb91
  br label %bb91

bb105:                                            ; preds = %bb91
  %i106 = load ptr, ptr %i, align 8, !tbaa !8
  %i107 = load i32, ptr %i2, align 4, !tbaa !19
  %i108 = load i32, ptr %i3, align 4, !tbaa !19
  tail call void @susan_smoothing(i32 noundef %i78, ptr noundef %i106, float noundef %i81, i32 noundef %i107, i32 noundef %i108, ptr noundef nonnull %i89)
  br label %bb346

bb109:                                            ; preds = %bb74
  %i110 = load i32, ptr %i2, align 4, !tbaa !19
  %i111 = load i32, ptr %i3, align 4, !tbaa !19
  %i112 = mul nsw i32 %i111, %i110
  %i113 = sext i32 %i112 to i64
  %i114 = shl nsw i64 %i113, 2
  %i115 = tail call noalias ptr @malloc(i64 noundef %i114) #24
  %i116 = tail call noalias dereferenceable_or_null(516) ptr @malloc(i64 noundef 516) #24
  %i117 = getelementptr inbounds i8, ptr %i116, i64 258
  %i118 = sitofp i32 %i75 to float
  br label %bb119

bb119:                                            ; preds = %bb119.bb119_crit_edge, %bb109
  %i120 = phi i64 [ -256, %bb109 ], [ %i133, %bb119.bb119_crit_edge ]
  %i121 = trunc i64 %i120 to i32
  %i122 = sitofp i32 %i121 to float
  %i123 = fdiv float %i122, %i118
  %i124 = fpext float %i123 to double
  %i125 = fmul double %i124, %i124
  %i126 = fmul double %i125, %i125
  %i127 = fneg double %i125
  %i128 = fmul double %i126, %i127
  %i129 = tail call double @exp(double noundef %i128) #21
  %i130 = fmul double %i129, 1.000000e+02
  %i131 = fptoui double %i130 to i8
  %i132 = getelementptr inbounds i8, ptr %i117, i64 %i120
  store i8 %i131, ptr %i132, align 1, !tbaa !22
  %i133 = add nsw i64 %i120, 1
  %i134 = icmp eq i64 %i133, 257
  br i1 %i134, label %bb135, label %bb119.bb119_crit_edge, !llvm.loop !24

bb119.bb119_crit_edge:                            ; preds = %bb119
  br label %bb119

bb135:                                            ; preds = %bb119
  %i136 = icmp eq i32 %i76, 0
  br i1 %i136, label %bb175, label %bb137

bb137:                                            ; preds = %bb135
  %i138 = icmp eq i32 %i78, 0
  %i139 = load ptr, ptr %i, align 8, !tbaa !8
  br i1 %i138, label %bb141, label %bb140

bb140:                                            ; preds = %bb137
  tail call void @susan_principle_small(ptr noundef %i139, ptr noundef %i115, ptr noundef nonnull %i117, i32 poison, i32 noundef %i110, i32 noundef %i111)
  br label %bb142

bb141:                                            ; preds = %bb137
  tail call void @susan_principle(ptr noundef %i139, ptr noundef %i115, ptr noundef nonnull %i117, i32 noundef 2650, i32 noundef %i110, i32 noundef %i111)
  br label %bb142

bb142:                                            ; preds = %bb141, %bb140
  %i143 = load ptr, ptr %i, align 8, !tbaa !8
  %i144 = load i32, ptr %i115, align 4, !tbaa !19
  %i145 = icmp sgt i32 %i112, 0
  br i1 %i145, label %bb146, label %bb142.bb158_crit_edge

bb142.bb158_crit_edge:                            ; preds = %bb142
  br label %bb158

bb146:                                            ; preds = %bb142
  %i147 = zext nneg i32 %i112 to i64
  br label %bb148

bb148:                                            ; preds = %bb148.bb148_crit_edge, %bb146
  %i149 = phi i64 [ 0, %bb146 ], [ %i156, %bb148.bb148_crit_edge ]
  %i150 = phi i32 [ %i144, %bb146 ], [ %i155, %bb148.bb148_crit_edge ]
  %i151 = phi i32 [ %i144, %bb146 ], [ %i154, %bb148.bb148_crit_edge ]
  %i152 = getelementptr inbounds i32, ptr %i115, i64 %i149
  %i153 = load i32, ptr %i152, align 4, !tbaa !19
  %i154 = tail call i32 @llvm.smax.i32(i32 %i153, i32 %i151)
  %i155 = tail call i32 @llvm.smin.i32(i32 %i153, i32 %i150)
  %i156 = add nuw nsw i64 %i149, 1
  %i157 = icmp eq i64 %i156, %i147
  br i1 %i157, label %bb158.loopexit, label %bb148.bb148_crit_edge, !llvm.loop !21

bb148.bb148_crit_edge:                            ; preds = %bb148
  br label %bb148

bb158.loopexit:                                   ; preds = %bb148
  br label %bb158

bb158:                                            ; preds = %bb142.bb158_crit_edge, %bb158.loopexit
  %i159 = phi i32 [ %i144, %bb142.bb158_crit_edge ], [ %i154, %bb158.loopexit ]
  %i160 = phi i32 [ %i144, %bb142.bb158_crit_edge ], [ %i155, %bb158.loopexit ]
  %i161 = sub nsw i32 %i159, %i160
  br i1 %i145, label %bb162, label %bb158.bb234_crit_edge

bb158.bb234_crit_edge:                            ; preds = %bb158
  br label %bb234

bb162:                                            ; preds = %bb158
  %i163 = zext nneg i32 %i112 to i64
  br label %bb164

bb164:                                            ; preds = %bb164.bb164_crit_edge, %bb162
  %i165 = phi i64 [ 0, %bb162 ], [ %i173, %bb164.bb164_crit_edge ]
  %i166 = getelementptr inbounds i32, ptr %i115, i64 %i165
  %i167 = load i32, ptr %i166, align 4, !tbaa !19
  %i168 = sub nsw i32 %i167, %i160
  %i169 = mul nsw i32 %i168, 255
  %i170 = sdiv i32 %i169, %i161
  %i171 = trunc i32 %i170 to i8
  %i172 = getelementptr inbounds i8, ptr %i143, i64 %i165
  store i8 %i171, ptr %i172, align 1, !tbaa !22
  %i173 = add nuw nsw i64 %i165, 1
  %i174 = icmp eq i64 %i173, %i163
  br i1 %i174, label %bb234.loopexit, label %bb164.bb164_crit_edge, !llvm.loop !23

bb164.bb164_crit_edge:                            ; preds = %bb164
  br label %bb164

bb175:                                            ; preds = %bb135
  %i176 = tail call noalias ptr @malloc(i64 noundef %i113) #24
  tail call void @llvm.memset.p0.i64(ptr align 1 %i176, i8 100, i64 %i113, i1 false)
  %i177 = icmp eq i32 %i78, 0
  %i178 = load ptr, ptr %i, align 8, !tbaa !8
  br i1 %i177, label %bb180, label %bb179

bb179:                                            ; preds = %bb175
  tail call void @susan_edges_small(ptr noundef %i178, ptr noundef %i115, ptr noundef %i176, ptr noundef nonnull %i117, i32 poison, i32 noundef %i110, i32 noundef %i111)
  br label %bb181

bb180:                                            ; preds = %bb175
  tail call void @susan_edges(ptr noundef %i178, ptr noundef %i115, ptr noundef %i176, ptr noundef nonnull %i117, i32 noundef 2650, i32 noundef %i110, i32 noundef %i111)
  br label %bb181

bb181:                                            ; preds = %bb180, %bb179
  %i182 = icmp eq i32 %i77, 0
  br i1 %i182, label %bb181.bb184_crit_edge, label %bb183

bb181.bb184_crit_edge:                            ; preds = %bb181
  br label %bb184

bb183:                                            ; preds = %bb181
  tail call void @susan_thin(ptr noundef %i115, ptr noundef %i176, i32 noundef %i110, i32 noundef %i111)
  br label %bb184

bb184:                                            ; preds = %bb181.bb184_crit_edge, %bb183
  %i185 = load ptr, ptr %i, align 8, !tbaa !8
  %i186 = icmp eq i32 %i79, 0
  %i187 = icmp sgt i32 %i112, 0
  %i188 = and i1 %i186, %i187
  br i1 %i188, label %bb189, label %bb184.bb216_crit_edge

bb184.bb216_crit_edge:                            ; preds = %bb184
  br label %bb216

bb189:                                            ; preds = %bb184
  %i190 = ptrtoint ptr %i176 to i64
  %i191 = sext i32 %i110 to i64
  %i192 = sub nsw i64 0, %i191
  %i193 = getelementptr i8, ptr %i185, i64 %i192
  %i194 = add nsw i32 %i110, -2
  %i195 = sext i32 %i194 to i64
  br label %bb196

bb196:                                            ; preds = %bb212.bb196_crit_edge, %bb189
  %i197 = phi ptr [ %i176, %bb189 ], [ %i213, %bb212.bb196_crit_edge ]
  %i198 = phi i32 [ 0, %bb189 ], [ %i214, %bb212.bb196_crit_edge ]
  %i199 = load i8, ptr %i197, align 1, !tbaa !22
  %i200 = icmp ult i8 %i199, 8
  br i1 %i200, label %bb201, label %bb196.bb212_crit_edge

bb196.bb212_crit_edge:                            ; preds = %bb196
  br label %bb212

bb201:                                            ; preds = %bb196
  %i202 = ptrtoint ptr %i197 to i64
  %i203 = sub i64 %i202, %i190
  %i204 = getelementptr i8, ptr %i193, i64 %i203
  %i205 = getelementptr inbounds i8, ptr %i204, i64 -1
  store i8 -1, ptr %i205, align 1, !tbaa !22
  %i206 = getelementptr inbounds i8, ptr %i204, i64 1
  store i8 -1, ptr %i204, align 1, !tbaa !22
  store i8 -1, ptr %i206, align 1, !tbaa !22
  %i207 = getelementptr inbounds i8, ptr %i206, i64 %i195
  store i8 -1, ptr %i207, align 1, !tbaa !22
  %i208 = getelementptr inbounds i8, ptr %i207, i64 2
  store i8 -1, ptr %i208, align 1, !tbaa !22
  %i209 = getelementptr inbounds i8, ptr %i208, i64 %i195
  %i210 = getelementptr inbounds i8, ptr %i209, i64 1
  store i8 -1, ptr %i209, align 1, !tbaa !22
  %i211 = getelementptr inbounds i8, ptr %i209, i64 2
  store i8 -1, ptr %i210, align 1, !tbaa !22
  store i8 -1, ptr %i211, align 1, !tbaa !22
  br label %bb212

bb212:                                            ; preds = %bb196.bb212_crit_edge, %bb201
  %i213 = getelementptr inbounds i8, ptr %i197, i64 1
  %i214 = add nuw nsw i32 %i198, 1
  %i215 = icmp eq i32 %i214, %i112
  br i1 %i215, label %bb216.loopexit, label %bb212.bb196_crit_edge, !llvm.loop !43

bb212.bb196_crit_edge:                            ; preds = %bb212
  br label %bb196

bb216.loopexit:                                   ; preds = %bb212
  br label %bb216

bb216:                                            ; preds = %bb184.bb216_crit_edge, %bb216.loopexit
  %i217 = icmp sgt i32 %i112, 0
  br i1 %i217, label %bb218, label %bb216.bb233_crit_edge

bb216.bb233_crit_edge:                            ; preds = %bb216
  br label %bb233

bb218:                                            ; preds = %bb216
  %i219 = ptrtoint ptr %i176 to i64
  br label %bb220

bb220:                                            ; preds = %bb229.bb220_crit_edge, %bb218
  %i221 = phi ptr [ %i176, %bb218 ], [ %i230, %bb229.bb220_crit_edge ]
  %i222 = phi i32 [ 0, %bb218 ], [ %i231, %bb229.bb220_crit_edge ]
  %i223 = load i8, ptr %i221, align 1, !tbaa !22
  %i224 = icmp ult i8 %i223, 8
  br i1 %i224, label %bb225, label %bb220.bb229_crit_edge

bb220.bb229_crit_edge:                            ; preds = %bb220
  br label %bb229

bb225:                                            ; preds = %bb220
  %i226 = ptrtoint ptr %i221 to i64
  %i227 = sub i64 %i226, %i219
  %i228 = getelementptr inbounds i8, ptr %i185, i64 %i227
  store i8 0, ptr %i228, align 1, !tbaa !22
  br label %bb229

bb229:                                            ; preds = %bb220.bb229_crit_edge, %bb225
  %i230 = getelementptr inbounds i8, ptr %i221, i64 1
  %i231 = add nuw nsw i32 %i222, 1
  %i232 = icmp eq i32 %i231, %i112
  br i1 %i232, label %bb233.loopexit, label %bb229.bb220_crit_edge, !llvm.loop !44

bb229.bb220_crit_edge:                            ; preds = %bb229
  br label %bb220

bb233.loopexit:                                   ; preds = %bb229
  br label %bb233

bb233:                                            ; preds = %bb216.bb233_crit_edge, %bb233.loopexit
  tail call void @free(ptr noundef %i176) #21
  br label %bb234

bb234.loopexit:                                   ; preds = %bb164
  br label %bb234

bb234:                                            ; preds = %bb158.bb234_crit_edge, %bb234.loopexit, %bb233
  tail call void @free(ptr noundef %i116) #21
  br label %bb346

bb235:                                            ; preds = %bb74
  %i236 = load i32, ptr %i2, align 4, !tbaa !19
  %i237 = load i32, ptr %i3, align 4, !tbaa !19
  %i238 = mul nsw i32 %i237, %i236
  %i239 = sext i32 %i238 to i64
  %i240 = shl nsw i64 %i239, 2
  %i241 = tail call noalias ptr @malloc(i64 noundef %i240) #24
  %i242 = tail call noalias dereferenceable_or_null(516) ptr @malloc(i64 noundef 516) #24
  %i243 = getelementptr inbounds i8, ptr %i242, i64 258
  %i244 = sitofp i32 %i75 to float
  br label %bb245

bb245:                                            ; preds = %bb245.bb245_crit_edge, %bb235
  %i246 = phi i64 [ -256, %bb235 ], [ %i259, %bb245.bb245_crit_edge ]
  %i247 = trunc i64 %i246 to i32
  %i248 = sitofp i32 %i247 to float
  %i249 = fdiv float %i248, %i244
  %i250 = fpext float %i249 to double
  %i251 = fmul double %i250, %i250
  %i252 = fmul double %i251, %i251
  %i253 = fneg double %i251
  %i254 = fmul double %i252, %i253
  %i255 = tail call double @exp(double noundef %i254) #21
  %i256 = fmul double %i255, 1.000000e+02
  %i257 = fptoui double %i256 to i8
  %i258 = getelementptr inbounds i8, ptr %i243, i64 %i246
  store i8 %i257, ptr %i258, align 1, !tbaa !22
  %i259 = add nsw i64 %i246, 1
  %i260 = icmp eq i64 %i259, 257
  br i1 %i260, label %bb261, label %bb245.bb245_crit_edge, !llvm.loop !24

bb245.bb245_crit_edge:                            ; preds = %bb245
  br label %bb245

bb261:                                            ; preds = %bb245
  %i262 = icmp eq i32 %i76, 0
  br i1 %i262, label %bb296, label %bb263

bb263:                                            ; preds = %bb261
  %i264 = load ptr, ptr %i, align 8, !tbaa !8
  tail call void @susan_principle(ptr noundef %i264, ptr noundef %i241, ptr noundef nonnull %i243, i32 noundef 1850, i32 noundef %i236, i32 noundef %i237)
  %i265 = load i32, ptr %i241, align 4, !tbaa !19
  %i266 = icmp sgt i32 %i238, 0
  br i1 %i266, label %bb267, label %bb263.bb279_crit_edge

bb263.bb279_crit_edge:                            ; preds = %bb263
  br label %bb279

bb267:                                            ; preds = %bb263
  %i268 = zext nneg i32 %i238 to i64
  br label %bb269

bb269:                                            ; preds = %bb269.bb269_crit_edge, %bb267
  %i270 = phi i64 [ 0, %bb267 ], [ %i277, %bb269.bb269_crit_edge ]
  %i271 = phi i32 [ %i265, %bb267 ], [ %i276, %bb269.bb269_crit_edge ]
  %i272 = phi i32 [ %i265, %bb267 ], [ %i275, %bb269.bb269_crit_edge ]
  %i273 = getelementptr inbounds i32, ptr %i241, i64 %i270
  %i274 = load i32, ptr %i273, align 4, !tbaa !19
  %i275 = tail call i32 @llvm.smax.i32(i32 %i274, i32 %i272)
  %i276 = tail call i32 @llvm.smin.i32(i32 %i274, i32 %i271)
  %i277 = add nuw nsw i64 %i270, 1
  %i278 = icmp eq i64 %i277, %i268
  br i1 %i278, label %bb279.loopexit, label %bb269.bb269_crit_edge, !llvm.loop !21

bb269.bb269_crit_edge:                            ; preds = %bb269
  br label %bb269

bb279.loopexit:                                   ; preds = %bb269
  br label %bb279

bb279:                                            ; preds = %bb263.bb279_crit_edge, %bb279.loopexit
  %i280 = phi i32 [ %i265, %bb263.bb279_crit_edge ], [ %i275, %bb279.loopexit ]
  %i281 = phi i32 [ %i265, %bb263.bb279_crit_edge ], [ %i276, %bb279.loopexit ]
  %i282 = sub nsw i32 %i280, %i281
  br i1 %i266, label %bb283, label %bb279.bb344_crit_edge

bb279.bb344_crit_edge:                            ; preds = %bb279
  br label %bb344

bb283:                                            ; preds = %bb279
  %i284 = zext nneg i32 %i238 to i64
  br label %bb285

bb285:                                            ; preds = %bb285.bb285_crit_edge, %bb283
  %i286 = phi i64 [ 0, %bb283 ], [ %i294, %bb285.bb285_crit_edge ]
  %i287 = getelementptr inbounds i32, ptr %i241, i64 %i286
  %i288 = load i32, ptr %i287, align 4, !tbaa !19
  %i289 = sub nsw i32 %i288, %i281
  %i290 = mul nsw i32 %i289, 255
  %i291 = sdiv i32 %i290, %i282
  %i292 = trunc i32 %i291 to i8
  %i293 = getelementptr inbounds i8, ptr %i264, i64 %i286
  store i8 %i292, ptr %i293, align 1, !tbaa !22
  %i294 = add nuw nsw i64 %i286, 1
  %i295 = icmp eq i64 %i294, %i284
  br i1 %i295, label %bb344.loopexit1, label %bb285.bb285_crit_edge, !llvm.loop !23

bb285.bb285_crit_edge:                            ; preds = %bb285
  br label %bb285

bb296:                                            ; preds = %bb261
  %i297 = icmp eq i32 %i80, 0
  %i298 = load ptr, ptr %i, align 8, !tbaa !8
  br i1 %i297, label %bb300, label %bb299

bb299:                                            ; preds = %bb296
  call void @susan_corners_quick(ptr noundef %i298, ptr noundef %i241, ptr noundef nonnull %i243, i32 noundef 1850, ptr noundef nonnull %i4, i32 noundef %i236, i32 noundef %i237)
  br label %bb301

bb300:                                            ; preds = %bb296
  call void @susan_corners(ptr noundef %i298, ptr noundef %i241, ptr noundef nonnull %i243, i32 noundef 1850, ptr noundef nonnull %i4, i32 noundef %i236, i32 noundef %i237)
  br label %bb301

bb301:                                            ; preds = %bb300, %bb299
  %i302 = load ptr, ptr %i, align 8, !tbaa !8
  %i303 = getelementptr inbounds %struct.anon, ptr %i4, i64 0, i32 2
  %i304 = load i32, ptr %i303, align 8, !tbaa !57
  %i305 = icmp eq i32 %i304, 7
  br i1 %i305, label %bb301.bb344_crit_edge, label %bb306

bb301.bb344_crit_edge:                            ; preds = %bb301
  br label %bb344

bb306:                                            ; preds = %bb301
  %i307 = icmp eq i32 %i79, 0
  %i308 = add nsw i32 %i236, -2
  %i309 = sext i32 %i308 to i64
  br label %bb310

bb310:                                            ; preds = %bb338.bb310_crit_edge, %bb306
  %i311 = phi i64 [ 0, %bb306 ], [ %i339, %bb338.bb310_crit_edge ]
  %i312 = phi ptr [ %i4, %bb306 ], [ %i340, %bb338.bb310_crit_edge ]
  %i313 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i311, i32 1
  %i314 = load i32, ptr %i313, align 4, !tbaa !59
  br i1 %i307, label %bb315, label %bb331

bb315:                                            ; preds = %bb310
  %i316 = add nsw i32 %i314, -1
  %i317 = mul nsw i32 %i316, %i236
  %i318 = sext i32 %i317 to i64
  %i319 = getelementptr inbounds i8, ptr %i302, i64 %i318
  %i320 = load i32, ptr %i312, align 4, !tbaa !60
  %i321 = sext i32 %i320 to i64
  %i322 = getelementptr inbounds i8, ptr %i319, i64 %i321
  %i323 = getelementptr inbounds i8, ptr %i322, i64 -1
  store i8 -1, ptr %i323, align 1, !tbaa !22
  %i324 = getelementptr inbounds i8, ptr %i322, i64 1
  store i8 -1, ptr %i322, align 1, !tbaa !22
  store i8 -1, ptr %i324, align 1, !tbaa !22
  %i325 = getelementptr inbounds i8, ptr %i324, i64 %i309
  %i326 = getelementptr inbounds i8, ptr %i325, i64 1
  store i8 -1, ptr %i325, align 1, !tbaa !22
  %i327 = getelementptr inbounds i8, ptr %i325, i64 2
  store i8 0, ptr %i326, align 1, !tbaa !22
  store i8 -1, ptr %i327, align 1, !tbaa !22
  %i328 = getelementptr inbounds i8, ptr %i327, i64 %i309
  %i329 = getelementptr inbounds i8, ptr %i328, i64 1
  store i8 -1, ptr %i328, align 1, !tbaa !22
  %i330 = getelementptr inbounds i8, ptr %i328, i64 2
  store i8 -1, ptr %i329, align 1, !tbaa !22
  store i8 -1, ptr %i330, align 1, !tbaa !22
  br label %bb338

bb331:                                            ; preds = %bb310
  %i332 = mul nsw i32 %i314, %i236
  %i333 = sext i32 %i332 to i64
  %i334 = getelementptr inbounds i8, ptr %i302, i64 %i333
  %i335 = load i32, ptr %i312, align 4, !tbaa !60
  %i336 = sext i32 %i335 to i64
  %i337 = getelementptr inbounds i8, ptr %i334, i64 %i336
  store i8 0, ptr %i337, align 1, !tbaa !22
  br label %bb338

bb338:                                            ; preds = %bb331, %bb315
  %i339 = add nuw nsw i64 %i311, 1
  %i340 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i339
  %i341 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i339, i32 2
  %i342 = load i32, ptr %i341, align 8, !tbaa !57
  %i343 = icmp eq i32 %i342, 7
  br i1 %i343, label %bb344.loopexit, label %bb338.bb310_crit_edge, !llvm.loop !61

bb338.bb310_crit_edge:                            ; preds = %bb338
  br label %bb310

bb344.loopexit:                                   ; preds = %bb338
  br label %bb344

bb344.loopexit1:                                  ; preds = %bb285
  br label %bb344

bb344:                                            ; preds = %bb301.bb344_crit_edge, %bb279.bb344_crit_edge, %bb344.loopexit1, %bb344.loopexit
  tail call void @free(ptr noundef %i242) #21
  br label %bb346

bb345:                                            ; preds = %bb74
  unreachable

bb346:                                            ; preds = %bb344, %bb234, %bb105
  %i347 = phi ptr [ %i241, %bb344 ], [ %i115, %bb234 ], [ %i88, %bb105 ]
  tail call void @free(ptr noundef %i347) #21
  %i348 = getelementptr inbounds ptr, ptr %arg1, i64 2
  %i349 = load ptr, ptr %i348, align 8, !tbaa !8
  %i350 = load ptr, ptr %i, align 8, !tbaa !8
  %i351 = load i32, ptr %i2, align 4, !tbaa !19
  %i352 = load i32, ptr %i3, align 4, !tbaa !19
  tail call void @put_image(ptr noundef %i349, ptr noundef %i350, i32 noundef %i351, i32 noundef %i352)
  tail call void @free(ptr noundef %i350) #21
  call void @llvm.lifetime.end.p0(i64 360000, ptr nonnull %i4) #21
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i3) #21
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i2) #21
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #21
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn
declare double @strtod(ptr noundef readonly, ptr nocapture noundef) local_unnamed_addr #20

; Function Attrs: mustprogress nofree nounwind willreturn
declare i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #20

attributes #0 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { nofree nounwind memory(write, argmem: readwrite, inaccessiblemem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nofree nounwind willreturn memory(write) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #16 = { nofree norecurse nosync nounwind memory(argmem: read) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #19 = { nofree nounwind memory(readwrite, inaccessiblemem: write) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #20 = { mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #21 = { nounwind }
attributes #22 = { cold }
attributes #23 = { noreturn nounwind }
attributes #24 = { nounwind allocsize(0) }

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
!9 = !{!"any pointer", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = distinct !{!14, !15, !16}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !16}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !10, i64 0}
!21 = distinct !{!21, !15, !16}
!22 = !{!10, !10, i64 0}
!23 = distinct !{!23, !15, !16}
!24 = distinct !{!24, !15, !16}
!25 = distinct !{!25, !15, !16}
!26 = distinct !{!26, !15, !16}
!27 = distinct !{!27, !15, !16}
!28 = distinct !{!28, !15, !16}
!29 = distinct !{!29, !15, !16}
!30 = distinct !{!30, !15, !16}
!31 = distinct !{!31, !15, !16}
!32 = distinct !{!32, !15, !16}
!33 = distinct !{!33, !15, !16}
!34 = distinct !{!34, !15, !16}
!35 = distinct !{!35, !15, !16}
!36 = distinct !{!36, !15, !16}
!37 = distinct !{!37, !15, !16}
!38 = distinct !{!38, !15, !16}
!39 = distinct !{!39, !15, !16}
!40 = distinct !{!40, !15, !16}
!41 = distinct !{!41, !15, !16}
!42 = distinct !{!42, !15, !16}
!43 = distinct !{!43, !15, !16}
!44 = distinct !{!44, !15, !16}
!45 = distinct !{!45, !15, !16}
!46 = distinct !{!46, !15, !16}
!47 = distinct !{!47, !15, !16}
!48 = distinct !{!48, !15, !16}
!49 = distinct !{!49, !15, !16}
!50 = distinct !{!50, !15, !16}
!51 = distinct !{!51, !15, !16}
!52 = distinct !{!52, !15, !16}
!53 = distinct !{!53, !15, !16}
!54 = distinct !{!54, !15, !16}
!55 = distinct !{!55, !15, !16}
!56 = distinct !{!56, !15, !16}
!57 = !{!58, !20, i64 8}
!58 = !{!"", !20, i64 0, !20, i64 4, !20, i64 8, !20, i64 12, !20, i64 16, !20, i64 20}
!59 = !{!58, !20, i64 4}
!60 = !{!58, !20, i64 0}
!61 = distinct !{!61, !15, !16}
!62 = distinct !{!62, !15, !16}
!63 = distinct !{!63, !15, !16}
!64 = !{!58, !20, i64 12}
!65 = !{!58, !20, i64 16}
!66 = !{!58, !20, i64 20}
!67 = distinct !{!67, !15, !16}
!68 = distinct !{!68, !15, !16}
!69 = distinct !{!69, !15, !16}
!70 = distinct !{!70, !15, !16}
!71 = distinct !{!71, !15, !16}
!72 = distinct !{!72, !15, !16}
!73 = distinct !{!73, !15, !16}
