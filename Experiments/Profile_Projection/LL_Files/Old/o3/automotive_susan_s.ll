; ModuleID = 'automotive_susan_s.ll'
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

bb17:                                             ; preds = %bb17.loopexit, %bb7.bb17_crit_edge, %bb4
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
  %i1 = tail call i32 @getc(ptr noundef %arg)
  br label %bb2

bb2:                                              ; preds = %bb12, %bb
  %i3 = phi i32 [ %i1, %bb ], [ %i13, %bb12 ]
  switch i32 %i3, label %bb9 [
    i32 35, label %bb4
    i32 -1, label %bb6
  ]

bb4:                                              ; preds = %bb2
  %i5 = call ptr @fgets(ptr noundef nonnull %i, i32 noundef 9000, ptr noundef %arg)
  br label %bb12

bb6:                                              ; preds = %bb2
  %i7 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i7, ptr noundef nonnull @.str.13, ptr noundef nonnull @.str.14) #22
  call void @exit(i32 noundef 0) #23
  unreachable

bb9:                                              ; preds = %bb2
  %i10 = add i32 %i3, -48
  %i11 = icmp ult i32 %i10, 10
  br i1 %i11, label %bb14.preheader, label %bb9.bb12_crit_edge

bb9.bb12_crit_edge:                               ; preds = %bb9
  br label %bb12

bb14.preheader:                                   ; preds = %bb9
  br label %bb14

bb12:                                             ; preds = %bb9.bb12_crit_edge, %bb4
  %i13 = call i32 @getc(ptr noundef %arg)
  br label %bb2

bb14:                                             ; preds = %bb14.bb14_crit_edge, %bb14.preheader
  %i15 = phi i32 [ %i20, %bb14.bb14_crit_edge ], [ %i3, %bb14.preheader ]
  %i16 = phi i32 [ %i19, %bb14.bb14_crit_edge ], [ 0, %bb14.preheader ]
  %i17 = mul nsw i32 %i16, 10
  %i18 = add nsw i32 %i15, -48
  %i19 = add nsw i32 %i18, %i17
  %i20 = call i32 @getc(ptr noundef %arg)
  %i21 = add i32 %i20, -58
  %i22 = icmp ult i32 %i21, -10
  br i1 %i22, label %bb23, label %bb14.bb14_crit_edge

bb14.bb14_crit_edge:                              ; preds = %bb14
  br label %bb14

bb23:                                             ; preds = %bb14
  call void @llvm.lifetime.end.p0(i64 10000, ptr nonnull %i) #21
  ret i32 %i19
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
  store i32 %i20, ptr %arg2, align 4, !tbaa !16
  %i21 = tail call i32 @getint(ptr noundef nonnull %i)
  store i32 %i21, ptr %arg3, align 4, !tbaa !16
  %i22 = tail call i32 @getint(ptr noundef nonnull %i)
  %i23 = load i32, ptr %arg2, align 4, !tbaa !16
  %i24 = load i32, ptr %arg3, align 4, !tbaa !16
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
  %i = icmp sgt i32 %arg2, 0
  br i1 %i, label %bb3, label %bb.bb97_crit_edge

bb.bb97_crit_edge:                                ; preds = %bb
  br label %bb97

bb3:                                              ; preds = %bb
  %i4 = load i32, ptr %arg, align 4, !tbaa !16
  %i5 = zext nneg i32 %arg2 to i64
  %i6 = and i64 %i5, 3
  %i7 = icmp ult i32 %arg2, 4
  br i1 %i7, label %bb3.bb37_crit_edge, label %bb8

bb3.bb37_crit_edge:                               ; preds = %bb3
  br label %bb37

bb8:                                              ; preds = %bb3
  %i9 = and i64 %i5, 2147483644
  br label %bb10

bb10:                                             ; preds = %bb10.bb10_crit_edge, %bb8
  %i11 = phi i64 [ 0, %bb8 ], [ %i34, %bb10.bb10_crit_edge ]
  %i12 = phi i32 [ %i4, %bb8 ], [ %i33, %bb10.bb10_crit_edge ]
  %i13 = phi i32 [ %i4, %bb8 ], [ %i32, %bb10.bb10_crit_edge ]
  %i14 = phi i64 [ 0, %bb8 ], [ %i35, %bb10.bb10_crit_edge ]
  %i15 = getelementptr inbounds i32, ptr %arg, i64 %i11
  %i16 = load i32, ptr %i15, align 4, !tbaa !16
  %i17 = tail call i32 @llvm.smax.i32(i32 %i16, i32 %i13)
  %i18 = tail call i32 @llvm.smin.i32(i32 %i16, i32 %i12)
  %i19 = or disjoint i64 %i11, 1
  %i20 = getelementptr inbounds i32, ptr %arg, i64 %i19
  %i21 = load i32, ptr %i20, align 4, !tbaa !16
  %i22 = tail call i32 @llvm.smax.i32(i32 %i21, i32 %i17)
  %i23 = tail call i32 @llvm.smin.i32(i32 %i21, i32 %i18)
  %i24 = or disjoint i64 %i11, 2
  %i25 = getelementptr inbounds i32, ptr %arg, i64 %i24
  %i26 = load i32, ptr %i25, align 4, !tbaa !16
  %i27 = tail call i32 @llvm.smax.i32(i32 %i26, i32 %i22)
  %i28 = tail call i32 @llvm.smin.i32(i32 %i26, i32 %i23)
  %i29 = or disjoint i64 %i11, 3
  %i30 = getelementptr inbounds i32, ptr %arg, i64 %i29
  %i31 = load i32, ptr %i30, align 4, !tbaa !16
  %i32 = tail call i32 @llvm.smax.i32(i32 %i31, i32 %i27)
  %i33 = tail call i32 @llvm.smin.i32(i32 %i31, i32 %i28)
  %i34 = add nuw nsw i64 %i11, 4
  %i35 = add i64 %i14, 4
  %i36 = icmp eq i64 %i35, %i9
  br i1 %i36, label %bb37.loopexit, label %bb10.bb10_crit_edge, !llvm.loop !18

bb10.bb10_crit_edge:                              ; preds = %bb10
  br label %bb10

bb37.loopexit:                                    ; preds = %bb10
  br label %bb37

bb37:                                             ; preds = %bb37.loopexit, %bb3.bb37_crit_edge
  %i38 = phi i32 [ undef, %bb3.bb37_crit_edge ], [ %i32, %bb37.loopexit ]
  %i39 = phi i32 [ undef, %bb3.bb37_crit_edge ], [ %i33, %bb37.loopexit ]
  %i40 = phi i64 [ 0, %bb3.bb37_crit_edge ], [ %i34, %bb37.loopexit ]
  %i41 = phi i32 [ %i4, %bb3.bb37_crit_edge ], [ %i33, %bb37.loopexit ]
  %i42 = phi i32 [ %i4, %bb3.bb37_crit_edge ], [ %i32, %bb37.loopexit ]
  %i43 = icmp eq i64 %i6, 0
  br i1 %i43, label %bb37.bb56_crit_edge, label %bb44.preheader

bb37.bb56_crit_edge:                              ; preds = %bb37
  br label %bb56

bb44.preheader:                                   ; preds = %bb37
  br label %bb44

bb44:                                             ; preds = %bb44.bb44_crit_edge, %bb44.preheader
  %i45 = phi i64 [ %i53, %bb44.bb44_crit_edge ], [ %i40, %bb44.preheader ]
  %i46 = phi i32 [ %i52, %bb44.bb44_crit_edge ], [ %i41, %bb44.preheader ]
  %i47 = phi i32 [ %i51, %bb44.bb44_crit_edge ], [ %i42, %bb44.preheader ]
  %i48 = phi i64 [ %i54, %bb44.bb44_crit_edge ], [ 0, %bb44.preheader ]
  %i49 = getelementptr inbounds i32, ptr %arg, i64 %i45
  %i50 = load i32, ptr %i49, align 4, !tbaa !16
  %i51 = tail call i32 @llvm.smax.i32(i32 %i50, i32 %i47)
  %i52 = tail call i32 @llvm.smin.i32(i32 %i50, i32 %i46)
  %i53 = add nuw nsw i64 %i45, 1
  %i54 = add i64 %i48, 1
  %i55 = icmp eq i64 %i54, %i6
  br i1 %i55, label %bb56.loopexit, label %bb44.bb44_crit_edge, !llvm.loop !19

bb44.bb44_crit_edge:                              ; preds = %bb44
  br label %bb44

bb56.loopexit:                                    ; preds = %bb44
  br label %bb56

bb56:                                             ; preds = %bb56.loopexit, %bb37.bb56_crit_edge
  %i57 = phi i32 [ %i38, %bb37.bb56_crit_edge ], [ %i51, %bb56.loopexit ]
  %i58 = phi i32 [ %i39, %bb37.bb56_crit_edge ], [ %i52, %bb56.loopexit ]
  %i59 = sub nsw i32 %i57, %i58
  br i1 %i, label %bb60, label %bb56.bb97_crit_edge

bb56.bb97_crit_edge:                              ; preds = %bb56
  br label %bb97

bb60:                                             ; preds = %bb56
  %i61 = and i64 %i5, 1
  %i62 = icmp eq i32 %arg2, 1
  br i1 %i62, label %bb60.bb86_crit_edge, label %bb63

bb60.bb86_crit_edge:                              ; preds = %bb60
  br label %bb86

bb63:                                             ; preds = %bb60
  %i64 = and i64 %i5, 2147483646
  br label %bb65

bb65:                                             ; preds = %bb65.bb65_crit_edge, %bb63
  %i66 = phi i64 [ 0, %bb63 ], [ %i83, %bb65.bb65_crit_edge ]
  %i67 = phi i64 [ 0, %bb63 ], [ %i84, %bb65.bb65_crit_edge ]
  %i68 = getelementptr inbounds i32, ptr %arg, i64 %i66
  %i69 = load i32, ptr %i68, align 4, !tbaa !16
  %i70 = sub nsw i32 %i69, %i58
  %i71 = mul nsw i32 %i70, 255
  %i72 = sdiv i32 %i71, %i59
  %i73 = trunc i32 %i72 to i8
  %i74 = getelementptr inbounds i8, ptr %arg1, i64 %i66
  store i8 %i73, ptr %i74, align 1, !tbaa !21
  %i75 = or disjoint i64 %i66, 1
  %i76 = getelementptr inbounds i32, ptr %arg, i64 %i75
  %i77 = load i32, ptr %i76, align 4, !tbaa !16
  %i78 = sub nsw i32 %i77, %i58
  %i79 = mul nsw i32 %i78, 255
  %i80 = sdiv i32 %i79, %i59
  %i81 = trunc i32 %i80 to i8
  %i82 = getelementptr inbounds i8, ptr %arg1, i64 %i75
  store i8 %i81, ptr %i82, align 1, !tbaa !21
  %i83 = add nuw nsw i64 %i66, 2
  %i84 = add i64 %i67, 2
  %i85 = icmp eq i64 %i84, %i64
  br i1 %i85, label %bb86.loopexit, label %bb65.bb65_crit_edge, !llvm.loop !22

bb65.bb65_crit_edge:                              ; preds = %bb65
  br label %bb65

bb86.loopexit:                                    ; preds = %bb65
  br label %bb86

bb86:                                             ; preds = %bb86.loopexit, %bb60.bb86_crit_edge
  %i87 = phi i64 [ 0, %bb60.bb86_crit_edge ], [ %i83, %bb86.loopexit ]
  %i88 = icmp eq i64 %i61, 0
  br i1 %i88, label %bb86.bb97_crit_edge, label %bb89

bb86.bb97_crit_edge:                              ; preds = %bb86
  br label %bb97

bb89:                                             ; preds = %bb86
  %i90 = getelementptr inbounds i32, ptr %arg, i64 %i87
  %i91 = load i32, ptr %i90, align 4, !tbaa !16
  %i92 = sub nsw i32 %i91, %i58
  %i93 = mul nsw i32 %i92, 255
  %i94 = sdiv i32 %i93, %i59
  %i95 = trunc i32 %i94 to i8
  %i96 = getelementptr inbounds i8, ptr %arg1, i64 %i87
  store i8 %i95, ptr %i96, align 1, !tbaa !21
  br label %bb97

bb97:                                             ; preds = %bb89, %bb86.bb97_crit_edge, %bb56.bb97_crit_edge, %bb.bb97_crit_edge
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
  br i1 %i5, label %bb6.preheader, label %bb23.preheader

bb23.preheader:                                   ; preds = %bb
  br label %bb23

bb6.preheader:                                    ; preds = %bb
  br label %bb6

bb6:                                              ; preds = %bb6.bb6_crit_edge, %bb6.preheader
  %i7 = phi i64 [ %i21, %bb6.bb6_crit_edge ], [ -256, %bb6.preheader ]
  %i8 = trunc i64 %i7 to i32
  %i9 = sitofp i32 %i8 to float
  %i10 = fdiv float %i9, %i4
  %i11 = fpext float %i10 to double
  %i12 = fmul double %i11, %i11
  %i13 = fmul double %i12, %i12
  %i14 = fneg double %i12
  %i15 = fmul double %i13, %i14
  %i16 = tail call double @exp(double noundef %i15) #21
  %i17 = fmul double %i16, 1.000000e+02
  %i18 = fptoui double %i17 to i8
  %i19 = load ptr, ptr %arg, align 8, !tbaa !8
  %i20 = getelementptr inbounds i8, ptr %i19, i64 %i7
  store i8 %i18, ptr %i20, align 1, !tbaa !21
  %i21 = add nsw i64 %i7, 1
  %i22 = icmp eq i64 %i21, 257
  br i1 %i22, label %bb38.loopexit, label %bb6.bb6_crit_edge, !llvm.loop !23

bb6.bb6_crit_edge:                                ; preds = %bb6
  br label %bb6

bb23:                                             ; preds = %bb23.bb23_crit_edge, %bb23.preheader
  %i24 = phi i64 [ %i36, %bb23.bb23_crit_edge ], [ -256, %bb23.preheader ]
  %i25 = trunc i64 %i24 to i32
  %i26 = sitofp i32 %i25 to float
  %i27 = fdiv float %i26, %i4
  %i28 = fpext float %i27 to double
  %i29 = fneg double %i28
  %i30 = fmul double %i29, %i28
  %i31 = tail call double @exp(double noundef %i30) #21
  %i32 = fmul double %i31, 1.000000e+02
  %i33 = fptoui double %i32 to i8
  %i34 = load ptr, ptr %arg, align 8, !tbaa !8
  %i35 = getelementptr inbounds i8, ptr %i34, i64 %i24
  store i8 %i33, ptr %i35, align 1, !tbaa !21
  %i36 = add nsw i64 %i24, 1
  %i37 = icmp eq i64 %i36, 257
  br i1 %i37, label %bb38.loopexit1, label %bb23.bb23_crit_edge, !llvm.loop !23

bb23.bb23_crit_edge:                              ; preds = %bb23
  br label %bb23

bb38.loopexit:                                    ; preds = %bb6
  br label %bb38

bb38.loopexit1:                                   ; preds = %bb23
  br label %bb38

bb38:                                             ; preds = %bb38.loopexit1, %bb38.loopexit
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare double @exp(double noundef) local_unnamed_addr #11

; Function Attrs: mustprogress nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) uwtable
define dso_local void @free_brightness_lut(ptr nocapture noundef %arg) local_unnamed_addr #12 {
bb:
  %i = getelementptr inbounds i8, ptr %arg, i64 -258
  tail call void @free(ptr noundef nonnull %i) #21
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
  %i8 = add i32 %arg5, -3
  %i9 = icmp sgt i32 %arg5, 6
  br i1 %i9, label %bb10, label %bb.bb335_crit_edge

bb.bb335_crit_edge:                               ; preds = %bb
  br label %bb335

bb10:                                             ; preds = %bb
  %i11 = add i32 %arg4, -3
  %i12 = icmp sgt i32 %arg4, 6
  %i13 = sext i32 %i11 to i64
  %i14 = add nsw i32 %arg4, -5
  %i15 = sext i32 %i14 to i64
  %i16 = add nsw i32 %arg4, -6
  %i17 = sext i32 %i16 to i64
  br i1 %i12, label %bb18, label %bb10.bb335_crit_edge

bb10.bb335_crit_edge:                             ; preds = %bb10
  br label %bb335

bb18:                                             ; preds = %bb10
  %i19 = zext nneg i32 %arg4 to i64
  %i20 = zext nneg i32 %i8 to i64
  %i21 = zext i32 %i11 to i64
  br label %bb22

bb22:                                             ; preds = %bb332.bb22_crit_edge, %bb18
  %i23 = phi i64 [ 3, %bb18 ], [ %i333, %bb332.bb22_crit_edge ]
  %i24 = add nsw i64 %i23, -3
  %i25 = mul nsw i64 %i24, %i19
  %i26 = getelementptr inbounds i8, ptr %arg, i64 %i25
  %i27 = trunc i64 %i23 to i32
  %i28 = mul i32 %i27, %arg4
  %i29 = zext i32 %i28 to i64
  br label %bb30

bb30:                                             ; preds = %bb329.bb30_crit_edge, %bb22
  %i31 = phi i64 [ 3, %bb22 ], [ %i330, %bb329.bb30_crit_edge ]
  %i32 = getelementptr inbounds i8, ptr %i26, i64 %i31
  %i33 = getelementptr inbounds i8, ptr %i32, i64 -1
  %i34 = add nuw nsw i64 %i31, %i29
  %i35 = getelementptr inbounds i8, ptr %arg, i64 %i34
  %i36 = load i8, ptr %i35, align 1, !tbaa !21
  %i37 = zext i8 %i36 to i64
  %i38 = getelementptr inbounds i8, ptr %arg2, i64 %i37
  %i39 = load i8, ptr %i33, align 1, !tbaa !21
  %i40 = zext i8 %i39 to i64
  %i41 = sub nsw i64 0, %i40
  %i42 = getelementptr inbounds i8, ptr %i38, i64 %i41
  %i43 = load i8, ptr %i42, align 1, !tbaa !21
  %i44 = zext i8 %i43 to i32
  %i45 = add nuw nsw i32 %i44, 100
  %i46 = getelementptr inbounds i8, ptr %i32, i64 1
  %i47 = load i8, ptr %i32, align 1, !tbaa !21
  %i48 = zext i8 %i47 to i64
  %i49 = sub nsw i64 0, %i48
  %i50 = getelementptr inbounds i8, ptr %i38, i64 %i49
  %i51 = load i8, ptr %i50, align 1, !tbaa !21
  %i52 = zext i8 %i51 to i32
  %i53 = add nuw nsw i32 %i45, %i52
  %i54 = load i8, ptr %i46, align 1, !tbaa !21
  %i55 = zext i8 %i54 to i64
  %i56 = sub nsw i64 0, %i55
  %i57 = getelementptr inbounds i8, ptr %i38, i64 %i56
  %i58 = load i8, ptr %i57, align 1, !tbaa !21
  %i59 = zext i8 %i58 to i32
  %i60 = add nuw nsw i32 %i53, %i59
  %i61 = getelementptr inbounds i8, ptr %i46, i64 %i13
  %i62 = getelementptr inbounds i8, ptr %i61, i64 1
  %i63 = load i8, ptr %i61, align 1, !tbaa !21
  %i64 = zext i8 %i63 to i64
  %i65 = sub nsw i64 0, %i64
  %i66 = getelementptr inbounds i8, ptr %i38, i64 %i65
  %i67 = load i8, ptr %i66, align 1, !tbaa !21
  %i68 = zext i8 %i67 to i32
  %i69 = add nuw nsw i32 %i60, %i68
  %i70 = getelementptr inbounds i8, ptr %i61, i64 2
  %i71 = load i8, ptr %i62, align 1, !tbaa !21
  %i72 = zext i8 %i71 to i64
  %i73 = sub nsw i64 0, %i72
  %i74 = getelementptr inbounds i8, ptr %i38, i64 %i73
  %i75 = load i8, ptr %i74, align 1, !tbaa !21
  %i76 = zext i8 %i75 to i32
  %i77 = add nuw nsw i32 %i69, %i76
  %i78 = getelementptr inbounds i8, ptr %i61, i64 3
  %i79 = load i8, ptr %i70, align 1, !tbaa !21
  %i80 = zext i8 %i79 to i64
  %i81 = sub nsw i64 0, %i80
  %i82 = getelementptr inbounds i8, ptr %i38, i64 %i81
  %i83 = load i8, ptr %i82, align 1, !tbaa !21
  %i84 = zext i8 %i83 to i32
  %i85 = add nuw nsw i32 %i77, %i84
  %i86 = getelementptr inbounds i8, ptr %i61, i64 4
  %i87 = load i8, ptr %i78, align 1, !tbaa !21
  %i88 = zext i8 %i87 to i64
  %i89 = sub nsw i64 0, %i88
  %i90 = getelementptr inbounds i8, ptr %i38, i64 %i89
  %i91 = load i8, ptr %i90, align 1, !tbaa !21
  %i92 = zext i8 %i91 to i32
  %i93 = add nuw nsw i32 %i85, %i92
  %i94 = load i8, ptr %i86, align 1, !tbaa !21
  %i95 = zext i8 %i94 to i64
  %i96 = sub nsw i64 0, %i95
  %i97 = getelementptr inbounds i8, ptr %i38, i64 %i96
  %i98 = load i8, ptr %i97, align 1, !tbaa !21
  %i99 = zext i8 %i98 to i32
  %i100 = add nuw nsw i32 %i93, %i99
  %i101 = getelementptr inbounds i8, ptr %i86, i64 %i15
  %i102 = getelementptr inbounds i8, ptr %i101, i64 1
  %i103 = load i8, ptr %i101, align 1, !tbaa !21
  %i104 = zext i8 %i103 to i64
  %i105 = sub nsw i64 0, %i104
  %i106 = getelementptr inbounds i8, ptr %i38, i64 %i105
  %i107 = load i8, ptr %i106, align 1, !tbaa !21
  %i108 = zext i8 %i107 to i32
  %i109 = add nuw nsw i32 %i100, %i108
  %i110 = getelementptr inbounds i8, ptr %i101, i64 2
  %i111 = load i8, ptr %i102, align 1, !tbaa !21
  %i112 = zext i8 %i111 to i64
  %i113 = sub nsw i64 0, %i112
  %i114 = getelementptr inbounds i8, ptr %i38, i64 %i113
  %i115 = load i8, ptr %i114, align 1, !tbaa !21
  %i116 = zext i8 %i115 to i32
  %i117 = add nuw nsw i32 %i109, %i116
  %i118 = getelementptr inbounds i8, ptr %i101, i64 3
  %i119 = load i8, ptr %i110, align 1, !tbaa !21
  %i120 = zext i8 %i119 to i64
  %i121 = sub nsw i64 0, %i120
  %i122 = getelementptr inbounds i8, ptr %i38, i64 %i121
  %i123 = load i8, ptr %i122, align 1, !tbaa !21
  %i124 = zext i8 %i123 to i32
  %i125 = add nuw nsw i32 %i117, %i124
  %i126 = getelementptr inbounds i8, ptr %i101, i64 4
  %i127 = load i8, ptr %i118, align 1, !tbaa !21
  %i128 = zext i8 %i127 to i64
  %i129 = sub nsw i64 0, %i128
  %i130 = getelementptr inbounds i8, ptr %i38, i64 %i129
  %i131 = load i8, ptr %i130, align 1, !tbaa !21
  %i132 = zext i8 %i131 to i32
  %i133 = add nuw nsw i32 %i125, %i132
  %i134 = getelementptr inbounds i8, ptr %i101, i64 5
  %i135 = load i8, ptr %i126, align 1, !tbaa !21
  %i136 = zext i8 %i135 to i64
  %i137 = sub nsw i64 0, %i136
  %i138 = getelementptr inbounds i8, ptr %i38, i64 %i137
  %i139 = load i8, ptr %i138, align 1, !tbaa !21
  %i140 = zext i8 %i139 to i32
  %i141 = add nuw nsw i32 %i133, %i140
  %i142 = getelementptr inbounds i8, ptr %i101, i64 6
  %i143 = load i8, ptr %i134, align 1, !tbaa !21
  %i144 = zext i8 %i143 to i64
  %i145 = sub nsw i64 0, %i144
  %i146 = getelementptr inbounds i8, ptr %i38, i64 %i145
  %i147 = load i8, ptr %i146, align 1, !tbaa !21
  %i148 = zext i8 %i147 to i32
  %i149 = add nuw nsw i32 %i141, %i148
  %i150 = load i8, ptr %i142, align 1, !tbaa !21
  %i151 = zext i8 %i150 to i64
  %i152 = sub nsw i64 0, %i151
  %i153 = getelementptr inbounds i8, ptr %i38, i64 %i152
  %i154 = load i8, ptr %i153, align 1, !tbaa !21
  %i155 = zext i8 %i154 to i32
  %i156 = add nuw nsw i32 %i149, %i155
  %i157 = getelementptr inbounds i8, ptr %i142, i64 %i17
  %i158 = getelementptr inbounds i8, ptr %i157, i64 1
  %i159 = load i8, ptr %i157, align 1, !tbaa !21
  %i160 = zext i8 %i159 to i64
  %i161 = sub nsw i64 0, %i160
  %i162 = getelementptr inbounds i8, ptr %i38, i64 %i161
  %i163 = load i8, ptr %i162, align 1, !tbaa !21
  %i164 = zext i8 %i163 to i32
  %i165 = add nuw nsw i32 %i156, %i164
  %i166 = getelementptr inbounds i8, ptr %i157, i64 2
  %i167 = load i8, ptr %i158, align 1, !tbaa !21
  %i168 = zext i8 %i167 to i64
  %i169 = sub nsw i64 0, %i168
  %i170 = getelementptr inbounds i8, ptr %i38, i64 %i169
  %i171 = load i8, ptr %i170, align 1, !tbaa !21
  %i172 = zext i8 %i171 to i32
  %i173 = add nuw nsw i32 %i165, %i172
  %i174 = load i8, ptr %i166, align 1, !tbaa !21
  %i175 = zext i8 %i174 to i64
  %i176 = sub nsw i64 0, %i175
  %i177 = getelementptr inbounds i8, ptr %i38, i64 %i176
  %i178 = load i8, ptr %i177, align 1, !tbaa !21
  %i179 = zext i8 %i178 to i32
  %i180 = add nuw nsw i32 %i173, %i179
  %i181 = getelementptr inbounds i8, ptr %i157, i64 4
  %i182 = getelementptr inbounds i8, ptr %i157, i64 5
  %i183 = load i8, ptr %i181, align 1, !tbaa !21
  %i184 = zext i8 %i183 to i64
  %i185 = sub nsw i64 0, %i184
  %i186 = getelementptr inbounds i8, ptr %i38, i64 %i185
  %i187 = load i8, ptr %i186, align 1, !tbaa !21
  %i188 = zext i8 %i187 to i32
  %i189 = add nuw nsw i32 %i180, %i188
  %i190 = getelementptr inbounds i8, ptr %i157, i64 6
  %i191 = load i8, ptr %i182, align 1, !tbaa !21
  %i192 = zext i8 %i191 to i64
  %i193 = sub nsw i64 0, %i192
  %i194 = getelementptr inbounds i8, ptr %i38, i64 %i193
  %i195 = load i8, ptr %i194, align 1, !tbaa !21
  %i196 = zext i8 %i195 to i32
  %i197 = add nuw nsw i32 %i189, %i196
  %i198 = load i8, ptr %i190, align 1, !tbaa !21
  %i199 = zext i8 %i198 to i64
  %i200 = sub nsw i64 0, %i199
  %i201 = getelementptr inbounds i8, ptr %i38, i64 %i200
  %i202 = load i8, ptr %i201, align 1, !tbaa !21
  %i203 = zext i8 %i202 to i32
  %i204 = add nuw nsw i32 %i197, %i203
  %i205 = getelementptr inbounds i8, ptr %i190, i64 %i17
  %i206 = getelementptr inbounds i8, ptr %i205, i64 1
  %i207 = load i8, ptr %i205, align 1, !tbaa !21
  %i208 = zext i8 %i207 to i64
  %i209 = sub nsw i64 0, %i208
  %i210 = getelementptr inbounds i8, ptr %i38, i64 %i209
  %i211 = load i8, ptr %i210, align 1, !tbaa !21
  %i212 = zext i8 %i211 to i32
  %i213 = add nuw nsw i32 %i204, %i212
  %i214 = getelementptr inbounds i8, ptr %i205, i64 2
  %i215 = load i8, ptr %i206, align 1, !tbaa !21
  %i216 = zext i8 %i215 to i64
  %i217 = sub nsw i64 0, %i216
  %i218 = getelementptr inbounds i8, ptr %i38, i64 %i217
  %i219 = load i8, ptr %i218, align 1, !tbaa !21
  %i220 = zext i8 %i219 to i32
  %i221 = add nuw nsw i32 %i213, %i220
  %i222 = getelementptr inbounds i8, ptr %i205, i64 3
  %i223 = load i8, ptr %i214, align 1, !tbaa !21
  %i224 = zext i8 %i223 to i64
  %i225 = sub nsw i64 0, %i224
  %i226 = getelementptr inbounds i8, ptr %i38, i64 %i225
  %i227 = load i8, ptr %i226, align 1, !tbaa !21
  %i228 = zext i8 %i227 to i32
  %i229 = add nuw nsw i32 %i221, %i228
  %i230 = getelementptr inbounds i8, ptr %i205, i64 4
  %i231 = load i8, ptr %i222, align 1, !tbaa !21
  %i232 = zext i8 %i231 to i64
  %i233 = sub nsw i64 0, %i232
  %i234 = getelementptr inbounds i8, ptr %i38, i64 %i233
  %i235 = load i8, ptr %i234, align 1, !tbaa !21
  %i236 = zext i8 %i235 to i32
  %i237 = add nuw nsw i32 %i229, %i236
  %i238 = getelementptr inbounds i8, ptr %i205, i64 5
  %i239 = load i8, ptr %i230, align 1, !tbaa !21
  %i240 = zext i8 %i239 to i64
  %i241 = sub nsw i64 0, %i240
  %i242 = getelementptr inbounds i8, ptr %i38, i64 %i241
  %i243 = load i8, ptr %i242, align 1, !tbaa !21
  %i244 = zext i8 %i243 to i32
  %i245 = add nuw nsw i32 %i237, %i244
  %i246 = getelementptr inbounds i8, ptr %i205, i64 6
  %i247 = load i8, ptr %i238, align 1, !tbaa !21
  %i248 = zext i8 %i247 to i64
  %i249 = sub nsw i64 0, %i248
  %i250 = getelementptr inbounds i8, ptr %i38, i64 %i249
  %i251 = load i8, ptr %i250, align 1, !tbaa !21
  %i252 = zext i8 %i251 to i32
  %i253 = add nuw nsw i32 %i245, %i252
  %i254 = load i8, ptr %i246, align 1, !tbaa !21
  %i255 = zext i8 %i254 to i64
  %i256 = sub nsw i64 0, %i255
  %i257 = getelementptr inbounds i8, ptr %i38, i64 %i256
  %i258 = load i8, ptr %i257, align 1, !tbaa !21
  %i259 = zext i8 %i258 to i32
  %i260 = add nuw nsw i32 %i253, %i259
  %i261 = getelementptr inbounds i8, ptr %i246, i64 %i15
  %i262 = getelementptr inbounds i8, ptr %i261, i64 1
  %i263 = load i8, ptr %i261, align 1, !tbaa !21
  %i264 = zext i8 %i263 to i64
  %i265 = sub nsw i64 0, %i264
  %i266 = getelementptr inbounds i8, ptr %i38, i64 %i265
  %i267 = load i8, ptr %i266, align 1, !tbaa !21
  %i268 = zext i8 %i267 to i32
  %i269 = add nuw nsw i32 %i260, %i268
  %i270 = getelementptr inbounds i8, ptr %i261, i64 2
  %i271 = load i8, ptr %i262, align 1, !tbaa !21
  %i272 = zext i8 %i271 to i64
  %i273 = sub nsw i64 0, %i272
  %i274 = getelementptr inbounds i8, ptr %i38, i64 %i273
  %i275 = load i8, ptr %i274, align 1, !tbaa !21
  %i276 = zext i8 %i275 to i32
  %i277 = add nuw nsw i32 %i269, %i276
  %i278 = getelementptr inbounds i8, ptr %i261, i64 3
  %i279 = load i8, ptr %i270, align 1, !tbaa !21
  %i280 = zext i8 %i279 to i64
  %i281 = sub nsw i64 0, %i280
  %i282 = getelementptr inbounds i8, ptr %i38, i64 %i281
  %i283 = load i8, ptr %i282, align 1, !tbaa !21
  %i284 = zext i8 %i283 to i32
  %i285 = add nuw nsw i32 %i277, %i284
  %i286 = getelementptr inbounds i8, ptr %i261, i64 4
  %i287 = load i8, ptr %i278, align 1, !tbaa !21
  %i288 = zext i8 %i287 to i64
  %i289 = sub nsw i64 0, %i288
  %i290 = getelementptr inbounds i8, ptr %i38, i64 %i289
  %i291 = load i8, ptr %i290, align 1, !tbaa !21
  %i292 = zext i8 %i291 to i32
  %i293 = add nuw nsw i32 %i285, %i292
  %i294 = load i8, ptr %i286, align 1, !tbaa !21
  %i295 = zext i8 %i294 to i64
  %i296 = sub nsw i64 0, %i295
  %i297 = getelementptr inbounds i8, ptr %i38, i64 %i296
  %i298 = load i8, ptr %i297, align 1, !tbaa !21
  %i299 = zext i8 %i298 to i32
  %i300 = add nuw nsw i32 %i293, %i299
  %i301 = getelementptr inbounds i8, ptr %i286, i64 %i13
  %i302 = getelementptr inbounds i8, ptr %i301, i64 1
  %i303 = load i8, ptr %i301, align 1, !tbaa !21
  %i304 = zext i8 %i303 to i64
  %i305 = sub nsw i64 0, %i304
  %i306 = getelementptr inbounds i8, ptr %i38, i64 %i305
  %i307 = load i8, ptr %i306, align 1, !tbaa !21
  %i308 = zext i8 %i307 to i32
  %i309 = add nuw nsw i32 %i300, %i308
  %i310 = getelementptr inbounds i8, ptr %i301, i64 2
  %i311 = load i8, ptr %i302, align 1, !tbaa !21
  %i312 = zext i8 %i311 to i64
  %i313 = sub nsw i64 0, %i312
  %i314 = getelementptr inbounds i8, ptr %i38, i64 %i313
  %i315 = load i8, ptr %i314, align 1, !tbaa !21
  %i316 = zext i8 %i315 to i32
  %i317 = add nuw nsw i32 %i309, %i316
  %i318 = load i8, ptr %i310, align 1, !tbaa !21
  %i319 = zext i8 %i318 to i64
  %i320 = sub nsw i64 0, %i319
  %i321 = getelementptr inbounds i8, ptr %i38, i64 %i320
  %i322 = load i8, ptr %i321, align 1, !tbaa !21
  %i323 = zext i8 %i322 to i32
  %i324 = add nuw nsw i32 %i317, %i323
  %i325 = icmp sgt i32 %i324, %arg3
  br i1 %i325, label %bb30.bb329_crit_edge, label %bb326

bb30.bb329_crit_edge:                             ; preds = %bb30
  br label %bb329

bb326:                                            ; preds = %bb30
  %i327 = sub nsw i32 %arg3, %i324
  %i328 = getelementptr inbounds i32, ptr %arg1, i64 %i34
  store i32 %i327, ptr %i328, align 4, !tbaa !16
  br label %bb329

bb329:                                            ; preds = %bb326, %bb30.bb329_crit_edge
  %i330 = add nuw nsw i64 %i31, 1
  %i331 = icmp eq i64 %i330, %i21
  br i1 %i331, label %bb332, label %bb329.bb30_crit_edge, !llvm.loop !24

bb329.bb30_crit_edge:                             ; preds = %bb329
  br label %bb30

bb332:                                            ; preds = %bb329
  %i333 = add nuw nsw i64 %i23, 1
  %i334 = icmp eq i64 %i333, %i20
  br i1 %i334, label %bb335.loopexit, label %bb332.bb22_crit_edge, !llvm.loop !25

bb332.bb22_crit_edge:                             ; preds = %bb332
  br label %bb22

bb335.loopexit:                                   ; preds = %bb332
  br label %bb335

bb335:                                            ; preds = %bb335.loopexit, %bb10.bb335_crit_edge, %bb.bb335_crit_edge
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #15

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable
define dso_local void @susan_principle_small(ptr nocapture noundef readonly %arg, ptr nocapture noundef writeonly %arg1, ptr nocapture noundef readonly %arg2, i32 noundef %arg3, i32 noundef %arg4, i32 noundef %arg5) local_unnamed_addr #14 {
bb:
  %i = mul nsw i32 %arg5, %arg4
  %i6 = sext i32 %i to i64
  %i7 = shl nsw i64 %i6, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %arg1, i8 0, i64 %i7, i1 false)
  %i8 = add i32 %arg5, -1
  %i9 = icmp sgt i32 %arg5, 2
  br i1 %i9, label %bb10, label %bb.bb108_crit_edge

bb.bb108_crit_edge:                               ; preds = %bb
  br label %bb108

bb10:                                             ; preds = %bb
  %i11 = icmp sgt i32 %arg4, 2
  %i12 = add nsw i32 %arg4, -2
  %i13 = sext i32 %i12 to i64
  br i1 %i11, label %bb14, label %bb10.bb108_crit_edge

bb10.bb108_crit_edge:                             ; preds = %bb10
  br label %bb108

bb14:                                             ; preds = %bb10
  %i15 = add nsw i32 %arg4, -1
  %i16 = zext nneg i32 %arg4 to i64
  %i17 = zext nneg i32 %i8 to i64
  %i18 = zext i32 %i15 to i64
  br label %bb19

bb19:                                             ; preds = %bb105.bb19_crit_edge, %bb14
  %i20 = phi i64 [ 1, %bb14 ], [ %i106, %bb105.bb19_crit_edge ]
  %i21 = add nsw i64 %i20, -1
  %i22 = mul nsw i64 %i21, %i16
  %i23 = getelementptr inbounds i8, ptr %arg, i64 %i22
  %i24 = trunc i64 %i20 to i32
  %i25 = mul i32 %i24, %arg4
  %i26 = zext i32 %i25 to i64
  br label %bb27

bb27:                                             ; preds = %bb102.bb27_crit_edge, %bb19
  %i28 = phi i64 [ 1, %bb19 ], [ %i103, %bb102.bb27_crit_edge ]
  %i29 = getelementptr inbounds i8, ptr %i23, i64 %i28
  %i30 = getelementptr inbounds i8, ptr %i29, i64 -1
  %i31 = add nuw nsw i64 %i28, %i26
  %i32 = getelementptr inbounds i8, ptr %arg, i64 %i31
  %i33 = load i8, ptr %i32, align 1, !tbaa !21
  %i34 = zext i8 %i33 to i64
  %i35 = getelementptr inbounds i8, ptr %arg2, i64 %i34
  %i36 = load i8, ptr %i30, align 1, !tbaa !21
  %i37 = zext i8 %i36 to i64
  %i38 = sub nsw i64 0, %i37
  %i39 = getelementptr inbounds i8, ptr %i35, i64 %i38
  %i40 = load i8, ptr %i39, align 1, !tbaa !21
  %i41 = zext i8 %i40 to i32
  %i42 = add nuw nsw i32 %i41, 100
  %i43 = getelementptr inbounds i8, ptr %i29, i64 1
  %i44 = load i8, ptr %i29, align 1, !tbaa !21
  %i45 = zext i8 %i44 to i64
  %i46 = sub nsw i64 0, %i45
  %i47 = getelementptr inbounds i8, ptr %i35, i64 %i46
  %i48 = load i8, ptr %i47, align 1, !tbaa !21
  %i49 = zext i8 %i48 to i32
  %i50 = add nuw nsw i32 %i42, %i49
  %i51 = load i8, ptr %i43, align 1, !tbaa !21
  %i52 = zext i8 %i51 to i64
  %i53 = sub nsw i64 0, %i52
  %i54 = getelementptr inbounds i8, ptr %i35, i64 %i53
  %i55 = load i8, ptr %i54, align 1, !tbaa !21
  %i56 = zext i8 %i55 to i32
  %i57 = add nuw nsw i32 %i50, %i56
  %i58 = getelementptr inbounds i8, ptr %i43, i64 %i13
  %i59 = load i8, ptr %i58, align 1, !tbaa !21
  %i60 = zext i8 %i59 to i64
  %i61 = sub nsw i64 0, %i60
  %i62 = getelementptr inbounds i8, ptr %i35, i64 %i61
  %i63 = load i8, ptr %i62, align 1, !tbaa !21
  %i64 = zext i8 %i63 to i32
  %i65 = add nuw nsw i32 %i57, %i64
  %i66 = getelementptr inbounds i8, ptr %i58, i64 2
  %i67 = load i8, ptr %i66, align 1, !tbaa !21
  %i68 = zext i8 %i67 to i64
  %i69 = sub nsw i64 0, %i68
  %i70 = getelementptr inbounds i8, ptr %i35, i64 %i69
  %i71 = load i8, ptr %i70, align 1, !tbaa !21
  %i72 = zext i8 %i71 to i32
  %i73 = add nuw nsw i32 %i65, %i72
  %i74 = getelementptr inbounds i8, ptr %i66, i64 %i13
  %i75 = getelementptr inbounds i8, ptr %i74, i64 1
  %i76 = load i8, ptr %i74, align 1, !tbaa !21
  %i77 = zext i8 %i76 to i64
  %i78 = sub nsw i64 0, %i77
  %i79 = getelementptr inbounds i8, ptr %i35, i64 %i78
  %i80 = load i8, ptr %i79, align 1, !tbaa !21
  %i81 = zext i8 %i80 to i32
  %i82 = add nuw nsw i32 %i73, %i81
  %i83 = getelementptr inbounds i8, ptr %i74, i64 2
  %i84 = load i8, ptr %i75, align 1, !tbaa !21
  %i85 = zext i8 %i84 to i64
  %i86 = sub nsw i64 0, %i85
  %i87 = getelementptr inbounds i8, ptr %i35, i64 %i86
  %i88 = load i8, ptr %i87, align 1, !tbaa !21
  %i89 = zext i8 %i88 to i32
  %i90 = add nuw nsw i32 %i82, %i89
  %i91 = load i8, ptr %i83, align 1, !tbaa !21
  %i92 = zext i8 %i91 to i64
  %i93 = sub nsw i64 0, %i92
  %i94 = getelementptr inbounds i8, ptr %i35, i64 %i93
  %i95 = load i8, ptr %i94, align 1, !tbaa !21
  %i96 = zext i8 %i95 to i32
  %i97 = add nuw nsw i32 %i90, %i96
  %i98 = icmp ult i32 %i97, 731
  br i1 %i98, label %bb99, label %bb27.bb102_crit_edge

bb27.bb102_crit_edge:                             ; preds = %bb27
  br label %bb102

bb99:                                             ; preds = %bb27
  %i100 = sub nuw nsw i32 730, %i97
  %i101 = getelementptr inbounds i32, ptr %arg1, i64 %i31
  store i32 %i100, ptr %i101, align 4, !tbaa !16
  br label %bb102

bb102:                                            ; preds = %bb99, %bb27.bb102_crit_edge
  %i103 = add nuw nsw i64 %i28, 1
  %i104 = icmp eq i64 %i103, %i18
  br i1 %i104, label %bb105, label %bb102.bb27_crit_edge, !llvm.loop !26

bb102.bb27_crit_edge:                             ; preds = %bb102
  br label %bb27

bb105:                                            ; preds = %bb102
  %i106 = add nuw nsw i64 %i20, 1
  %i107 = icmp eq i64 %i106, %i17
  br i1 %i107, label %bb108.loopexit, label %bb105.bb19_crit_edge, !llvm.loop !27

bb105.bb19_crit_edge:                             ; preds = %bb105
  br label %bb19

bb108.loopexit:                                   ; preds = %bb105
  br label %bb108

bb108:                                            ; preds = %bb108.loopexit, %bb10.bb108_crit_edge, %bb.bb108_crit_edge
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local zeroext i8 @median(ptr nocapture noundef readonly %arg, i32 noundef %arg1, i32 noundef %arg2, i32 noundef %arg3) local_unnamed_addr #16 {
bb:
  %i = add nsw i32 %arg1, -1
  %i4 = mul nsw i32 %i, %arg3
  %i5 = add nsw i32 %i4, %arg2
  %i6 = sext i32 %i5 to i64
  %i7 = getelementptr i8, ptr %arg, i64 %i6
  %i8 = getelementptr i8, ptr %i7, i64 -1
  %i9 = load i8, ptr %i8, align 1, !tbaa !21
  %i10 = load i8, ptr %i7, align 1, !tbaa !21
  %i11 = getelementptr i8, ptr %i7, i64 1
  %i12 = load i8, ptr %i11, align 1, !tbaa !21
  %i13 = mul nsw i32 %arg3, %arg1
  %i14 = add nsw i32 %i13, %arg2
  %i15 = sext i32 %i14 to i64
  %i16 = getelementptr i8, ptr %arg, i64 %i15
  %i17 = getelementptr i8, ptr %i16, i64 -1
  %i18 = load i8, ptr %i17, align 1, !tbaa !21
  %i19 = getelementptr i8, ptr %i16, i64 1
  %i20 = load i8, ptr %i19, align 1, !tbaa !21
  %i21 = add nsw i32 %arg1, 1
  %i22 = mul nsw i32 %i21, %arg3
  %i23 = add nsw i32 %i22, %arg2
  %i24 = sext i32 %i23 to i64
  %i25 = getelementptr i8, ptr %arg, i64 %i24
  %i26 = getelementptr i8, ptr %i25, i64 -1
  %i27 = load i8, ptr %i26, align 1, !tbaa !21
  %i28 = load i8, ptr %i25, align 1, !tbaa !21
  %i29 = getelementptr i8, ptr %i25, i64 1
  %i30 = load i8, ptr %i29, align 1, !tbaa !21
  %i31 = tail call i8 @llvm.umax.i8(i8 %i9, i8 %i10)
  %i32 = tail call i8 @llvm.umin.i8(i8 %i9, i8 %i10)
  %i33 = zext i8 %i32 to i32
  %i34 = tail call i8 @llvm.umax.i8(i8 %i31, i8 %i12)
  %i35 = tail call i8 @llvm.umin.i8(i8 %i31, i8 %i12)
  %i36 = zext i8 %i35 to i32
  %i37 = tail call i8 @llvm.umax.i8(i8 %i34, i8 %i18)
  %i38 = tail call i8 @llvm.umin.i8(i8 %i34, i8 %i18)
  %i39 = zext i8 %i38 to i32
  %i40 = tail call i8 @llvm.umax.i8(i8 %i37, i8 %i20)
  %i41 = tail call i8 @llvm.umin.i8(i8 %i37, i8 %i20)
  %i42 = zext i8 %i41 to i32
  %i43 = tail call i8 @llvm.umax.i8(i8 %i40, i8 %i27)
  %i44 = tail call i8 @llvm.umin.i8(i8 %i40, i8 %i27)
  %i45 = zext i8 %i44 to i32
  %i46 = tail call i8 @llvm.umax.i8(i8 %i43, i8 %i28)
  %i47 = tail call i8 @llvm.umin.i8(i8 %i43, i8 %i28)
  %i48 = zext i8 %i47 to i32
  %i49 = tail call i8 @llvm.umin.i8(i8 %i46, i8 %i30)
  %i50 = zext i8 %i49 to i32
  %i51 = icmp ult i8 %i12, %i32
  %i52 = select i1 %i51, i32 %i33, i32 %i36
  %i53 = select i1 %i51, i32 %i36, i32 %i33
  %i54 = tail call i32 @llvm.umax.i32(i32 %i52, i32 %i39)
  %i55 = tail call i32 @llvm.umin.i32(i32 %i52, i32 %i39)
  %i56 = tail call i32 @llvm.umax.i32(i32 %i54, i32 %i42)
  %i57 = tail call i32 @llvm.umin.i32(i32 %i54, i32 %i42)
  %i58 = tail call i32 @llvm.umax.i32(i32 %i56, i32 %i45)
  %i59 = tail call i32 @llvm.umin.i32(i32 %i56, i32 %i45)
  %i60 = tail call i32 @llvm.umax.i32(i32 %i58, i32 %i48)
  %i61 = tail call i32 @llvm.umin.i32(i32 %i58, i32 %i48)
  %i62 = tail call i32 @llvm.umin.i32(i32 %i60, i32 %i50)
  %i63 = tail call i32 @llvm.umax.i32(i32 %i53, i32 %i55)
  %i64 = tail call i32 @llvm.umin.i32(i32 %i53, i32 %i55)
  %i65 = tail call i32 @llvm.umax.i32(i32 %i63, i32 %i57)
  %i66 = tail call i32 @llvm.umin.i32(i32 %i63, i32 %i57)
  %i67 = tail call i32 @llvm.umax.i32(i32 %i65, i32 %i59)
  %i68 = tail call i32 @llvm.umin.i32(i32 %i65, i32 %i59)
  %i69 = tail call i32 @llvm.umax.i32(i32 %i67, i32 %i61)
  %i70 = tail call i32 @llvm.umin.i32(i32 %i67, i32 %i61)
  %i71 = tail call i32 @llvm.umin.i32(i32 %i69, i32 %i62)
  %i72 = icmp ult i32 %i57, %i64
  %i73 = select i1 %i72, i32 %i64, i32 %i66
  %i74 = select i1 %i72, i32 %i66, i32 %i64
  %i75 = tail call i32 @llvm.umax.i32(i32 %i73, i32 %i68)
  %i76 = tail call i32 @llvm.umin.i32(i32 %i73, i32 %i68)
  %i77 = tail call i32 @llvm.umax.i32(i32 %i75, i32 %i70)
  %i78 = tail call i32 @llvm.umin.i32(i32 %i75, i32 %i70)
  %i79 = tail call i32 @llvm.umax.i32(i32 %i77, i32 %i71)
  %i80 = tail call i32 @llvm.umin.i32(i32 %i77, i32 %i71)
  %i81 = tail call i32 @llvm.umax.i32(i32 %i74, i32 %i76)
  %i82 = tail call i32 @llvm.umax.i32(i32 %i81, i32 %i78)
  %i83 = tail call i32 @llvm.umax.i32(i32 %i82, i32 %i80)
  %i84 = add nuw nsw i32 %i79, %i83
  %i85 = lshr i32 %i84, 1
  %i86 = trunc i32 %i85 to i8
  ret i8 %i86
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.umax.i8(i8, i8) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.umin.i8(i8, i8) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umax.i32(i32, i32) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #9

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @enlarge(ptr nocapture noundef %arg, ptr noundef %arg1, ptr nocapture noundef %arg2, ptr nocapture noundef %arg3, i32 noundef %arg4) local_unnamed_addr #17 {
bb:
  %i = load i32, ptr %arg3, align 4, !tbaa !16
  %i5 = icmp sgt i32 %i, 0
  br i1 %i5, label %bb6, label %bb.bb10_crit_edge

bb.bb10_crit_edge:                                ; preds = %bb
  br label %bb10

bb6:                                              ; preds = %bb
  %i7 = shl nsw i32 %arg4, 1
  %i8 = sext i32 %arg4 to i64
  %i9 = getelementptr i8, ptr %arg1, i64 %i8
  br label %bb16

bb10.loopexit:                                    ; preds = %bb16
  br label %bb10

bb10:                                             ; preds = %bb10.loopexit, %bb.bb10_crit_edge
  %i11 = icmp sgt i32 %arg4, 0
  br i1 %i11, label %bb12, label %bb10.bb33_crit_edge

bb10.bb33_crit_edge:                              ; preds = %bb10
  br label %bb33

bb12:                                             ; preds = %bb10
  %i13 = shl nuw nsw i32 %arg4, 1
  %i14 = zext nneg i32 %arg4 to i64
  %i15 = getelementptr i8, ptr %arg1, i64 %i14
  br label %bb39

bb16:                                             ; preds = %bb16.bb16_crit_edge, %bb6
  %i17 = phi i32 [ 0, %bb6 ], [ %i29, %bb16.bb16_crit_edge ]
  %i18 = add nsw i32 %i17, %arg4
  %i19 = load i32, ptr %arg2, align 4, !tbaa !16
  %i20 = add nsw i32 %i19, %i7
  %i21 = mul nsw i32 %i20, %i18
  %i22 = sext i32 %i21 to i64
  %i23 = getelementptr i8, ptr %i9, i64 %i22
  %i24 = load ptr, ptr %arg, align 8, !tbaa !8
  %i25 = mul nsw i32 %i19, %i17
  %i26 = sext i32 %i25 to i64
  %i27 = getelementptr inbounds i8, ptr %i24, i64 %i26
  %i28 = sext i32 %i19 to i64
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %i23, ptr align 1 %i27, i64 %i28, i1 false)
  %i29 = add nuw nsw i32 %i17, 1
  %i30 = load i32, ptr %arg3, align 4, !tbaa !16
  %i31 = icmp slt i32 %i29, %i30
  br i1 %i31, label %bb16.bb16_crit_edge, label %bb10.loopexit, !llvm.loop !28

bb16.bb16_crit_edge:                              ; preds = %bb16
  br label %bb16

bb32:                                             ; preds = %bb39
  br i1 %i11, label %bb35, label %bb32.bb33_crit_edge

bb32.bb33_crit_edge:                              ; preds = %bb32
  br label %bb33

bb33:                                             ; preds = %bb32.bb33_crit_edge, %bb10.bb33_crit_edge
  %i34 = shl nsw i32 %arg4, 1
  br label %bb108

bb35:                                             ; preds = %bb32
  %i36 = shl nuw nsw i32 %arg4, 1
  %i37 = load i32, ptr %arg3, align 4, !tbaa !16
  %i38 = sub nsw i32 0, %i36
  br label %bb69

bb39:                                             ; preds = %bb39.bb39_crit_edge, %bb12
  %i40 = phi i32 [ 0, %bb12 ], [ %i67, %bb39.bb39_crit_edge ]
  %i41 = xor i32 %i40, -1
  %i42 = add nsw i32 %i41, %arg4
  %i43 = load i32, ptr %arg2, align 4, !tbaa !16
  %i44 = add nsw i32 %i43, %i13
  %i45 = mul nsw i32 %i44, %i42
  %i46 = sext i32 %i45 to i64
  %i47 = getelementptr i8, ptr %i15, i64 %i46
  %i48 = load ptr, ptr %arg, align 8, !tbaa !8
  %i49 = mul nsw i32 %i43, %i40
  %i50 = sext i32 %i49 to i64
  %i51 = getelementptr inbounds i8, ptr %i48, i64 %i50
  %i52 = sext i32 %i43 to i64
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %i47, ptr align 1 %i51, i64 %i52, i1 false)
  %i53 = load i32, ptr %arg3, align 4, !tbaa !16
  %i54 = add nuw i32 %i40, %arg4
  %i55 = add i32 %i54, %i53
  %i56 = load i32, ptr %arg2, align 4, !tbaa !16
  %i57 = add nsw i32 %i56, %i13
  %i58 = mul nsw i32 %i55, %i57
  %i59 = sext i32 %i58 to i64
  %i60 = getelementptr i8, ptr %i15, i64 %i59
  %i61 = load ptr, ptr %arg, align 8, !tbaa !8
  %i62 = add i32 %i53, %i41
  %i63 = mul nsw i32 %i62, %i56
  %i64 = sext i32 %i63 to i64
  %i65 = getelementptr inbounds i8, ptr %i61, i64 %i64
  %i66 = sext i32 %i56 to i64
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %i60, ptr align 1 %i65, i64 %i66, i1 false)
  %i67 = add nuw nsw i32 %i40, 1
  %i68 = icmp eq i32 %i67, %arg4
  br i1 %i68, label %bb32, label %bb39.bb39_crit_edge, !llvm.loop !29

bb39.bb39_crit_edge:                              ; preds = %bb39
  br label %bb39

bb69:                                             ; preds = %bb104.bb69_crit_edge, %bb35
  %i70 = phi i32 [ %i37, %bb35 ], [ %i105, %bb104.bb69_crit_edge ]
  %i71 = phi i32 [ 0, %bb35 ], [ %i106, %bb104.bb69_crit_edge ]
  %i72 = icmp sgt i32 %i70, %i38
  br i1 %i72, label %bb73, label %bb69.bb104_crit_edge

bb69.bb104_crit_edge:                             ; preds = %bb69
  br label %bb104

bb73:                                             ; preds = %bb69
  %i74 = xor i32 %i71, -1
  br label %bb75

bb75:                                             ; preds = %bb75.bb75_crit_edge, %bb73
  %i76 = phi i32 [ 0, %bb73 ], [ %i100, %bb75.bb75_crit_edge ]
  %i77 = load i32, ptr %arg2, align 4, !tbaa !16
  %i78 = add nsw i32 %i77, %i36
  %i79 = mul nsw i32 %i78, %i76
  %i80 = add nsw i32 %i79, %arg4
  %i81 = add nsw i32 %i80, %i71
  %i82 = sext i32 %i81 to i64
  %i83 = getelementptr inbounds i8, ptr %arg1, i64 %i82
  %i84 = load i8, ptr %i83, align 1, !tbaa !21
  %i85 = add i32 %i80, %i74
  %i86 = sext i32 %i85 to i64
  %i87 = getelementptr inbounds i8, ptr %arg1, i64 %i86
  store i8 %i84, ptr %i87, align 1, !tbaa !21
  %i88 = load i32, ptr %arg2, align 4, !tbaa !16
  %i89 = add nsw i32 %i88, %i36
  %i90 = mul nsw i32 %i89, %i76
  %i91 = add i32 %i88, %arg4
  %i92 = add i32 %i91, %i90
  %i93 = add i32 %i92, %i74
  %i94 = sext i32 %i93 to i64
  %i95 = getelementptr inbounds i8, ptr %arg1, i64 %i94
  %i96 = load i8, ptr %i95, align 1, !tbaa !21
  %i97 = add nsw i32 %i92, %i71
  %i98 = sext i32 %i97 to i64
  %i99 = getelementptr inbounds i8, ptr %arg1, i64 %i98
  store i8 %i96, ptr %i99, align 1, !tbaa !21
  %i100 = add nuw nsw i32 %i76, 1
  %i101 = load i32, ptr %arg3, align 4, !tbaa !16
  %i102 = add nsw i32 %i101, %i36
  %i103 = icmp slt i32 %i100, %i102
  br i1 %i103, label %bb75.bb75_crit_edge, label %bb104.loopexit, !llvm.loop !30

bb75.bb75_crit_edge:                              ; preds = %bb75
  br label %bb75

bb104.loopexit:                                   ; preds = %bb75
  br label %bb104

bb104:                                            ; preds = %bb104.loopexit, %bb69.bb104_crit_edge
  %i105 = phi i32 [ %i70, %bb69.bb104_crit_edge ], [ %i101, %bb104.loopexit ]
  %i106 = add nuw nsw i32 %i71, 1
  %i107 = icmp eq i32 %i106, %arg4
  br i1 %i107, label %bb108.loopexit, label %bb104.bb69_crit_edge, !llvm.loop !31

bb104.bb69_crit_edge:                             ; preds = %bb104
  br label %bb69

bb108.loopexit:                                   ; preds = %bb104
  br label %bb108

bb108:                                            ; preds = %bb108.loopexit, %bb33
  %i109 = phi i32 [ %i34, %bb33 ], [ %i36, %bb108.loopexit ]
  %i110 = load i32, ptr %arg2, align 4, !tbaa !16
  %i111 = add nsw i32 %i110, %i109
  store i32 %i111, ptr %arg2, align 4, !tbaa !16
  %i112 = load i32, ptr %arg3, align 4, !tbaa !16
  %i113 = add nsw i32 %i112, %i109
  store i32 %i113, ptr %arg3, align 4, !tbaa !16
  store ptr %arg1, ptr %arg, align 8, !tbaa !8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #18

; Function Attrs: nounwind uwtable
define dso_local void @susan_smoothing(i32 noundef %arg, ptr noundef %arg1, float noundef %arg2, i32 noundef %arg3, i32 noundef %arg4, ptr nocapture noundef readonly %arg5) local_unnamed_addr #0 {
bb:
  %i = alloca ptr, align 8
  %i6 = alloca i32, align 4
  %i7 = alloca i32, align 4
  store ptr %arg1, ptr %i, align 8, !tbaa !8
  store i32 %arg3, ptr %i6, align 4, !tbaa !16
  store i32 %arg4, ptr %i7, align 4, !tbaa !16
  %i8 = icmp eq i32 %arg, 0
  %i9 = fpext float %arg2 to double
  %i10 = fmul double %i9, 1.500000e+00
  %i11 = fptosi double %i10 to i32
  %i12 = add nsw i32 %i11, 1
  %i13 = select i1 %i8, i32 %i12, i32 1
  %i14 = fcmp ogt float %arg2, 1.500000e+01
  br i1 %i14, label %bb15, label %bb19

bb15:                                             ; preds = %bb
  %i16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.25, double noundef %i9)
  %i17 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.44)
  %i18 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.45)
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb19:                                             ; preds = %bb
  %i20 = shl nsw i32 %i13, 1
  %i21 = or disjoint i32 %i20, 1
  %i22 = icmp slt i32 %i20, %arg3
  %i23 = icmp slt i32 %i20, %arg4
  %i24 = and i1 %i22, %i23
  br i1 %i24, label %bb27, label %bb25

bb25:                                             ; preds = %bb19
  %i26 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.28, i32 noundef %i13, i32 noundef %arg3, i32 noundef %arg4)
  tail call void @exit(i32 noundef 0) #23
  unreachable

bb27:                                             ; preds = %bb19
  %i28 = add nsw i32 %i20, %arg3
  %i29 = add nsw i32 %i20, %arg4
  %i30 = mul nsw i32 %i28, %i29
  %i31 = sext i32 %i30 to i64
  %i32 = tail call noalias ptr @malloc(i64 noundef %i31) #24
  call void @enlarge(ptr noundef nonnull %i, ptr noundef %i32, ptr noundef nonnull %i6, ptr noundef nonnull %i7, i32 noundef %i13)
  br i1 %i8, label %bb39, label %bb33

bb33:                                             ; preds = %bb27
  %i34 = load i32, ptr %i7, align 4, !tbaa !16
  %i35 = icmp sgt i32 %i34, 2
  %i36 = load i32, ptr %i6, align 4
  %i37 = icmp sgt i32 %i36, 2
  %i38 = select i1 %i35, i1 %i37, i1 false
  br i1 %i38, label %bb305.preheader, label %bb33.bb533_crit_edge

bb33.bb533_crit_edge:                             ; preds = %bb33
  br label %bb533

bb305.preheader:                                  ; preds = %bb33
  br label %bb305

bb39:                                             ; preds = %bb27
  %i40 = load i32, ptr %i6, align 4, !tbaa !16
  %i41 = sub nsw i32 %i40, %i21
  %i42 = mul nsw i32 %i21, %i21
  %i43 = zext nneg i32 %i42 to i64
  %i44 = tail call noalias ptr @malloc(i64 noundef %i43) #24
  %i45 = fneg float %arg2
  %i46 = fmul float %i45, %arg2
  %i47 = xor i32 %i11, -1
  %i48 = icmp slt i32 %i12, %i47
  br i1 %i48, label %bb39.bb53_crit_edge, label %bb49.preheader

bb39.bb53_crit_edge:                              ; preds = %bb39
  br label %bb53

bb49.preheader:                                   ; preds = %bb39
  br label %bb49

bb49:                                             ; preds = %bb87.bb49_crit_edge, %bb49.preheader
  %i50 = phi ptr [ %i84, %bb87.bb49_crit_edge ], [ %i44, %bb49.preheader ]
  %i51 = phi i32 [ %i88, %bb87.bb49_crit_edge ], [ %i47, %bb49.preheader ]
  %i52 = mul nsw i32 %i51, %i51
  br label %bb72

bb53.loopexit:                                    ; preds = %bb87
  br label %bb53

bb53:                                             ; preds = %bb53.loopexit, %bb39.bb53_crit_edge
  %i54 = load i32, ptr %i7, align 4, !tbaa !16
  %i55 = sub nsw i32 %i54, %i13
  %i56 = icmp slt i32 %i13, %i55
  br i1 %i56, label %bb57, label %bb53.bb304_crit_edge

bb53.bb304_crit_edge:                             ; preds = %bb53
  br label %bb304

bb57:                                             ; preds = %bb53
  %i58 = sub nsw i32 0, %i13
  %i59 = sext i32 %i58 to i64
  %i60 = sext i32 %i41 to i64
  %i61 = add i32 %i13, %i11
  %i62 = add i32 %i61, 1
  %i63 = zext i32 %i62 to i64
  %i64 = add nuw nsw i64 %i63, 1
  %i65 = sext i32 %i13 to i64
  %i66 = load i32, ptr %i6, align 4, !tbaa !16
  %i67 = add i32 %i13, %i11
  %i68 = and i32 %i61, 1
  %i69 = icmp eq i32 %i68, 0
  %i70 = sub i32 0, %i11
  %i71 = icmp eq i32 %i67, -1
  br label %bb90

bb72:                                             ; preds = %bb72.bb72_crit_edge, %bb49
  %i73 = phi ptr [ %i50, %bb49 ], [ %i84, %bb72.bb72_crit_edge ]
  %i74 = phi i32 [ %i47, %bb49 ], [ %i85, %bb72.bb72_crit_edge ]
  %i75 = mul nsw i32 %i74, %i74
  %i76 = add nuw nsw i32 %i75, %i52
  %i77 = sitofp i32 %i76 to float
  %i78 = fdiv float %i77, %i46
  %i79 = fpext float %i78 to double
  %i80 = tail call double @exp(double noundef %i79) #21
  %i81 = fmul double %i80, 1.000000e+02
  %i82 = fptosi double %i81 to i32
  %i83 = trunc i32 %i82 to i8
  %i84 = getelementptr inbounds i8, ptr %i73, i64 1
  store i8 %i83, ptr %i73, align 1, !tbaa !21
  %i85 = add i32 %i74, 1
  %i86 = icmp eq i32 %i74, %i13
  br i1 %i86, label %bb87, label %bb72.bb72_crit_edge, !llvm.loop !32

bb72.bb72_crit_edge:                              ; preds = %bb72
  br label %bb72

bb87:                                             ; preds = %bb72
  %i88 = add i32 %i51, 1
  %i89 = icmp eq i32 %i51, %i13
  br i1 %i89, label %bb53.loopexit, label %bb87.bb49_crit_edge, !llvm.loop !33

bb87.bb49_crit_edge:                              ; preds = %bb87
  br label %bb49

bb90:                                             ; preds = %bb297.bb90_crit_edge, %bb57
  %i91 = phi i32 [ %i54, %bb57 ], [ %i299, %bb297.bb90_crit_edge ]
  %i92 = phi i32 [ %i66, %bb57 ], [ %i300, %bb297.bb90_crit_edge ]
  %i93 = phi ptr [ %arg1, %bb57 ], [ %i301, %bb297.bb90_crit_edge ]
  %i94 = phi i32 [ %i13, %bb57 ], [ %i298, %bb297.bb90_crit_edge ]
  %i95 = sub nsw i32 %i92, %i13
  %i96 = icmp slt i32 %i13, %i95
  br i1 %i96, label %bb99, label %bb97

bb97:                                             ; preds = %bb90
  %i98 = add nsw i32 %i94, 1
  br label %bb297

bb99:                                             ; preds = %bb90
  %i100 = sub nsw i32 %i94, %i13
  %i101 = add nsw i32 %i94, -1
  %i102 = add nsw i32 %i94, 1
  br label %bb103

bb103:                                            ; preds = %bb286.bb103_crit_edge, %bb99
  %i104 = phi i64 [ %i65, %bb99 ], [ %i290, %bb286.bb103_crit_edge ]
  %i105 = phi i32 [ %i92, %bb99 ], [ %i291, %bb286.bb103_crit_edge ]
  %i106 = phi ptr [ %i93, %bb99 ], [ %i289, %bb286.bb103_crit_edge ]
  %i107 = load ptr, ptr %i, align 8, !tbaa !8
  %i108 = mul nsw i32 %i105, %i94
  %i109 = sext i32 %i108 to i64
  %i110 = getelementptr i8, ptr %i107, i64 %i104
  %i111 = getelementptr i8, ptr %i110, i64 %i109
  %i112 = load i8, ptr %i111, align 1, !tbaa !21
  %i113 = zext i8 %i112 to i32
  %i114 = zext i8 %i112 to i64
  %i115 = getelementptr inbounds i8, ptr %arg5, i64 %i114
  br i1 %i48, label %bb103.bb280_crit_edge, label %bb116

bb103.bb280_crit_edge:                            ; preds = %bb103
  br label %bb280

bb116:                                            ; preds = %bb103
  %i117 = mul nsw i32 %i105, %i100
  %i118 = sext i32 %i117 to i64
  %i119 = getelementptr inbounds i8, ptr %i107, i64 %i118
  %i120 = getelementptr inbounds i8, ptr %i119, i64 %i104
  %i121 = getelementptr inbounds i8, ptr %i120, i64 %i59
  br label %bb122

bb122:                                            ; preds = %bb192.bb122_crit_edge, %bb116
  %i123 = phi i32 [ %i194, %bb192.bb122_crit_edge ], [ 0, %bb116 ]
  %i124 = phi ptr [ %i195, %bb192.bb122_crit_edge ], [ %i44, %bb116 ]
  %i125 = phi ptr [ %i196, %bb192.bb122_crit_edge ], [ %i121, %bb116 ]
  %i126 = phi i32 [ %i193, %bb192.bb122_crit_edge ], [ 0, %bb116 ]
  %i127 = phi i32 [ %i197, %bb192.bb122_crit_edge ], [ %i47, %bb116 ]
  %i128 = getelementptr i8, ptr %i125, i64 %i64
  br i1 %i69, label %bb122.bb145_crit_edge, label %bb129

bb122.bb145_crit_edge:                            ; preds = %bb122
  br label %bb145

bb129:                                            ; preds = %bb122
  %i130 = getelementptr inbounds i8, ptr %i125, i64 1
  %i131 = load i8, ptr %i125, align 1, !tbaa !21
  %i132 = zext i8 %i131 to i32
  %i133 = getelementptr inbounds i8, ptr %i124, i64 1
  %i134 = load i8, ptr %i124, align 1, !tbaa !21
  %i135 = zext i8 %i134 to i32
  %i136 = zext i8 %i131 to i64
  %i137 = sub nsw i64 0, %i136
  %i138 = getelementptr inbounds i8, ptr %i115, i64 %i137
  %i139 = load i8, ptr %i138, align 1, !tbaa !21
  %i140 = zext i8 %i139 to i32
  %i141 = mul nuw nsw i32 %i140, %i135
  %i142 = add nsw i32 %i141, %i126
  %i143 = mul nuw nsw i32 %i141, %i132
  %i144 = add nsw i32 %i143, %i123
  br label %bb145

bb145:                                            ; preds = %bb129, %bb122.bb145_crit_edge
  %i146 = phi i32 [ undef, %bb122.bb145_crit_edge ], [ %i142, %bb129 ]
  %i147 = phi i32 [ undef, %bb122.bb145_crit_edge ], [ %i144, %bb129 ]
  %i148 = phi i32 [ %i123, %bb122.bb145_crit_edge ], [ %i144, %bb129 ]
  %i149 = phi ptr [ %i124, %bb122.bb145_crit_edge ], [ %i133, %bb129 ]
  %i150 = phi ptr [ %i125, %bb122.bb145_crit_edge ], [ %i130, %bb129 ]
  %i151 = phi i32 [ %i126, %bb122.bb145_crit_edge ], [ %i142, %bb129 ]
  %i152 = phi i32 [ %i47, %bb122.bb145_crit_edge ], [ %i70, %bb129 ]
  br i1 %i71, label %bb145.bb192_crit_edge, label %bb153.preheader

bb145.bb192_crit_edge:                            ; preds = %bb145
  br label %bb192

bb153.preheader:                                  ; preds = %bb145
  br label %bb153

bb153:                                            ; preds = %bb153.bb153_crit_edge, %bb153.preheader
  %i154 = phi i32 [ %i189, %bb153.bb153_crit_edge ], [ %i148, %bb153.preheader ]
  %i155 = phi ptr [ %i178, %bb153.bb153_crit_edge ], [ %i149, %bb153.preheader ]
  %i156 = phi ptr [ %i175, %bb153.bb153_crit_edge ], [ %i150, %bb153.preheader ]
  %i157 = phi i32 [ %i187, %bb153.bb153_crit_edge ], [ %i151, %bb153.preheader ]
  %i158 = phi i32 [ %i190, %bb153.bb153_crit_edge ], [ %i152, %bb153.preheader ]
  %i159 = getelementptr inbounds i8, ptr %i156, i64 1
  %i160 = load i8, ptr %i156, align 1, !tbaa !21
  %i161 = zext i8 %i160 to i32
  %i162 = getelementptr inbounds i8, ptr %i155, i64 1
  %i163 = load i8, ptr %i155, align 1, !tbaa !21
  %i164 = zext i8 %i163 to i32
  %i165 = zext i8 %i160 to i64
  %i166 = sub nsw i64 0, %i165
  %i167 = getelementptr inbounds i8, ptr %i115, i64 %i166
  %i168 = load i8, ptr %i167, align 1, !tbaa !21
  %i169 = zext i8 %i168 to i32
  %i170 = mul nuw nsw i32 %i169, %i164
  %i171 = add nsw i32 %i170, %i157
  %i172 = mul nuw nsw i32 %i170, %i161
  %i173 = add nsw i32 %i172, %i154
  %i174 = add i32 %i158, 1
  %i175 = getelementptr inbounds i8, ptr %i156, i64 2
  %i176 = load i8, ptr %i159, align 1, !tbaa !21
  %i177 = zext i8 %i176 to i32
  %i178 = getelementptr inbounds i8, ptr %i155, i64 2
  %i179 = load i8, ptr %i162, align 1, !tbaa !21
  %i180 = zext i8 %i179 to i32
  %i181 = zext i8 %i176 to i64
  %i182 = sub nsw i64 0, %i181
  %i183 = getelementptr inbounds i8, ptr %i115, i64 %i182
  %i184 = load i8, ptr %i183, align 1, !tbaa !21
  %i185 = zext i8 %i184 to i32
  %i186 = mul nuw nsw i32 %i185, %i180
  %i187 = add nsw i32 %i186, %i171
  %i188 = mul nuw nsw i32 %i186, %i177
  %i189 = add nsw i32 %i188, %i173
  %i190 = add i32 %i158, 2
  %i191 = icmp eq i32 %i174, %i13
  br i1 %i191, label %bb192.loopexit, label %bb153.bb153_crit_edge, !llvm.loop !34

bb153.bb153_crit_edge:                            ; preds = %bb153
  br label %bb153

bb192.loopexit:                                   ; preds = %bb153
  br label %bb192

bb192:                                            ; preds = %bb192.loopexit, %bb145.bb192_crit_edge
  %i193 = phi i32 [ %i146, %bb145.bb192_crit_edge ], [ %i187, %bb192.loopexit ]
  %i194 = phi i32 [ %i147, %bb145.bb192_crit_edge ], [ %i189, %bb192.loopexit ]
  %i195 = getelementptr i8, ptr %i124, i64 %i64
  %i196 = getelementptr inbounds i8, ptr %i128, i64 %i60
  %i197 = add i32 %i127, 1
  %i198 = icmp eq i32 %i127, %i13
  br i1 %i198, label %bb199, label %bb192.bb122_crit_edge, !llvm.loop !35

bb192.bb122_crit_edge:                            ; preds = %bb192
  br label %bb122

bb199:                                            ; preds = %bb192
  %i200 = add nsw i32 %i193, -10000
  %i201 = icmp eq i32 %i200, 0
  br i1 %i201, label %bb202, label %bb199.bb280_crit_edge

bb199.bb280_crit_edge:                            ; preds = %bb199
  br label %bb280

bb202:                                            ; preds = %bb199
  %i203 = mul nsw i32 %i105, %i101
  %i204 = sext i32 %i203 to i64
  %i205 = getelementptr i8, ptr %i107, i64 %i104
  %i206 = getelementptr i8, ptr %i205, i64 %i204
  %i207 = getelementptr i8, ptr %i206, i64 -1
  %i208 = load i8, ptr %i207, align 1, !tbaa !21
  %i209 = load i8, ptr %i206, align 1, !tbaa !21
  %i210 = getelementptr i8, ptr %i206, i64 1
  %i211 = load i8, ptr %i210, align 1, !tbaa !21
  %i212 = getelementptr i8, ptr %i111, i64 -1
  %i213 = load i8, ptr %i212, align 1, !tbaa !21
  %i214 = getelementptr i8, ptr %i111, i64 1
  %i215 = load i8, ptr %i214, align 1, !tbaa !21
  %i216 = mul nsw i32 %i105, %i102
  %i217 = sext i32 %i216 to i64
  %i218 = getelementptr i8, ptr %i107, i64 %i104
  %i219 = getelementptr i8, ptr %i218, i64 %i217
  %i220 = getelementptr i8, ptr %i219, i64 -1
  %i221 = load i8, ptr %i220, align 1, !tbaa !21
  %i222 = load i8, ptr %i219, align 1, !tbaa !21
  %i223 = getelementptr i8, ptr %i219, i64 1
  %i224 = load i8, ptr %i223, align 1, !tbaa !21
  %i225 = tail call i8 @llvm.umax.i8(i8 %i208, i8 %i209)
  %i226 = tail call i8 @llvm.umin.i8(i8 %i208, i8 %i209)
  %i227 = zext i8 %i226 to i32
  %i228 = tail call i8 @llvm.umax.i8(i8 %i225, i8 %i211)
  %i229 = tail call i8 @llvm.umin.i8(i8 %i225, i8 %i211)
  %i230 = zext i8 %i229 to i32
  %i231 = tail call i8 @llvm.umax.i8(i8 %i228, i8 %i213)
  %i232 = tail call i8 @llvm.umin.i8(i8 %i228, i8 %i213)
  %i233 = zext i8 %i232 to i32
  %i234 = tail call i8 @llvm.umax.i8(i8 %i231, i8 %i215)
  %i235 = tail call i8 @llvm.umin.i8(i8 %i231, i8 %i215)
  %i236 = zext i8 %i235 to i32
  %i237 = tail call i8 @llvm.umax.i8(i8 %i234, i8 %i221)
  %i238 = tail call i8 @llvm.umin.i8(i8 %i234, i8 %i221)
  %i239 = zext i8 %i238 to i32
  %i240 = tail call i8 @llvm.umax.i8(i8 %i237, i8 %i222)
  %i241 = tail call i8 @llvm.umin.i8(i8 %i237, i8 %i222)
  %i242 = zext i8 %i241 to i32
  %i243 = tail call i8 @llvm.umin.i8(i8 %i240, i8 %i224)
  %i244 = zext i8 %i243 to i32
  %i245 = icmp ult i8 %i211, %i226
  %i246 = select i1 %i245, i32 %i227, i32 %i230
  %i247 = select i1 %i245, i32 %i230, i32 %i227
  %i248 = tail call i32 @llvm.umax.i32(i32 %i246, i32 %i233)
  %i249 = tail call i32 @llvm.umin.i32(i32 %i246, i32 %i233)
  %i250 = tail call i32 @llvm.umax.i32(i32 %i248, i32 %i236)
  %i251 = tail call i32 @llvm.umin.i32(i32 %i248, i32 %i236)
  %i252 = tail call i32 @llvm.umax.i32(i32 %i250, i32 %i239)
  %i253 = tail call i32 @llvm.umin.i32(i32 %i250, i32 %i239)
  %i254 = tail call i32 @llvm.umax.i32(i32 %i252, i32 %i242)
  %i255 = tail call i32 @llvm.umin.i32(i32 %i252, i32 %i242)
  %i256 = tail call i32 @llvm.umin.i32(i32 %i254, i32 %i244)
  %i257 = tail call i32 @llvm.umax.i32(i32 %i247, i32 %i249)
  %i258 = tail call i32 @llvm.umin.i32(i32 %i247, i32 %i249)
  %i259 = tail call i32 @llvm.umax.i32(i32 %i257, i32 %i251)
  %i260 = tail call i32 @llvm.umin.i32(i32 %i257, i32 %i251)
  %i261 = tail call i32 @llvm.umax.i32(i32 %i259, i32 %i253)
  %i262 = tail call i32 @llvm.umin.i32(i32 %i259, i32 %i253)
  %i263 = tail call i32 @llvm.umax.i32(i32 %i261, i32 %i255)
  %i264 = tail call i32 @llvm.umin.i32(i32 %i261, i32 %i255)
  %i265 = tail call i32 @llvm.umin.i32(i32 %i263, i32 %i256)
  %i266 = icmp ult i32 %i251, %i258
  %i267 = select i1 %i266, i32 %i258, i32 %i260
  %i268 = select i1 %i266, i32 %i260, i32 %i258
  %i269 = tail call i32 @llvm.umax.i32(i32 %i267, i32 %i262)
  %i270 = tail call i32 @llvm.umin.i32(i32 %i267, i32 %i262)
  %i271 = tail call i32 @llvm.umax.i32(i32 %i269, i32 %i264)
  %i272 = tail call i32 @llvm.umin.i32(i32 %i269, i32 %i264)
  %i273 = tail call i32 @llvm.umax.i32(i32 %i271, i32 %i265)
  %i274 = tail call i32 @llvm.umin.i32(i32 %i271, i32 %i265)
  %i275 = tail call i32 @llvm.umax.i32(i32 %i268, i32 %i270)
  %i276 = tail call i32 @llvm.umax.i32(i32 %i275, i32 %i272)
  %i277 = tail call i32 @llvm.umax.i32(i32 %i276, i32 %i274)
  %i278 = add nuw nsw i32 %i277, %i273
  %i279 = lshr i32 %i278, 1
  br label %bb286

bb280:                                            ; preds = %bb199.bb280_crit_edge, %bb103.bb280_crit_edge
  %i281 = phi i32 [ %i200, %bb199.bb280_crit_edge ], [ -10000, %bb103.bb280_crit_edge ]
  %i282 = phi i32 [ %i194, %bb199.bb280_crit_edge ], [ 0, %bb103.bb280_crit_edge ]
  %i283 = mul nsw i32 %i113, -10000
  %i284 = add i32 %i282, %i283
  %i285 = sdiv i32 %i284, %i281
  br label %bb286

bb286:                                            ; preds = %bb280, %bb202
  %i287 = phi i32 [ %i285, %bb280 ], [ %i279, %bb202 ]
  %i288 = trunc i32 %i287 to i8
  %i289 = getelementptr inbounds i8, ptr %i106, i64 1
  store i8 %i288, ptr %i106, align 1, !tbaa !21
  %i290 = add nsw i64 %i104, 1
  %i291 = load i32, ptr %i6, align 4, !tbaa !16
  %i292 = sub nsw i32 %i291, %i13
  %i293 = sext i32 %i292 to i64
  %i294 = icmp slt i64 %i290, %i293
  br i1 %i294, label %bb286.bb103_crit_edge, label %bb295, !llvm.loop !36

bb286.bb103_crit_edge:                            ; preds = %bb286
  br label %bb103

bb295:                                            ; preds = %bb286
  %i296 = load i32, ptr %i7, align 4, !tbaa !16
  br label %bb297

bb297:                                            ; preds = %bb295, %bb97
  %i298 = phi i32 [ %i98, %bb97 ], [ %i102, %bb295 ]
  %i299 = phi i32 [ %i91, %bb97 ], [ %i296, %bb295 ]
  %i300 = phi i32 [ %i92, %bb97 ], [ %i291, %bb295 ]
  %i301 = phi ptr [ %i93, %bb97 ], [ %i289, %bb295 ]
  %i302 = sub nsw i32 %i299, %i13
  %i303 = icmp slt i32 %i298, %i302
  br i1 %i303, label %bb297.bb90_crit_edge, label %bb304.loopexit, !llvm.loop !37

bb297.bb90_crit_edge:                             ; preds = %bb297
  br label %bb90

bb304.loopexit:                                   ; preds = %bb297
  br label %bb304

bb304:                                            ; preds = %bb304.loopexit, %bb53.bb304_crit_edge
  tail call void @free(ptr noundef %i44) #21
  br label %bb533

bb305:                                            ; preds = %bb526.bb305_crit_edge, %bb305.preheader
  %i306 = phi i32 [ %i528, %bb526.bb305_crit_edge ], [ %i34, %bb305.preheader ]
  %i307 = phi i32 [ %i529, %bb526.bb305_crit_edge ], [ %i36, %bb305.preheader ]
  %i308 = phi ptr [ %i530, %bb526.bb305_crit_edge ], [ %arg1, %bb305.preheader ]
  %i309 = phi i32 [ %i527, %bb526.bb305_crit_edge ], [ 1, %bb305.preheader ]
  %i310 = icmp sgt i32 %i307, 2
  br i1 %i310, label %bb313, label %bb311

bb311:                                            ; preds = %bb305
  %i312 = add nuw nsw i32 %i309, 1
  br label %bb526

bb313:                                            ; preds = %bb305
  %i314 = add nsw i32 %i309, -1
  %i315 = add nuw nsw i32 %i309, 1
  br label %bb316

bb316:                                            ; preds = %bb515.bb316_crit_edge, %bb313
  %i317 = phi i64 [ 1, %bb313 ], [ %i519, %bb515.bb316_crit_edge ]
  %i318 = phi i32 [ %i307, %bb313 ], [ %i520, %bb515.bb316_crit_edge ]
  %i319 = phi ptr [ %i308, %bb313 ], [ %i518, %bb515.bb316_crit_edge ]
  %i320 = load ptr, ptr %i, align 8, !tbaa !8
  %i321 = mul nsw i32 %i318, %i314
  %i322 = sext i32 %i321 to i64
  %i323 = getelementptr inbounds i8, ptr %i320, i64 %i322
  %i324 = getelementptr inbounds i8, ptr %i323, i64 %i317
  %i325 = getelementptr inbounds i8, ptr %i324, i64 -1
  %i326 = mul nsw i32 %i318, %i309
  %i327 = trunc i64 %i317 to i32
  %i328 = add nsw i32 %i326, %i327
  %i329 = sext i32 %i328 to i64
  %i330 = getelementptr inbounds i8, ptr %i320, i64 %i329
  %i331 = load i8, ptr %i330, align 1, !tbaa !21
  %i332 = zext i8 %i331 to i64
  %i333 = getelementptr inbounds i8, ptr %arg5, i64 %i332
  %i334 = load i8, ptr %i325, align 1, !tbaa !21
  %i335 = zext i8 %i334 to i64
  %i336 = sub nsw i64 0, %i335
  %i337 = getelementptr inbounds i8, ptr %i333, i64 %i336
  %i338 = load i8, ptr %i337, align 1, !tbaa !21
  %i339 = zext i8 %i338 to i32
  %i340 = getelementptr inbounds i8, ptr %i324, i64 1
  %i341 = load i8, ptr %i324, align 1, !tbaa !21
  %i342 = zext i8 %i341 to i64
  %i343 = sub nsw i64 0, %i342
  %i344 = getelementptr inbounds i8, ptr %i333, i64 %i343
  %i345 = load i8, ptr %i344, align 1, !tbaa !21
  %i346 = zext i8 %i345 to i32
  %i347 = load i8, ptr %i340, align 1, !tbaa !21
  %i348 = zext i8 %i347 to i64
  %i349 = sub nsw i64 0, %i348
  %i350 = getelementptr inbounds i8, ptr %i333, i64 %i349
  %i351 = load i8, ptr %i350, align 1, !tbaa !21
  %i352 = zext i8 %i351 to i32
  %i353 = add nsw i32 %i318, -2
  %i354 = sext i32 %i353 to i64
  %i355 = getelementptr inbounds i8, ptr %i340, i64 %i354
  %i356 = getelementptr inbounds i8, ptr %i355, i64 1
  %i357 = load i8, ptr %i355, align 1, !tbaa !21
  %i358 = zext i8 %i357 to i64
  %i359 = sub nsw i64 0, %i358
  %i360 = getelementptr inbounds i8, ptr %i333, i64 %i359
  %i361 = load i8, ptr %i360, align 1, !tbaa !21
  %i362 = zext i8 %i361 to i32
  %i363 = getelementptr inbounds i8, ptr %i355, i64 2
  %i364 = load i8, ptr %i356, align 1, !tbaa !21
  %i365 = zext i8 %i364 to i64
  %i366 = sub nsw i64 0, %i365
  %i367 = getelementptr inbounds i8, ptr %i333, i64 %i366
  %i368 = load i8, ptr %i367, align 1, !tbaa !21
  %i369 = zext i8 %i368 to i32
  %i370 = load i8, ptr %i363, align 1, !tbaa !21
  %i371 = zext i8 %i370 to i64
  %i372 = sub nsw i64 0, %i371
  %i373 = getelementptr inbounds i8, ptr %i333, i64 %i372
  %i374 = load i8, ptr %i373, align 1, !tbaa !21
  %i375 = zext i8 %i374 to i32
  %i376 = getelementptr inbounds i8, ptr %i363, i64 %i354
  %i377 = getelementptr inbounds i8, ptr %i376, i64 1
  %i378 = load i8, ptr %i376, align 1, !tbaa !21
  %i379 = zext i8 %i378 to i64
  %i380 = sub nsw i64 0, %i379
  %i381 = getelementptr inbounds i8, ptr %i333, i64 %i380
  %i382 = load i8, ptr %i381, align 1, !tbaa !21
  %i383 = zext i8 %i382 to i32
  %i384 = getelementptr inbounds i8, ptr %i376, i64 2
  %i385 = load i8, ptr %i377, align 1, !tbaa !21
  %i386 = zext i8 %i385 to i64
  %i387 = sub nsw i64 0, %i386
  %i388 = getelementptr inbounds i8, ptr %i333, i64 %i387
  %i389 = load i8, ptr %i388, align 1, !tbaa !21
  %i390 = zext i8 %i389 to i32
  %i391 = load i8, ptr %i384, align 1, !tbaa !21
  %i392 = zext i8 %i391 to i64
  %i393 = sub nsw i64 0, %i392
  %i394 = getelementptr inbounds i8, ptr %i333, i64 %i393
  %i395 = load i8, ptr %i394, align 1, !tbaa !21
  %i396 = zext i8 %i395 to i32
  %i397 = add nsw i32 %i339, -100
  %i398 = add nsw i32 %i397, %i346
  %i399 = add nsw i32 %i398, %i352
  %i400 = add nsw i32 %i399, %i362
  %i401 = add nsw i32 %i400, %i369
  %i402 = add nsw i32 %i401, %i375
  %i403 = add nsw i32 %i402, %i383
  %i404 = add nsw i32 %i403, %i390
  %i405 = add nsw i32 %i404, %i396
  %i406 = icmp eq i32 %i405, 0
  br i1 %i406, label %bb407, label %bb484

bb407:                                            ; preds = %bb316
  %i408 = add nsw i32 %i321, %i327
  %i409 = sext i32 %i408 to i64
  %i410 = getelementptr i8, ptr %i320, i64 %i409
  %i411 = getelementptr i8, ptr %i410, i64 -1
  %i412 = load i8, ptr %i411, align 1, !tbaa !21
  %i413 = load i8, ptr %i410, align 1, !tbaa !21
  %i414 = getelementptr i8, ptr %i410, i64 1
  %i415 = load i8, ptr %i414, align 1, !tbaa !21
  %i416 = getelementptr i8, ptr %i330, i64 -1
  %i417 = load i8, ptr %i416, align 1, !tbaa !21
  %i418 = getelementptr i8, ptr %i330, i64 1
  %i419 = load i8, ptr %i418, align 1, !tbaa !21
  %i420 = mul nsw i32 %i318, %i315
  %i421 = add nsw i32 %i420, %i327
  %i422 = sext i32 %i421 to i64
  %i423 = getelementptr i8, ptr %i320, i64 %i422
  %i424 = getelementptr i8, ptr %i423, i64 -1
  %i425 = load i8, ptr %i424, align 1, !tbaa !21
  %i426 = load i8, ptr %i423, align 1, !tbaa !21
  %i427 = getelementptr i8, ptr %i423, i64 1
  %i428 = load i8, ptr %i427, align 1, !tbaa !21
  %i429 = tail call i8 @llvm.umax.i8(i8 %i412, i8 %i413)
  %i430 = tail call i8 @llvm.umin.i8(i8 %i412, i8 %i413)
  %i431 = zext i8 %i430 to i32
  %i432 = tail call i8 @llvm.umax.i8(i8 %i429, i8 %i415)
  %i433 = tail call i8 @llvm.umin.i8(i8 %i429, i8 %i415)
  %i434 = zext i8 %i433 to i32
  %i435 = tail call i8 @llvm.umax.i8(i8 %i432, i8 %i417)
  %i436 = tail call i8 @llvm.umin.i8(i8 %i432, i8 %i417)
  %i437 = zext i8 %i436 to i32
  %i438 = tail call i8 @llvm.umax.i8(i8 %i435, i8 %i419)
  %i439 = tail call i8 @llvm.umin.i8(i8 %i435, i8 %i419)
  %i440 = zext i8 %i439 to i32
  %i441 = tail call i8 @llvm.umax.i8(i8 %i438, i8 %i425)
  %i442 = tail call i8 @llvm.umin.i8(i8 %i438, i8 %i425)
  %i443 = zext i8 %i442 to i32
  %i444 = tail call i8 @llvm.umax.i8(i8 %i441, i8 %i426)
  %i445 = tail call i8 @llvm.umin.i8(i8 %i441, i8 %i426)
  %i446 = zext i8 %i445 to i32
  %i447 = tail call i8 @llvm.umin.i8(i8 %i444, i8 %i428)
  %i448 = zext i8 %i447 to i32
  %i449 = icmp ult i8 %i415, %i430
  %i450 = select i1 %i449, i32 %i431, i32 %i434
  %i451 = select i1 %i449, i32 %i434, i32 %i431
  %i452 = tail call i32 @llvm.umax.i32(i32 %i450, i32 %i437)
  %i453 = tail call i32 @llvm.umin.i32(i32 %i450, i32 %i437)
  %i454 = tail call i32 @llvm.umax.i32(i32 %i452, i32 %i440)
  %i455 = tail call i32 @llvm.umin.i32(i32 %i452, i32 %i440)
  %i456 = tail call i32 @llvm.umax.i32(i32 %i454, i32 %i443)
  %i457 = tail call i32 @llvm.umin.i32(i32 %i454, i32 %i443)
  %i458 = tail call i32 @llvm.umax.i32(i32 %i456, i32 %i446)
  %i459 = tail call i32 @llvm.umin.i32(i32 %i456, i32 %i446)
  %i460 = tail call i32 @llvm.umin.i32(i32 %i458, i32 %i448)
  %i461 = tail call i32 @llvm.umax.i32(i32 %i451, i32 %i453)
  %i462 = tail call i32 @llvm.umin.i32(i32 %i451, i32 %i453)
  %i463 = tail call i32 @llvm.umax.i32(i32 %i461, i32 %i455)
  %i464 = tail call i32 @llvm.umin.i32(i32 %i461, i32 %i455)
  %i465 = tail call i32 @llvm.umax.i32(i32 %i463, i32 %i457)
  %i466 = tail call i32 @llvm.umin.i32(i32 %i463, i32 %i457)
  %i467 = tail call i32 @llvm.umax.i32(i32 %i465, i32 %i459)
  %i468 = tail call i32 @llvm.umin.i32(i32 %i465, i32 %i459)
  %i469 = tail call i32 @llvm.umin.i32(i32 %i467, i32 %i460)
  %i470 = icmp ult i32 %i455, %i462
  %i471 = select i1 %i470, i32 %i462, i32 %i464
  %i472 = select i1 %i470, i32 %i464, i32 %i462
  %i473 = tail call i32 @llvm.umax.i32(i32 %i471, i32 %i466)
  %i474 = tail call i32 @llvm.umin.i32(i32 %i471, i32 %i466)
  %i475 = tail call i32 @llvm.umax.i32(i32 %i473, i32 %i468)
  %i476 = tail call i32 @llvm.umin.i32(i32 %i473, i32 %i468)
  %i477 = tail call i32 @llvm.umax.i32(i32 %i475, i32 %i469)
  %i478 = tail call i32 @llvm.umin.i32(i32 %i475, i32 %i469)
  %i479 = tail call i32 @llvm.umax.i32(i32 %i472, i32 %i474)
  %i480 = tail call i32 @llvm.umax.i32(i32 %i479, i32 %i476)
  %i481 = tail call i32 @llvm.umax.i32(i32 %i480, i32 %i478)
  %i482 = add nuw nsw i32 %i481, %i477
  %i483 = lshr i32 %i482, 1
  br label %bb515

bb484:                                            ; preds = %bb316
  %i485 = zext i8 %i334 to i32
  %i486 = mul nuw nsw i32 %i339, %i485
  %i487 = zext i8 %i341 to i32
  %i488 = mul nuw nsw i32 %i346, %i487
  %i489 = zext i8 %i347 to i32
  %i490 = mul nuw nsw i32 %i352, %i489
  %i491 = zext i8 %i357 to i32
  %i492 = mul nuw nsw i32 %i362, %i491
  %i493 = zext i8 %i364 to i32
  %i494 = mul nuw nsw i32 %i369, %i493
  %i495 = zext i8 %i370 to i32
  %i496 = mul nuw nsw i32 %i375, %i495
  %i497 = zext i8 %i378 to i32
  %i498 = mul nuw nsw i32 %i383, %i497
  %i499 = zext i8 %i385 to i32
  %i500 = mul nuw nsw i32 %i390, %i499
  %i501 = zext i8 %i391 to i32
  %i502 = mul nuw nsw i32 %i396, %i501
  %i503 = zext i8 %i331 to i32
  %i504 = mul nsw i32 %i503, -100
  %i505 = add nsw i32 %i486, %i504
  %i506 = add nsw i32 %i505, %i488
  %i507 = add nsw i32 %i506, %i490
  %i508 = add nsw i32 %i507, %i492
  %i509 = add nsw i32 %i508, %i494
  %i510 = add nsw i32 %i509, %i496
  %i511 = add nsw i32 %i510, %i498
  %i512 = add nsw i32 %i511, %i500
  %i513 = add nsw i32 %i512, %i502
  %i514 = sdiv i32 %i513, %i405
  br label %bb515

bb515:                                            ; preds = %bb484, %bb407
  %i516 = phi i32 [ %i514, %bb484 ], [ %i483, %bb407 ]
  %i517 = trunc i32 %i516 to i8
  %i518 = getelementptr inbounds i8, ptr %i319, i64 1
  store i8 %i517, ptr %i319, align 1, !tbaa !21
  %i519 = add nuw nsw i64 %i317, 1
  %i520 = load i32, ptr %i6, align 4, !tbaa !16
  %i521 = add nsw i32 %i520, -1
  %i522 = sext i32 %i521 to i64
  %i523 = icmp slt i64 %i519, %i522
  br i1 %i523, label %bb515.bb316_crit_edge, label %bb524, !llvm.loop !38

bb515.bb316_crit_edge:                            ; preds = %bb515
  br label %bb316

bb524:                                            ; preds = %bb515
  %i525 = load i32, ptr %i7, align 4, !tbaa !16
  br label %bb526

bb526:                                            ; preds = %bb524, %bb311
  %i527 = phi i32 [ %i312, %bb311 ], [ %i315, %bb524 ]
  %i528 = phi i32 [ %i306, %bb311 ], [ %i525, %bb524 ]
  %i529 = phi i32 [ %i307, %bb311 ], [ %i520, %bb524 ]
  %i530 = phi ptr [ %i308, %bb311 ], [ %i518, %bb524 ]
  %i531 = add nsw i32 %i528, -1
  %i532 = icmp slt i32 %i527, %i531
  br i1 %i532, label %bb526.bb305_crit_edge, label %bb533.loopexit, !llvm.loop !39

bb526.bb305_crit_edge:                            ; preds = %bb526
  br label %bb305

bb533.loopexit:                                   ; preds = %bb526
  br label %bb533

bb533:                                            ; preds = %bb533.loopexit, %bb304, %bb33.bb533_crit_edge
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @edge_draw(ptr nocapture noundef writeonly %arg, ptr noundef %arg1, i32 noundef %arg2, i32 noundef %arg3, i32 noundef %arg4) local_unnamed_addr #17 {
bb:
  %i = icmp eq i32 %arg4, 0
  %i5 = mul i32 %arg3, %arg2
  br i1 %i, label %bb6, label %bb.bb35_crit_edge

bb.bb35_crit_edge:                                ; preds = %bb
  br label %bb35

bb6:                                              ; preds = %bb
  %i7 = icmp sgt i32 %i5, 0
  br i1 %i7, label %bb8, label %bb6.bb74_crit_edge

bb6.bb74_crit_edge:                               ; preds = %bb6
  br label %bb74

bb8:                                              ; preds = %bb6
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
  %i18 = load i8, ptr %i16, align 1, !tbaa !21
  %i19 = icmp ult i8 %i18, 8
  br i1 %i19, label %bb20, label %bb15.bb31_crit_edge

bb15.bb31_crit_edge:                              ; preds = %bb15
  br label %bb31

bb20:                                             ; preds = %bb15
  %i21 = ptrtoint ptr %i16 to i64
  %i22 = sub i64 %i21, %i9
  %i23 = getelementptr i8, ptr %i12, i64 %i22
  %i24 = getelementptr inbounds i8, ptr %i23, i64 -1
  store i8 -1, ptr %i24, align 1, !tbaa !21
  %i25 = getelementptr inbounds i8, ptr %i23, i64 1
  store i8 -1, ptr %i23, align 1, !tbaa !21
  store i8 -1, ptr %i25, align 1, !tbaa !21
  %i26 = getelementptr inbounds i8, ptr %i25, i64 %i14
  store i8 -1, ptr %i26, align 1, !tbaa !21
  %i27 = getelementptr inbounds i8, ptr %i26, i64 2
  store i8 -1, ptr %i27, align 1, !tbaa !21
  %i28 = getelementptr inbounds i8, ptr %i27, i64 %i14
  %i29 = getelementptr inbounds i8, ptr %i28, i64 1
  store i8 -1, ptr %i28, align 1, !tbaa !21
  %i30 = getelementptr inbounds i8, ptr %i28, i64 2
  store i8 -1, ptr %i29, align 1, !tbaa !21
  store i8 -1, ptr %i30, align 1, !tbaa !21
  br label %bb31

bb31:                                             ; preds = %bb20, %bb15.bb31_crit_edge
  %i32 = getelementptr inbounds i8, ptr %i16, i64 1
  %i33 = add nuw nsw i32 %i17, 1
  %i34 = icmp eq i32 %i33, %i5
  br i1 %i34, label %bb35.loopexit, label %bb31.bb15_crit_edge, !llvm.loop !41

bb31.bb15_crit_edge:                              ; preds = %bb31
  br label %bb15

bb35.loopexit:                                    ; preds = %bb31
  br label %bb35

bb35:                                             ; preds = %bb35.loopexit, %bb.bb35_crit_edge
  %i36 = icmp sgt i32 %i5, 0
  br i1 %i36, label %bb37, label %bb35.bb74_crit_edge

bb35.bb74_crit_edge:                              ; preds = %bb35
  br label %bb74

bb37:                                             ; preds = %bb35
  %i38 = ptrtoint ptr %arg1 to i64
  %i39 = and i32 %i5, 1
  %i40 = icmp eq i32 %i5, 1
  br i1 %i40, label %bb37.bb64_crit_edge, label %bb41

bb37.bb64_crit_edge:                              ; preds = %bb37
  br label %bb64

bb41:                                             ; preds = %bb37
  %i42 = and i32 %i5, 2147483646
  br label %bb43

bb43:                                             ; preds = %bb60.bb43_crit_edge, %bb41
  %i44 = phi ptr [ %arg1, %bb41 ], [ %i61, %bb60.bb43_crit_edge ]
  %i45 = phi i32 [ 0, %bb41 ], [ %i62, %bb60.bb43_crit_edge ]
  %i46 = load i8, ptr %i44, align 1, !tbaa !21
  %i47 = icmp ult i8 %i46, 8
  br i1 %i47, label %bb48, label %bb43.bb52_crit_edge

bb43.bb52_crit_edge:                              ; preds = %bb43
  br label %bb52

bb48:                                             ; preds = %bb43
  %i49 = ptrtoint ptr %i44 to i64
  %i50 = sub i64 %i49, %i38
  %i51 = getelementptr inbounds i8, ptr %arg, i64 %i50
  store i8 0, ptr %i51, align 1, !tbaa !21
  br label %bb52

bb52:                                             ; preds = %bb48, %bb43.bb52_crit_edge
  %i53 = getelementptr inbounds i8, ptr %i44, i64 1
  %i54 = load i8, ptr %i53, align 1, !tbaa !21
  %i55 = icmp ult i8 %i54, 8
  br i1 %i55, label %bb56, label %bb52.bb60_crit_edge

bb52.bb60_crit_edge:                              ; preds = %bb52
  br label %bb60

bb56:                                             ; preds = %bb52
  %i57 = ptrtoint ptr %i53 to i64
  %i58 = sub i64 %i57, %i38
  %i59 = getelementptr inbounds i8, ptr %arg, i64 %i58
  store i8 0, ptr %i59, align 1, !tbaa !21
  br label %bb60

bb60:                                             ; preds = %bb56, %bb52.bb60_crit_edge
  %i61 = getelementptr inbounds i8, ptr %i44, i64 2
  %i62 = add i32 %i45, 2
  %i63 = icmp eq i32 %i62, %i42
  br i1 %i63, label %bb64.loopexit, label %bb60.bb43_crit_edge, !llvm.loop !42

bb60.bb43_crit_edge:                              ; preds = %bb60
  br label %bb43

bb64.loopexit:                                    ; preds = %bb60
  br label %bb64

bb64:                                             ; preds = %bb64.loopexit, %bb37.bb64_crit_edge
  %i65 = phi ptr [ %arg1, %bb37.bb64_crit_edge ], [ %i61, %bb64.loopexit ]
  %i66 = icmp eq i32 %i39, 0
  br i1 %i66, label %bb64.bb74_crit_edge, label %bb67

bb64.bb74_crit_edge:                              ; preds = %bb64
  br label %bb74

bb67:                                             ; preds = %bb64
  %i68 = load i8, ptr %i65, align 1, !tbaa !21
  %i69 = icmp ult i8 %i68, 8
  br i1 %i69, label %bb70, label %bb67.bb74_crit_edge

bb67.bb74_crit_edge:                              ; preds = %bb67
  br label %bb74

bb70:                                             ; preds = %bb67
  %i71 = ptrtoint ptr %i65 to i64
  %i72 = sub i64 %i71, %i38
  %i73 = getelementptr inbounds i8, ptr %arg, i64 %i72
  store i8 0, ptr %i73, align 1, !tbaa !21
  br label %bb74

bb74:                                             ; preds = %bb70, %bb67.bb74_crit_edge, %bb64.bb74_crit_edge, %bb35.bb74_crit_edge, %bb6.bb74_crit_edge
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @susan_thin(ptr nocapture noundef readonly %arg, ptr noundef %arg1, i32 noundef %arg2, i32 noundef %arg3) local_unnamed_addr #8 {
bb:
  %i = add nsw i32 %arg3, -4
  %i4 = icmp sgt i32 %arg3, 8
  br i1 %i4, label %bb5, label %bb.bb517_crit_edge

bb.bb517_crit_edge:                               ; preds = %bb
  br label %bb517

bb5:                                              ; preds = %bb
  %i6 = add nsw i32 %arg2, -4
  %i7 = getelementptr i8, ptr %arg1, i64 -1
  %i8 = icmp sgt i32 %arg2, 8
  %i9 = sext i32 %arg2 to i64
  br i1 %i8, label %bb10.preheader, label %bb5.bb517_crit_edge

bb5.bb517_crit_edge:                              ; preds = %bb5
  br label %bb517

bb10.preheader:                                   ; preds = %bb5
  br label %bb10

bb10:                                             ; preds = %bb511, %bb10.preheader
  %i11 = phi i32 [ %i512, %bb511 ], [ 4, %bb10.preheader ]
  %i12 = phi i32 [ %i513, %bb511 ], [ 4, %bb10.preheader ]
  %i13 = phi i32 [ %i506, %bb511 ], [ 0, %bb10.preheader ]
  %i14 = phi i32 [ %i505, %bb511 ], [ 0, %bb10.preheader ]
  %i15 = mul nsw i32 %i12, %arg2
  %i16 = add nsw i32 %i15, %i11
  %i17 = sext i32 %i16 to i64
  %i18 = getelementptr inbounds i8, ptr %arg1, i64 %i17
  %i19 = load i8, ptr %i18, align 1, !tbaa !21
  %i20 = icmp ult i8 %i19, 8
  br i1 %i20, label %bb21, label %bb10.bb504_crit_edge

bb10.bb504_crit_edge:                             ; preds = %bb10
  br label %bb504

bb21:                                             ; preds = %bb10
  %i22 = getelementptr inbounds i32, ptr %arg, i64 %i17
  %i23 = load i32, ptr %i22, align 4, !tbaa !16
  %i24 = add i32 %i12, -1
  %i25 = mul nsw i32 %i24, %arg2
  %i26 = sext i32 %i25 to i64
  %i27 = getelementptr inbounds i8, ptr %arg1, i64 %i26
  %i28 = sext i32 %i11 to i64
  %i29 = getelementptr inbounds i8, ptr %i27, i64 %i28
  %i30 = getelementptr inbounds i8, ptr %i29, i64 -1
  %i31 = load i8, ptr %i30, align 1, !tbaa !21
  %i32 = icmp ult i8 %i31, 8
  %i33 = zext i1 %i32 to i32
  %i34 = load i8, ptr %i29, align 1, !tbaa !21
  %i35 = icmp ult i8 %i34, 8
  %i36 = zext i1 %i35 to i32
  %i37 = add nuw nsw i32 %i36, %i33
  %i38 = getelementptr inbounds i8, ptr %i29, i64 1
  %i39 = load i8, ptr %i38, align 1, !tbaa !21
  %i40 = icmp ult i8 %i39, 8
  %i41 = zext i1 %i40 to i32
  %i42 = add nuw nsw i32 %i37, %i41
  %i43 = getelementptr inbounds i8, ptr %i30, i64 %i9
  %i44 = load i8, ptr %i43, align 1, !tbaa !21
  %i45 = icmp ult i8 %i44, 8
  %i46 = zext i1 %i45 to i32
  %i47 = add nuw nsw i32 %i42, %i46
  %i48 = getelementptr inbounds i8, ptr %i43, i64 2
  %i49 = load i8, ptr %i48, align 1, !tbaa !21
  %i50 = icmp ult i8 %i49, 8
  %i51 = zext i1 %i50 to i32
  %i52 = add nuw nsw i32 %i47, %i51
  %i53 = getelementptr inbounds i8, ptr %i43, i64 %i9
  %i54 = load i8, ptr %i53, align 1, !tbaa !21
  %i55 = icmp ult i8 %i54, 8
  %i56 = zext i1 %i55 to i32
  %i57 = add nuw nsw i32 %i52, %i56
  %i58 = getelementptr inbounds i8, ptr %i53, i64 1
  %i59 = load i8, ptr %i58, align 1, !tbaa !21
  %i60 = icmp ult i8 %i59, 8
  %i61 = zext i1 %i60 to i32
  %i62 = add nuw nsw i32 %i57, %i61
  %i63 = getelementptr inbounds i8, ptr %i53, i64 2
  %i64 = load i8, ptr %i63, align 1, !tbaa !21
  %i65 = icmp ult i8 %i64, 8
  %i66 = zext i1 %i65 to i32
  %i67 = add nuw nsw i32 %i62, %i66
  switch i32 %i67, label %bb246 [
    i32 0, label %bb245
    i32 1, label %bb68
    i32 2, label %bb317
  ]

bb68:                                             ; preds = %bb21
  %i69 = icmp ult i8 %i19, 6
  br i1 %i69, label %bb70, label %bb68.bb504_crit_edge

bb68.bb504_crit_edge:                             ; preds = %bb68
  br label %bb504

bb70:                                             ; preds = %bb68
  %i71 = add nsw i32 %i25, %i11
  %i72 = add nsw i32 %i71, -1
  %i73 = sext i32 %i72 to i64
  %i74 = getelementptr inbounds i32, ptr %arg, i64 %i73
  %i75 = load i32, ptr %i74, align 4, !tbaa !16
  %i76 = sext i32 %i71 to i64
  %i77 = getelementptr inbounds i32, ptr %arg, i64 %i76
  %i78 = load i32, ptr %i77, align 4, !tbaa !16
  %i79 = add nsw i32 %i71, 1
  %i80 = sext i32 %i79 to i64
  %i81 = getelementptr inbounds i32, ptr %arg, i64 %i80
  %i82 = load i32, ptr %i81, align 4, !tbaa !16
  %i83 = add nsw i32 %i16, -1
  %i84 = sext i32 %i83 to i64
  %i85 = getelementptr inbounds i32, ptr %arg, i64 %i84
  %i86 = load i32, ptr %i85, align 4, !tbaa !16
  %i87 = add nsw i32 %i16, 1
  %i88 = sext i32 %i87 to i64
  %i89 = getelementptr inbounds i32, ptr %arg, i64 %i88
  %i90 = load i32, ptr %i89, align 4, !tbaa !16
  %i91 = add nsw i32 %i12, 1
  %i92 = mul nsw i32 %i91, %arg2
  %i93 = add nsw i32 %i92, %i11
  %i94 = add nsw i32 %i93, -1
  %i95 = sext i32 %i94 to i64
  %i96 = getelementptr inbounds i32, ptr %arg, i64 %i95
  %i97 = load i32, ptr %i96, align 4, !tbaa !16
  %i98 = sext i32 %i93 to i64
  %i99 = getelementptr inbounds i32, ptr %arg, i64 %i98
  %i100 = load i32, ptr %i99, align 4, !tbaa !16
  %i101 = add nsw i32 %i93, 1
  %i102 = sext i32 %i101 to i64
  %i103 = getelementptr inbounds i32, ptr %arg, i64 %i102
  %i104 = load i32, ptr %i103, align 4, !tbaa !16
  %i105 = getelementptr inbounds i8, ptr %arg1, i64 %i73
  %i106 = load i8, ptr %i105, align 1, !tbaa !21
  %i107 = icmp ult i8 %i106, 8
  br i1 %i107, label %bb178, label %bb108

bb108:                                            ; preds = %bb70
  %i109 = getelementptr inbounds i8, ptr %arg1, i64 %i76
  %i110 = load i8, ptr %i109, align 1, !tbaa !21
  %i111 = icmp ult i8 %i110, 8
  br i1 %i111, label %bb172, label %bb112

bb112:                                            ; preds = %bb108
  %i113 = getelementptr inbounds i8, ptr %arg1, i64 %i80
  %i114 = load i8, ptr %i113, align 1, !tbaa !21
  %i115 = icmp ult i8 %i114, 8
  br i1 %i115, label %bb166, label %bb116

bb116:                                            ; preds = %bb112
  %i117 = getelementptr inbounds i8, ptr %arg1, i64 %i84
  %i118 = load i8, ptr %i117, align 1, !tbaa !21
  %i119 = icmp ult i8 %i118, 8
  br i1 %i119, label %bb160, label %bb120

bb120:                                            ; preds = %bb116
  %i121 = getelementptr inbounds i8, ptr %arg1, i64 %i88
  %i122 = load i8, ptr %i121, align 1, !tbaa !21
  %i123 = icmp ult i8 %i122, 8
  br i1 %i123, label %bb154, label %bb124

bb124:                                            ; preds = %bb120
  %i125 = getelementptr inbounds i8, ptr %arg1, i64 %i95
  %i126 = load i8, ptr %i125, align 1, !tbaa !21
  %i127 = icmp ult i8 %i126, 8
  br i1 %i127, label %bb148, label %bb128

bb128:                                            ; preds = %bb124
  %i129 = getelementptr inbounds i8, ptr %arg1, i64 %i98
  %i130 = load i8, ptr %i129, align 1, !tbaa !21
  %i131 = icmp ult i8 %i130, 8
  br i1 %i131, label %bb142, label %bb132

bb132:                                            ; preds = %bb128
  %i133 = getelementptr inbounds i8, ptr %arg1, i64 %i102
  %i134 = load i8, ptr %i133, align 1, !tbaa !21
  %i135 = icmp ult i8 %i134, 8
  br i1 %i135, label %bb136, label %bb132.bb184_crit_edge

bb132.bb184_crit_edge:                            ; preds = %bb132
  br label %bb184

bb136:                                            ; preds = %bb132
  %i137 = shl nsw i32 %i97, 1
  %i138 = shl nsw i32 %i82, 1
  %i139 = mul nsw i32 %i78, 3
  %i140 = mul nsw i32 %i86, 3
  %i141 = shl nsw i32 %i75, 2
  br label %bb184

bb142:                                            ; preds = %bb128
  %i143 = shl nsw i32 %i86, 1
  %i144 = shl nsw i32 %i90, 1
  %i145 = mul nsw i32 %i75, 3
  %i146 = mul nsw i32 %i82, 3
  %i147 = shl nsw i32 %i78, 2
  br label %bb184

bb148:                                            ; preds = %bb124
  %i149 = shl nsw i32 %i75, 1
  %i150 = shl nsw i32 %i104, 1
  %i151 = mul nsw i32 %i78, 3
  %i152 = mul nsw i32 %i90, 3
  %i153 = shl nsw i32 %i82, 2
  br label %bb184

bb154:                                            ; preds = %bb120
  %i155 = shl nsw i32 %i78, 1
  %i156 = shl nsw i32 %i100, 1
  %i157 = mul nsw i32 %i75, 3
  %i158 = mul nsw i32 %i97, 3
  %i159 = shl nsw i32 %i86, 2
  br label %bb184

bb160:                                            ; preds = %bb116
  %i161 = shl nsw i32 %i78, 1
  %i162 = shl nsw i32 %i100, 1
  %i163 = mul nsw i32 %i82, 3
  %i164 = mul nsw i32 %i104, 3
  %i165 = shl nsw i32 %i90, 2
  br label %bb184

bb166:                                            ; preds = %bb112
  %i167 = shl nsw i32 %i75, 1
  %i168 = shl nsw i32 %i104, 1
  %i169 = mul nsw i32 %i86, 3
  %i170 = mul nsw i32 %i100, 3
  %i171 = shl nsw i32 %i97, 2
  br label %bb184

bb172:                                            ; preds = %bb108
  %i173 = shl nsw i32 %i86, 1
  %i174 = shl nsw i32 %i90, 1
  %i175 = mul nsw i32 %i97, 3
  %i176 = mul nsw i32 %i104, 3
  %i177 = shl nsw i32 %i100, 2
  br label %bb184

bb178:                                            ; preds = %bb70
  %i179 = shl nsw i32 %i82, 1
  %i180 = shl nsw i32 %i97, 1
  %i181 = mul nsw i32 %i90, 3
  %i182 = mul nsw i32 %i100, 3
  %i183 = shl nsw i32 %i104, 2
  br label %bb184

bb184:                                            ; preds = %bb178, %bb172, %bb166, %bb160, %bb154, %bb148, %bb142, %bb136, %bb132.bb184_crit_edge
  %i185 = phi i32 [ %i182, %bb178 ], [ %i177, %bb172 ], [ %i170, %bb166 ], [ %i162, %bb160 ], [ %i156, %bb154 ], [ 0, %bb148 ], [ 0, %bb142 ], [ 0, %bb136 ], [ %i100, %bb132.bb184_crit_edge ]
  %i186 = phi i32 [ %i180, %bb178 ], [ %i175, %bb172 ], [ %i171, %bb166 ], [ 0, %bb160 ], [ %i158, %bb154 ], [ 0, %bb148 ], [ 0, %bb142 ], [ %i137, %bb136 ], [ %i97, %bb132.bb184_crit_edge ]
  %i187 = phi i32 [ %i181, %bb178 ], [ %i174, %bb172 ], [ 0, %bb166 ], [ %i165, %bb160 ], [ 0, %bb154 ], [ %i152, %bb148 ], [ %i144, %bb142 ], [ 0, %bb136 ], [ %i90, %bb132.bb184_crit_edge ]
  %i188 = phi i32 [ %i183, %bb178 ], [ %i176, %bb172 ], [ %i168, %bb166 ], [ %i164, %bb160 ], [ 0, %bb154 ], [ %i150, %bb148 ], [ 0, %bb142 ], [ 0, %bb136 ], [ %i104, %bb132.bb184_crit_edge ]
  %i189 = phi i32 [ 0, %bb178 ], [ %i173, %bb172 ], [ %i169, %bb166 ], [ 0, %bb160 ], [ %i159, %bb154 ], [ 0, %bb148 ], [ %i143, %bb142 ], [ %i140, %bb136 ], [ %i86, %bb132.bb184_crit_edge ]
  %i190 = phi i32 [ %i179, %bb178 ], [ 0, %bb172 ], [ 0, %bb166 ], [ %i163, %bb160 ], [ 0, %bb154 ], [ %i153, %bb148 ], [ %i146, %bb142 ], [ %i138, %bb136 ], [ %i82, %bb132.bb184_crit_edge ]
  %i191 = phi i32 [ 0, %bb178 ], [ 0, %bb172 ], [ 0, %bb166 ], [ %i161, %bb160 ], [ %i155, %bb154 ], [ %i151, %bb148 ], [ %i147, %bb142 ], [ %i139, %bb136 ], [ %i78, %bb132.bb184_crit_edge ]
  %i192 = phi i32 [ 0, %bb178 ], [ 0, %bb172 ], [ %i167, %bb166 ], [ 0, %bb160 ], [ %i157, %bb154 ], [ %i149, %bb148 ], [ %i145, %bb142 ], [ %i141, %bb136 ], [ %i75, %bb132.bb184_crit_edge ]
  %i193 = icmp sgt i32 %i192, 0
  %i194 = tail call i32 @llvm.smax.i32(i32 %i192, i32 0)
  %i195 = select i1 %i193, i32 0, i32 %i13
  %i196 = icmp sgt i32 %i191, %i194
  %i197 = tail call i32 @llvm.smax.i32(i32 %i191, i32 %i194)
  %i198 = select i1 %i196, i32 1, i32 %i195
  %i199 = icmp sgt i32 %i190, %i197
  %i200 = tail call i32 @llvm.smax.i32(i32 %i190, i32 %i197)
  %i201 = select i1 %i199, i1 true, i1 %i196
  %i202 = select i1 %i201, i1 true, i1 %i193
  %i203 = select i1 %i202, i32 0, i32 %i14
  %i204 = select i1 %i199, i32 2, i32 %i198
  %i205 = icmp sgt i32 %i189, %i200
  %i206 = tail call i32 @llvm.smax.i32(i32 %i189, i32 %i200)
  %i207 = select i1 %i205, i32 0, i32 %i204
  %i208 = icmp sgt i32 %i187, %i206
  %i209 = tail call i32 @llvm.smax.i32(i32 %i187, i32 %i206)
  %i210 = select i1 %i208, i1 true, i1 %i205
  %i211 = select i1 %i210, i32 1, i32 %i203
  %i212 = select i1 %i208, i32 2, i32 %i207
  %i213 = icmp sgt i32 %i186, %i209
  %i214 = tail call i32 @llvm.smax.i32(i32 %i186, i32 %i209)
  %i215 = select i1 %i213, i32 0, i32 %i212
  %i216 = icmp sgt i32 %i185, %i214
  %i217 = tail call i32 @llvm.smax.i32(i32 %i185, i32 %i214)
  %i218 = select i1 %i216, i32 1, i32 %i215
  %i219 = icmp sgt i32 %i188, %i217
  %i220 = tail call i32 @llvm.smax.i32(i32 %i188, i32 %i217)
  %i221 = select i1 %i219, i1 true, i1 %i216
  %i222 = select i1 %i221, i1 true, i1 %i213
  %i223 = select i1 %i222, i32 2, i32 %i211
  %i224 = select i1 %i219, i32 2, i32 %i218
  %i225 = icmp eq i32 %i220, 0
  br i1 %i225, label %bb184.bb504_crit_edge, label %bb226

bb184.bb504_crit_edge:                            ; preds = %bb184
  br label %bb504

bb226:                                            ; preds = %bb184
  %i227 = icmp ult i8 %i19, 4
  %i228 = add nuw nsw i8 %i19, 1
  %i229 = select i1 %i227, i8 4, i8 %i228
  %i230 = add i32 %i24, %i223
  %i231 = mul nsw i32 %i230, %arg2
  %i232 = add i32 %i224, %i11
  %i233 = add i32 %i232, %i231
  %i234 = sext i32 %i233 to i64
  %i235 = getelementptr i8, ptr %i7, i64 %i234
  store i8 %i229, ptr %i235, align 1, !tbaa !21
  %i236 = shl nuw nsw i32 %i223, 1
  %i237 = add nuw nsw i32 %i236, %i224
  %i238 = icmp slt i32 %i237, 3
  br i1 %i238, label %bb239, label %bb226.bb504_crit_edge

bb226.bb504_crit_edge:                            ; preds = %bb226
  br label %bb504

bb239:                                            ; preds = %bb226
  %i240 = add i32 %i24, %i223
  %i241 = add i32 %i11, -2
  %i242 = add i32 %i241, %i224
  %i243 = tail call i32 @llvm.smax.i32(i32 %i240, i32 4)
  %i244 = tail call i32 @llvm.smax.i32(i32 %i242, i32 4)
  br label %bb504

bb245:                                            ; preds = %bb21
  store i8 100, ptr %i18, align 1, !tbaa !21
  br label %bb504

bb246:                                            ; preds = %bb21
  %i247 = add nsw i32 %i12, -1
  %i248 = mul nsw i32 %i247, %arg2
  %i249 = add nsw i32 %i248, %i11
  %i250 = sext i32 %i249 to i64
  %i251 = getelementptr inbounds i8, ptr %arg1, i64 %i250
  %i252 = load i8, ptr %i251, align 1, !tbaa !21
  %i253 = icmp ult i8 %i252, 8
  %i254 = zext i1 %i253 to i32
  %i255 = mul nsw i32 %i12, %arg2
  %i256 = add nsw i32 %i255, %i11
  %i257 = sext i32 %i256 to i64
  %i258 = getelementptr i8, ptr %arg1, i64 %i257
  %i259 = getelementptr i8, ptr %i258, i64 1
  %i260 = load i8, ptr %i259, align 1, !tbaa !21
  %i261 = icmp ult i8 %i260, 8
  %i262 = zext i1 %i261 to i32
  %i263 = add nsw i32 %i12, 1
  %i264 = mul nsw i32 %i263, %arg2
  %i265 = add nsw i32 %i264, %i11
  %i266 = sext i32 %i265 to i64
  %i267 = getelementptr inbounds i8, ptr %arg1, i64 %i266
  %i268 = load i8, ptr %i267, align 1, !tbaa !21
  %i269 = icmp ult i8 %i268, 8
  %i270 = zext i1 %i269 to i32
  %i271 = getelementptr i8, ptr %i258, i64 -1
  %i272 = load i8, ptr %i271, align 1, !tbaa !21
  %i273 = icmp ult i8 %i272, 8
  %i274 = zext i1 %i273 to i32
  %i275 = add nuw nsw i32 %i262, %i254
  %i276 = add nuw nsw i32 %i275, %i270
  %i277 = add nuw nsw i32 %i276, %i274
  %i278 = icmp ugt i32 %i277, 1
  br i1 %i278, label %bb279, label %bb246.bb504_crit_edge

bb246.bb504_crit_edge:                            ; preds = %bb246
  br label %bb504

bb279:                                            ; preds = %bb246
  %i280 = getelementptr i8, ptr %i251, i64 -1
  %i281 = load i8, ptr %i280, align 1, !tbaa !21
  %i282 = icmp ult i8 %i281, 8
  %i283 = getelementptr i8, ptr %i251, i64 1
  %i284 = load i8, ptr %i283, align 1, !tbaa !21
  %i285 = icmp ult i8 %i284, 8
  %i286 = getelementptr i8, ptr %i267, i64 -1
  %i287 = load i8, ptr %i286, align 1, !tbaa !21
  %i288 = icmp ult i8 %i287, 8
  %i289 = getelementptr i8, ptr %i267, i64 1
  %i290 = load i8, ptr %i289, align 1, !tbaa !21
  %i291 = icmp ult i8 %i290, 8
  %i292 = or i1 %i253, %i282
  %i293 = zext i1 %i292 to i32
  %i294 = or i1 %i261, %i285
  %i295 = zext i1 %i294 to i32
  %i296 = or i1 %i269, %i291
  %i297 = zext i1 %i296 to i32
  %i298 = or i1 %i273, %i288
  %i299 = zext i1 %i298 to i32
  %i300 = and i32 %i295, %i254
  %i301 = and i32 %i297, %i262
  %i302 = and i32 %i299, %i270
  %i303 = and i32 %i293, %i274
  %i304 = add nuw nsw i32 %i295, %i293
  %i305 = add nuw nsw i32 %i304, %i299
  %i306 = add nuw nsw i32 %i303, %i300
  %i307 = add nuw nsw i32 %i305, %i297
  %i308 = add nuw nsw i32 %i306, %i302
  %i309 = add nuw nsw i32 %i308, %i301
  %i310 = sub nsw i32 %i307, %i309
  %i311 = icmp slt i32 %i310, 2
  br i1 %i311, label %bb312, label %bb279.bb504_crit_edge

bb279.bb504_crit_edge:                            ; preds = %bb279
  br label %bb504

bb312:                                            ; preds = %bb279
  store i8 100, ptr %i258, align 1, !tbaa !21
  %i313 = tail call i32 @llvm.smax.i32(i32 %i12, i32 5)
  %i314 = add nsw i32 %i313, -1
  %i315 = tail call i32 @llvm.smax.i32(i32 %i11, i32 6)
  %i316 = add nsw i32 %i315, -2
  br label %bb504

bb317:                                            ; preds = %bb21
  %i318 = add nsw i32 %i12, -1
  %i319 = mul nsw i32 %i318, %arg2
  %i320 = add nsw i32 %i319, %i11
  %i321 = sext i32 %i320 to i64
  %i322 = getelementptr i8, ptr %arg1, i64 %i321
  %i323 = getelementptr i8, ptr %i322, i64 -1
  %i324 = load i8, ptr %i323, align 1, !tbaa !21
  %i325 = icmp ult i8 %i324, 8
  %i326 = zext i1 %i325 to i32
  %i327 = getelementptr i8, ptr %i322, i64 1
  %i328 = load i8, ptr %i327, align 1, !tbaa !21
  %i329 = icmp ult i8 %i328, 8
  %i330 = zext i1 %i329 to i32
  %i331 = add nsw i32 %i12, 1
  %i332 = mul nsw i32 %i331, %arg2
  %i333 = add nsw i32 %i332, %i11
  %i334 = sext i32 %i333 to i64
  %i335 = getelementptr i8, ptr %arg1, i64 %i334
  %i336 = getelementptr i8, ptr %i335, i64 -1
  %i337 = load i8, ptr %i336, align 1, !tbaa !21
  %i338 = icmp ult i8 %i337, 8
  %i339 = zext i1 %i338 to i32
  %i340 = getelementptr i8, ptr %i335, i64 1
  %i341 = load i8, ptr %i340, align 1, !tbaa !21
  %i342 = icmp ult i8 %i341, 8
  %i343 = zext i1 %i342 to i32
  %i344 = add nuw nsw i32 %i330, %i326
  %i345 = add nuw nsw i32 %i344, %i339
  %i346 = add nuw nsw i32 %i345, %i343
  %i347 = icmp eq i32 %i346, 2
  br i1 %i347, label %bb348, label %bb317.bb425_crit_edge

bb317.bb425_crit_edge:                            ; preds = %bb317
  br label %bb425

bb348:                                            ; preds = %bb317
  %i349 = or i32 %i343, %i326
  %i350 = or i32 %i339, %i330
  %i351 = and i32 %i349, %i350
  %i352 = icmp eq i32 %i351, 0
  br i1 %i352, label %bb348.bb425_crit_edge, label %bb353

bb348.bb425_crit_edge:                            ; preds = %bb348
  br label %bb425

bb353:                                            ; preds = %bb348
  %i354 = xor i1 %i329, true
  br i1 %i325, label %bb357, label %bb355

bb355:                                            ; preds = %bb353
  %i356 = zext i1 %i354 to i32
  br label %bb360

bb357:                                            ; preds = %bb353
  %i358 = sext i1 %i354 to i32
  %i359 = sext i1 %i329 to i32
  br label %bb360

bb360:                                            ; preds = %bb357, %bb355
  %i361 = phi i1 [ %i329, %bb357 ], [ %i354, %bb355 ]
  %i362 = phi i32 [ %i358, %bb357 ], [ %i330, %bb355 ]
  %i363 = phi i1 [ %i354, %bb357 ], [ %i329, %bb355 ]
  %i364 = phi i32 [ %i359, %bb357 ], [ %i356, %bb355 ]
  %i365 = add nsw i32 %i364, %i12
  %i366 = mul nsw i32 %i365, %arg2
  %i367 = add i32 %i362, %i11
  %i368 = add i32 %i367, %i366
  %i369 = sext i32 %i368 to i64
  %i370 = getelementptr inbounds i32, ptr %arg, i64 %i369
  %i371 = load i32, ptr %i370, align 4, !tbaa !16
  %i372 = sitofp i32 %i371 to float
  %i373 = sitofp i32 %i23 to float
  %i374 = fdiv float %i372, %i373
  %i375 = fpext float %i374 to double
  %i376 = fcmp ogt double %i375, 0x3FE6666666666666
  br i1 %i376, label %bb377, label %bb360.bb504_crit_edge

bb360.bb504_crit_edge:                            ; preds = %bb360
  br label %bb504

bb377:                                            ; preds = %bb360
  br i1 %i361, label %bb378, label %bb377.bb398_crit_edge

bb377.bb398_crit_edge:                            ; preds = %bb377
  br label %bb398

bb378:                                            ; preds = %bb377
  %i379 = shl nsw i32 %i364, 1
  %i380 = add nsw i32 %i379, %i12
  %i381 = mul nsw i32 %i380, %arg2
  %i382 = add nsw i32 %i381, %i11
  %i383 = sext i32 %i382 to i64
  %i384 = getelementptr inbounds i8, ptr %arg1, i64 %i383
  %i385 = load i8, ptr %i384, align 1, !tbaa !21
  %i386 = icmp ugt i8 %i385, 7
  br i1 %i386, label %bb387, label %bb378.bb398_crit_edge

bb378.bb398_crit_edge:                            ; preds = %bb378
  br label %bb398

bb387:                                            ; preds = %bb378
  %i388 = getelementptr i8, ptr %i384, i64 -1
  %i389 = load i8, ptr %i388, align 1, !tbaa !21
  %i390 = icmp ugt i8 %i389, 7
  br i1 %i390, label %bb391, label %bb387.bb398_crit_edge

bb387.bb398_crit_edge:                            ; preds = %bb387
  br label %bb398

bb391:                                            ; preds = %bb387
  %i392 = getelementptr i8, ptr %i384, i64 1
  %i393 = load i8, ptr %i392, align 1, !tbaa !21
  %i394 = icmp ugt i8 %i393, 7
  br i1 %i394, label %bb395, label %bb391.bb398_crit_edge

bb391.bb398_crit_edge:                            ; preds = %bb391
  br label %bb398

bb395:                                            ; preds = %bb391
  %i396 = mul nsw i32 %i12, %arg2
  %i397 = add nsw i32 %i396, %i11
  br label %bb420

bb398:                                            ; preds = %bb391.bb398_crit_edge, %bb387.bb398_crit_edge, %bb378.bb398_crit_edge, %bb377.bb398_crit_edge
  br i1 %i363, label %bb399, label %bb398.bb504_crit_edge

bb398.bb504_crit_edge:                            ; preds = %bb398
  br label %bb504

bb399:                                            ; preds = %bb398
  %i400 = mul nsw i32 %i12, %arg2
  %i401 = add nsw i32 %i400, %i11
  %i402 = shl nsw i32 %i362, 1
  %i403 = add nsw i32 %i401, %i402
  %i404 = sext i32 %i403 to i64
  %i405 = getelementptr inbounds i8, ptr %arg1, i64 %i404
  %i406 = load i8, ptr %i405, align 1, !tbaa !21
  %i407 = icmp ugt i8 %i406, 7
  br i1 %i407, label %bb408, label %bb399.bb504_crit_edge

bb399.bb504_crit_edge:                            ; preds = %bb399
  br label %bb504

bb408:                                            ; preds = %bb399
  %i409 = add nsw i32 %i402, %i333
  %i410 = sext i32 %i409 to i64
  %i411 = getelementptr inbounds i8, ptr %arg1, i64 %i410
  %i412 = load i8, ptr %i411, align 1, !tbaa !21
  %i413 = icmp ugt i8 %i412, 7
  br i1 %i413, label %bb414, label %bb408.bb504_crit_edge

bb408.bb504_crit_edge:                            ; preds = %bb408
  br label %bb504

bb414:                                            ; preds = %bb408
  %i415 = add nsw i32 %i402, %i320
  %i416 = sext i32 %i415 to i64
  %i417 = getelementptr inbounds i8, ptr %arg1, i64 %i416
  %i418 = load i8, ptr %i417, align 1, !tbaa !21
  %i419 = icmp ugt i8 %i418, 7
  br i1 %i419, label %bb414.bb420_crit_edge, label %bb414.bb504_crit_edge

bb414.bb504_crit_edge:                            ; preds = %bb414
  br label %bb504

bb414.bb420_crit_edge:                            ; preds = %bb414
  br label %bb420

bb420:                                            ; preds = %bb414.bb420_crit_edge, %bb395
  %i421 = phi i32 [ %i397, %bb395 ], [ %i401, %bb414.bb420_crit_edge ]
  %i422 = sext i32 %i421 to i64
  %i423 = getelementptr inbounds i8, ptr %arg1, i64 %i422
  store i8 100, ptr %i423, align 1, !tbaa !21
  %i424 = getelementptr inbounds i8, ptr %arg1, i64 %i369
  store i8 3, ptr %i424, align 1, !tbaa !21
  br label %bb504

bb425:                                            ; preds = %bb348.bb425_crit_edge, %bb317.bb425_crit_edge
  %i426 = load i8, ptr %i322, align 1, !tbaa !21
  %i427 = icmp ult i8 %i426, 8
  %i428 = zext i1 %i427 to i32
  %i429 = mul nsw i32 %i12, %arg2
  %i430 = add nsw i32 %i429, %i11
  %i431 = sext i32 %i430 to i64
  %i432 = getelementptr i8, ptr %arg1, i64 %i431
  %i433 = getelementptr i8, ptr %i432, i64 1
  %i434 = load i8, ptr %i433, align 1, !tbaa !21
  %i435 = icmp ult i8 %i434, 8
  %i436 = zext i1 %i435 to i32
  %i437 = load i8, ptr %i335, align 1, !tbaa !21
  %i438 = icmp ult i8 %i437, 8
  %i439 = zext i1 %i438 to i32
  %i440 = getelementptr i8, ptr %i432, i64 -1
  %i441 = load i8, ptr %i440, align 1, !tbaa !21
  %i442 = icmp ult i8 %i441, 8
  %i443 = zext i1 %i442 to i32
  %i444 = add nuw nsw i32 %i436, %i428
  %i445 = add nuw nsw i32 %i444, %i439
  %i446 = add nuw nsw i32 %i445, %i443
  %i447 = icmp eq i32 %i446, 2
  br i1 %i447, label %bb448, label %bb425.bb504_crit_edge

bb425.bb504_crit_edge:                            ; preds = %bb425
  br label %bb504

bb448:                                            ; preds = %bb425
  %i449 = or i32 %i443, %i436
  %i450 = or i32 %i439, %i428
  %i451 = and i32 %i449, %i450
  %i452 = icmp eq i32 %i451, 0
  br i1 %i452, label %bb448.bb504_crit_edge, label %bb453

bb448.bb504_crit_edge:                            ; preds = %bb448
  br label %bb504

bb453:                                            ; preds = %bb448
  %i454 = add nsw i32 %i12, -2
  %i455 = mul nsw i32 %i454, %arg2
  %i456 = add nsw i32 %i455, %i11
  %i457 = sext i32 %i456 to i64
  %i458 = getelementptr i8, ptr %arg1, i64 %i457
  %i459 = getelementptr i8, ptr %i458, i64 -1
  %i460 = load i8, ptr %i459, align 1, !tbaa !21
  %i461 = icmp ult i8 %i460, 8
  %i462 = getelementptr i8, ptr %i458, i64 1
  %i463 = load i8, ptr %i462, align 1, !tbaa !21
  %i464 = icmp ult i8 %i463, 8
  %i465 = or i1 %i461, %i464
  %i466 = and i1 %i427, %i465
  %i467 = getelementptr i8, ptr %i322, i64 -2
  %i468 = load i8, ptr %i467, align 1, !tbaa !21
  %i469 = icmp ult i8 %i468, 8
  %i470 = getelementptr i8, ptr %i335, i64 -2
  %i471 = load i8, ptr %i470, align 1, !tbaa !21
  %i472 = icmp ult i8 %i471, 8
  %i473 = or i1 %i469, %i472
  %i474 = and i1 %i442, %i473
  %i475 = or i1 %i466, %i474
  %i476 = getelementptr i8, ptr %i322, i64 2
  %i477 = load i8, ptr %i476, align 1, !tbaa !21
  %i478 = icmp ult i8 %i477, 8
  %i479 = getelementptr i8, ptr %i335, i64 2
  %i480 = load i8, ptr %i479, align 1, !tbaa !21
  %i481 = icmp ult i8 %i480, 8
  %i482 = or i1 %i478, %i481
  %i483 = and i1 %i435, %i482
  %i484 = or i1 %i475, %i483
  %i485 = add nsw i32 %i12, 2
  %i486 = mul nsw i32 %i485, %arg2
  %i487 = add nsw i32 %i486, %i11
  %i488 = sext i32 %i487 to i64
  %i489 = getelementptr i8, ptr %arg1, i64 %i488
  %i490 = getelementptr i8, ptr %i489, i64 -1
  %i491 = load i8, ptr %i490, align 1, !tbaa !21
  %i492 = icmp ult i8 %i491, 8
  %i493 = getelementptr i8, ptr %i489, i64 1
  %i494 = load i8, ptr %i493, align 1, !tbaa !21
  %i495 = icmp ult i8 %i494, 8
  %i496 = or i1 %i492, %i495
  %i497 = and i1 %i438, %i496
  %i498 = or i1 %i484, %i497
  br i1 %i498, label %bb499, label %bb453.bb504_crit_edge

bb453.bb504_crit_edge:                            ; preds = %bb453
  br label %bb504

bb499:                                            ; preds = %bb453
  store i8 100, ptr %i432, align 1, !tbaa !21
  %i500 = tail call i32 @llvm.smax.i32(i32 %i12, i32 5)
  %i501 = add nsw i32 %i500, -1
  %i502 = tail call i32 @llvm.smax.i32(i32 %i11, i32 6)
  %i503 = add nsw i32 %i502, -2
  br label %bb504

bb504:                                            ; preds = %bb499, %bb453.bb504_crit_edge, %bb448.bb504_crit_edge, %bb425.bb504_crit_edge, %bb420, %bb414.bb504_crit_edge, %bb408.bb504_crit_edge, %bb399.bb504_crit_edge, %bb398.bb504_crit_edge, %bb360.bb504_crit_edge, %bb312, %bb279.bb504_crit_edge, %bb246.bb504_crit_edge, %bb245, %bb239, %bb226.bb504_crit_edge, %bb184.bb504_crit_edge, %bb68.bb504_crit_edge, %bb10.bb504_crit_edge
  %i505 = phi i32 [ %i14, %bb312 ], [ %i14, %bb279.bb504_crit_edge ], [ %i14, %bb246.bb504_crit_edge ], [ %i14, %bb10.bb504_crit_edge ], [ %i14, %bb425.bb504_crit_edge ], [ %i14, %bb448.bb504_crit_edge ], [ %i14, %bb453.bb504_crit_edge ], [ %i14, %bb499 ], [ %i14, %bb360.bb504_crit_edge ], [ %i14, %bb398.bb504_crit_edge ], [ %i14, %bb399.bb504_crit_edge ], [ %i14, %bb408.bb504_crit_edge ], [ %i14, %bb414.bb504_crit_edge ], [ %i14, %bb420 ], [ %i14, %bb245 ], [ %i14, %bb68.bb504_crit_edge ], [ %i223, %bb239 ], [ %i223, %bb226.bb504_crit_edge ], [ %i223, %bb184.bb504_crit_edge ]
  %i506 = phi i32 [ %i13, %bb312 ], [ %i13, %bb279.bb504_crit_edge ], [ %i13, %bb246.bb504_crit_edge ], [ %i13, %bb10.bb504_crit_edge ], [ %i13, %bb425.bb504_crit_edge ], [ %i13, %bb448.bb504_crit_edge ], [ %i13, %bb453.bb504_crit_edge ], [ %i13, %bb499 ], [ %i13, %bb360.bb504_crit_edge ], [ %i13, %bb398.bb504_crit_edge ], [ %i13, %bb399.bb504_crit_edge ], [ %i13, %bb408.bb504_crit_edge ], [ %i13, %bb414.bb504_crit_edge ], [ %i13, %bb420 ], [ %i13, %bb245 ], [ %i13, %bb68.bb504_crit_edge ], [ %i224, %bb239 ], [ %i224, %bb226.bb504_crit_edge ], [ %i224, %bb184.bb504_crit_edge ]
  %i507 = phi i32 [ %i314, %bb312 ], [ %i12, %bb279.bb504_crit_edge ], [ %i12, %bb246.bb504_crit_edge ], [ %i12, %bb10.bb504_crit_edge ], [ %i12, %bb425.bb504_crit_edge ], [ %i12, %bb448.bb504_crit_edge ], [ %i12, %bb453.bb504_crit_edge ], [ %i501, %bb499 ], [ %i12, %bb360.bb504_crit_edge ], [ %i12, %bb398.bb504_crit_edge ], [ %i12, %bb399.bb504_crit_edge ], [ %i12, %bb408.bb504_crit_edge ], [ %i12, %bb414.bb504_crit_edge ], [ %i12, %bb420 ], [ %i12, %bb245 ], [ %i12, %bb68.bb504_crit_edge ], [ %i243, %bb239 ], [ %i12, %bb226.bb504_crit_edge ], [ %i12, %bb184.bb504_crit_edge ]
  %i508 = phi i32 [ %i316, %bb312 ], [ %i11, %bb279.bb504_crit_edge ], [ %i11, %bb246.bb504_crit_edge ], [ %i11, %bb10.bb504_crit_edge ], [ %i11, %bb425.bb504_crit_edge ], [ %i11, %bb448.bb504_crit_edge ], [ %i11, %bb453.bb504_crit_edge ], [ %i503, %bb499 ], [ %i11, %bb360.bb504_crit_edge ], [ %i11, %bb398.bb504_crit_edge ], [ %i11, %bb399.bb504_crit_edge ], [ %i11, %bb408.bb504_crit_edge ], [ %i11, %bb414.bb504_crit_edge ], [ %i11, %bb420 ], [ %i11, %bb245 ], [ %i11, %bb68.bb504_crit_edge ], [ %i244, %bb239 ], [ %i11, %bb226.bb504_crit_edge ], [ %i11, %bb184.bb504_crit_edge ]
  %i509 = add nsw i32 %i508, 1
  %i510 = icmp slt i32 %i509, %i6
  br i1 %i510, label %bb504.bb511_crit_edge, label %bb514

bb504.bb511_crit_edge:                            ; preds = %bb504
  br label %bb511

bb511:                                            ; preds = %bb514.bb511_crit_edge, %bb504.bb511_crit_edge
  %i512 = phi i32 [ %i509, %bb504.bb511_crit_edge ], [ 4, %bb514.bb511_crit_edge ]
  %i513 = phi i32 [ %i507, %bb504.bb511_crit_edge ], [ %i515, %bb514.bb511_crit_edge ]
  br label %bb10, !llvm.loop !43

bb514:                                            ; preds = %bb504
  %i515 = add nsw i32 %i507, 1
  %i516 = icmp slt i32 %i515, %i
  br i1 %i516, label %bb514.bb511_crit_edge, label %bb517.loopexit

bb514.bb511_crit_edge:                            ; preds = %bb514
  br label %bb511

bb517.loopexit:                                   ; preds = %bb514
  br label %bb517

bb517:                                            ; preds = %bb517.loopexit, %bb5.bb517_crit_edge, %bb.bb517_crit_edge
  ret void
}

; Function Attrs: nofree nounwind memory(readwrite, inaccessiblemem: write) uwtable
define dso_local void @susan_edges(ptr noundef readonly %arg, ptr nocapture noundef %arg1, ptr nocapture noundef writeonly %arg2, ptr noundef readonly %arg3, i32 noundef %arg4, i32 noundef %arg5, i32 noundef %arg6) local_unnamed_addr #19 {
bb:
  %i = mul nsw i32 %arg6, %arg5
  %i7 = sext i32 %i to i64
  %i8 = shl nsw i64 %i7, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %arg1, i8 0, i64 %i8, i1 false)
  %i9 = add i32 %arg6, -3
  %i10 = icmp sgt i32 %arg6, 6
  br i1 %i10, label %bb11, label %bb.bb1162_crit_edge

bb.bb1162_crit_edge:                              ; preds = %bb
  br label %bb1162

bb11:                                             ; preds = %bb
  %i12 = add i32 %arg5, -3
  %i13 = icmp sgt i32 %arg5, 6
  %i14 = sext i32 %i12 to i64
  %i15 = add nsw i32 %arg5, -5
  %i16 = sext i32 %i15 to i64
  %i17 = add nsw i32 %arg5, -6
  %i18 = sext i32 %i17 to i64
  br i1 %i13, label %bb19, label %bb11.bb336_crit_edge

bb11.bb336_crit_edge:                             ; preds = %bb11
  br label %bb336

bb19:                                             ; preds = %bb11
  %i20 = zext nneg i32 %arg5 to i64
  %i21 = zext nneg i32 %i9 to i64
  %i22 = zext i32 %i12 to i64
  br label %bb23

bb23:                                             ; preds = %bb333.bb23_crit_edge, %bb19
  %i24 = phi i64 [ 3, %bb19 ], [ %i334, %bb333.bb23_crit_edge ]
  %i25 = add nsw i64 %i24, -3
  %i26 = mul nsw i64 %i25, %i20
  %i27 = getelementptr inbounds i8, ptr %arg, i64 %i26
  %i28 = trunc i64 %i24 to i32
  %i29 = mul i32 %i28, %arg5
  %i30 = zext i32 %i29 to i64
  br label %bb31

bb31:                                             ; preds = %bb330.bb31_crit_edge, %bb23
  %i32 = phi i64 [ 3, %bb23 ], [ %i331, %bb330.bb31_crit_edge ]
  %i33 = getelementptr inbounds i8, ptr %i27, i64 %i32
  %i34 = getelementptr inbounds i8, ptr %i33, i64 -1
  %i35 = add nuw nsw i64 %i32, %i30
  %i36 = getelementptr inbounds i8, ptr %arg, i64 %i35
  %i37 = load i8, ptr %i36, align 1, !tbaa !21
  %i38 = zext i8 %i37 to i64
  %i39 = getelementptr inbounds i8, ptr %arg3, i64 %i38
  %i40 = load i8, ptr %i34, align 1, !tbaa !21
  %i41 = zext i8 %i40 to i64
  %i42 = sub nsw i64 0, %i41
  %i43 = getelementptr inbounds i8, ptr %i39, i64 %i42
  %i44 = load i8, ptr %i43, align 1, !tbaa !21
  %i45 = zext i8 %i44 to i32
  %i46 = add nuw nsw i32 %i45, 100
  %i47 = getelementptr inbounds i8, ptr %i33, i64 1
  %i48 = load i8, ptr %i33, align 1, !tbaa !21
  %i49 = zext i8 %i48 to i64
  %i50 = sub nsw i64 0, %i49
  %i51 = getelementptr inbounds i8, ptr %i39, i64 %i50
  %i52 = load i8, ptr %i51, align 1, !tbaa !21
  %i53 = zext i8 %i52 to i32
  %i54 = add nuw nsw i32 %i46, %i53
  %i55 = load i8, ptr %i47, align 1, !tbaa !21
  %i56 = zext i8 %i55 to i64
  %i57 = sub nsw i64 0, %i56
  %i58 = getelementptr inbounds i8, ptr %i39, i64 %i57
  %i59 = load i8, ptr %i58, align 1, !tbaa !21
  %i60 = zext i8 %i59 to i32
  %i61 = add nuw nsw i32 %i54, %i60
  %i62 = getelementptr inbounds i8, ptr %i47, i64 %i14
  %i63 = getelementptr inbounds i8, ptr %i62, i64 1
  %i64 = load i8, ptr %i62, align 1, !tbaa !21
  %i65 = zext i8 %i64 to i64
  %i66 = sub nsw i64 0, %i65
  %i67 = getelementptr inbounds i8, ptr %i39, i64 %i66
  %i68 = load i8, ptr %i67, align 1, !tbaa !21
  %i69 = zext i8 %i68 to i32
  %i70 = add nuw nsw i32 %i61, %i69
  %i71 = getelementptr inbounds i8, ptr %i62, i64 2
  %i72 = load i8, ptr %i63, align 1, !tbaa !21
  %i73 = zext i8 %i72 to i64
  %i74 = sub nsw i64 0, %i73
  %i75 = getelementptr inbounds i8, ptr %i39, i64 %i74
  %i76 = load i8, ptr %i75, align 1, !tbaa !21
  %i77 = zext i8 %i76 to i32
  %i78 = add nuw nsw i32 %i70, %i77
  %i79 = getelementptr inbounds i8, ptr %i62, i64 3
  %i80 = load i8, ptr %i71, align 1, !tbaa !21
  %i81 = zext i8 %i80 to i64
  %i82 = sub nsw i64 0, %i81
  %i83 = getelementptr inbounds i8, ptr %i39, i64 %i82
  %i84 = load i8, ptr %i83, align 1, !tbaa !21
  %i85 = zext i8 %i84 to i32
  %i86 = add nuw nsw i32 %i78, %i85
  %i87 = getelementptr inbounds i8, ptr %i62, i64 4
  %i88 = load i8, ptr %i79, align 1, !tbaa !21
  %i89 = zext i8 %i88 to i64
  %i90 = sub nsw i64 0, %i89
  %i91 = getelementptr inbounds i8, ptr %i39, i64 %i90
  %i92 = load i8, ptr %i91, align 1, !tbaa !21
  %i93 = zext i8 %i92 to i32
  %i94 = add nuw nsw i32 %i86, %i93
  %i95 = load i8, ptr %i87, align 1, !tbaa !21
  %i96 = zext i8 %i95 to i64
  %i97 = sub nsw i64 0, %i96
  %i98 = getelementptr inbounds i8, ptr %i39, i64 %i97
  %i99 = load i8, ptr %i98, align 1, !tbaa !21
  %i100 = zext i8 %i99 to i32
  %i101 = add nuw nsw i32 %i94, %i100
  %i102 = getelementptr inbounds i8, ptr %i87, i64 %i16
  %i103 = getelementptr inbounds i8, ptr %i102, i64 1
  %i104 = load i8, ptr %i102, align 1, !tbaa !21
  %i105 = zext i8 %i104 to i64
  %i106 = sub nsw i64 0, %i105
  %i107 = getelementptr inbounds i8, ptr %i39, i64 %i106
  %i108 = load i8, ptr %i107, align 1, !tbaa !21
  %i109 = zext i8 %i108 to i32
  %i110 = add nuw nsw i32 %i101, %i109
  %i111 = getelementptr inbounds i8, ptr %i102, i64 2
  %i112 = load i8, ptr %i103, align 1, !tbaa !21
  %i113 = zext i8 %i112 to i64
  %i114 = sub nsw i64 0, %i113
  %i115 = getelementptr inbounds i8, ptr %i39, i64 %i114
  %i116 = load i8, ptr %i115, align 1, !tbaa !21
  %i117 = zext i8 %i116 to i32
  %i118 = add nuw nsw i32 %i110, %i117
  %i119 = getelementptr inbounds i8, ptr %i102, i64 3
  %i120 = load i8, ptr %i111, align 1, !tbaa !21
  %i121 = zext i8 %i120 to i64
  %i122 = sub nsw i64 0, %i121
  %i123 = getelementptr inbounds i8, ptr %i39, i64 %i122
  %i124 = load i8, ptr %i123, align 1, !tbaa !21
  %i125 = zext i8 %i124 to i32
  %i126 = add nuw nsw i32 %i118, %i125
  %i127 = getelementptr inbounds i8, ptr %i102, i64 4
  %i128 = load i8, ptr %i119, align 1, !tbaa !21
  %i129 = zext i8 %i128 to i64
  %i130 = sub nsw i64 0, %i129
  %i131 = getelementptr inbounds i8, ptr %i39, i64 %i130
  %i132 = load i8, ptr %i131, align 1, !tbaa !21
  %i133 = zext i8 %i132 to i32
  %i134 = add nuw nsw i32 %i126, %i133
  %i135 = getelementptr inbounds i8, ptr %i102, i64 5
  %i136 = load i8, ptr %i127, align 1, !tbaa !21
  %i137 = zext i8 %i136 to i64
  %i138 = sub nsw i64 0, %i137
  %i139 = getelementptr inbounds i8, ptr %i39, i64 %i138
  %i140 = load i8, ptr %i139, align 1, !tbaa !21
  %i141 = zext i8 %i140 to i32
  %i142 = add nuw nsw i32 %i134, %i141
  %i143 = getelementptr inbounds i8, ptr %i102, i64 6
  %i144 = load i8, ptr %i135, align 1, !tbaa !21
  %i145 = zext i8 %i144 to i64
  %i146 = sub nsw i64 0, %i145
  %i147 = getelementptr inbounds i8, ptr %i39, i64 %i146
  %i148 = load i8, ptr %i147, align 1, !tbaa !21
  %i149 = zext i8 %i148 to i32
  %i150 = add nuw nsw i32 %i142, %i149
  %i151 = load i8, ptr %i143, align 1, !tbaa !21
  %i152 = zext i8 %i151 to i64
  %i153 = sub nsw i64 0, %i152
  %i154 = getelementptr inbounds i8, ptr %i39, i64 %i153
  %i155 = load i8, ptr %i154, align 1, !tbaa !21
  %i156 = zext i8 %i155 to i32
  %i157 = add nuw nsw i32 %i150, %i156
  %i158 = getelementptr inbounds i8, ptr %i143, i64 %i18
  %i159 = getelementptr inbounds i8, ptr %i158, i64 1
  %i160 = load i8, ptr %i158, align 1, !tbaa !21
  %i161 = zext i8 %i160 to i64
  %i162 = sub nsw i64 0, %i161
  %i163 = getelementptr inbounds i8, ptr %i39, i64 %i162
  %i164 = load i8, ptr %i163, align 1, !tbaa !21
  %i165 = zext i8 %i164 to i32
  %i166 = add nuw nsw i32 %i157, %i165
  %i167 = getelementptr inbounds i8, ptr %i158, i64 2
  %i168 = load i8, ptr %i159, align 1, !tbaa !21
  %i169 = zext i8 %i168 to i64
  %i170 = sub nsw i64 0, %i169
  %i171 = getelementptr inbounds i8, ptr %i39, i64 %i170
  %i172 = load i8, ptr %i171, align 1, !tbaa !21
  %i173 = zext i8 %i172 to i32
  %i174 = add nuw nsw i32 %i166, %i173
  %i175 = load i8, ptr %i167, align 1, !tbaa !21
  %i176 = zext i8 %i175 to i64
  %i177 = sub nsw i64 0, %i176
  %i178 = getelementptr inbounds i8, ptr %i39, i64 %i177
  %i179 = load i8, ptr %i178, align 1, !tbaa !21
  %i180 = zext i8 %i179 to i32
  %i181 = add nuw nsw i32 %i174, %i180
  %i182 = getelementptr inbounds i8, ptr %i158, i64 4
  %i183 = getelementptr inbounds i8, ptr %i158, i64 5
  %i184 = load i8, ptr %i182, align 1, !tbaa !21
  %i185 = zext i8 %i184 to i64
  %i186 = sub nsw i64 0, %i185
  %i187 = getelementptr inbounds i8, ptr %i39, i64 %i186
  %i188 = load i8, ptr %i187, align 1, !tbaa !21
  %i189 = zext i8 %i188 to i32
  %i190 = add nuw nsw i32 %i181, %i189
  %i191 = getelementptr inbounds i8, ptr %i158, i64 6
  %i192 = load i8, ptr %i183, align 1, !tbaa !21
  %i193 = zext i8 %i192 to i64
  %i194 = sub nsw i64 0, %i193
  %i195 = getelementptr inbounds i8, ptr %i39, i64 %i194
  %i196 = load i8, ptr %i195, align 1, !tbaa !21
  %i197 = zext i8 %i196 to i32
  %i198 = add nuw nsw i32 %i190, %i197
  %i199 = load i8, ptr %i191, align 1, !tbaa !21
  %i200 = zext i8 %i199 to i64
  %i201 = sub nsw i64 0, %i200
  %i202 = getelementptr inbounds i8, ptr %i39, i64 %i201
  %i203 = load i8, ptr %i202, align 1, !tbaa !21
  %i204 = zext i8 %i203 to i32
  %i205 = add nuw nsw i32 %i198, %i204
  %i206 = getelementptr inbounds i8, ptr %i191, i64 %i18
  %i207 = getelementptr inbounds i8, ptr %i206, i64 1
  %i208 = load i8, ptr %i206, align 1, !tbaa !21
  %i209 = zext i8 %i208 to i64
  %i210 = sub nsw i64 0, %i209
  %i211 = getelementptr inbounds i8, ptr %i39, i64 %i210
  %i212 = load i8, ptr %i211, align 1, !tbaa !21
  %i213 = zext i8 %i212 to i32
  %i214 = add nuw nsw i32 %i205, %i213
  %i215 = getelementptr inbounds i8, ptr %i206, i64 2
  %i216 = load i8, ptr %i207, align 1, !tbaa !21
  %i217 = zext i8 %i216 to i64
  %i218 = sub nsw i64 0, %i217
  %i219 = getelementptr inbounds i8, ptr %i39, i64 %i218
  %i220 = load i8, ptr %i219, align 1, !tbaa !21
  %i221 = zext i8 %i220 to i32
  %i222 = add nuw nsw i32 %i214, %i221
  %i223 = getelementptr inbounds i8, ptr %i206, i64 3
  %i224 = load i8, ptr %i215, align 1, !tbaa !21
  %i225 = zext i8 %i224 to i64
  %i226 = sub nsw i64 0, %i225
  %i227 = getelementptr inbounds i8, ptr %i39, i64 %i226
  %i228 = load i8, ptr %i227, align 1, !tbaa !21
  %i229 = zext i8 %i228 to i32
  %i230 = add nuw nsw i32 %i222, %i229
  %i231 = getelementptr inbounds i8, ptr %i206, i64 4
  %i232 = load i8, ptr %i223, align 1, !tbaa !21
  %i233 = zext i8 %i232 to i64
  %i234 = sub nsw i64 0, %i233
  %i235 = getelementptr inbounds i8, ptr %i39, i64 %i234
  %i236 = load i8, ptr %i235, align 1, !tbaa !21
  %i237 = zext i8 %i236 to i32
  %i238 = add nuw nsw i32 %i230, %i237
  %i239 = getelementptr inbounds i8, ptr %i206, i64 5
  %i240 = load i8, ptr %i231, align 1, !tbaa !21
  %i241 = zext i8 %i240 to i64
  %i242 = sub nsw i64 0, %i241
  %i243 = getelementptr inbounds i8, ptr %i39, i64 %i242
  %i244 = load i8, ptr %i243, align 1, !tbaa !21
  %i245 = zext i8 %i244 to i32
  %i246 = add nuw nsw i32 %i238, %i245
  %i247 = getelementptr inbounds i8, ptr %i206, i64 6
  %i248 = load i8, ptr %i239, align 1, !tbaa !21
  %i249 = zext i8 %i248 to i64
  %i250 = sub nsw i64 0, %i249
  %i251 = getelementptr inbounds i8, ptr %i39, i64 %i250
  %i252 = load i8, ptr %i251, align 1, !tbaa !21
  %i253 = zext i8 %i252 to i32
  %i254 = add nuw nsw i32 %i246, %i253
  %i255 = load i8, ptr %i247, align 1, !tbaa !21
  %i256 = zext i8 %i255 to i64
  %i257 = sub nsw i64 0, %i256
  %i258 = getelementptr inbounds i8, ptr %i39, i64 %i257
  %i259 = load i8, ptr %i258, align 1, !tbaa !21
  %i260 = zext i8 %i259 to i32
  %i261 = add nuw nsw i32 %i254, %i260
  %i262 = getelementptr inbounds i8, ptr %i247, i64 %i16
  %i263 = getelementptr inbounds i8, ptr %i262, i64 1
  %i264 = load i8, ptr %i262, align 1, !tbaa !21
  %i265 = zext i8 %i264 to i64
  %i266 = sub nsw i64 0, %i265
  %i267 = getelementptr inbounds i8, ptr %i39, i64 %i266
  %i268 = load i8, ptr %i267, align 1, !tbaa !21
  %i269 = zext i8 %i268 to i32
  %i270 = add nuw nsw i32 %i261, %i269
  %i271 = getelementptr inbounds i8, ptr %i262, i64 2
  %i272 = load i8, ptr %i263, align 1, !tbaa !21
  %i273 = zext i8 %i272 to i64
  %i274 = sub nsw i64 0, %i273
  %i275 = getelementptr inbounds i8, ptr %i39, i64 %i274
  %i276 = load i8, ptr %i275, align 1, !tbaa !21
  %i277 = zext i8 %i276 to i32
  %i278 = add nuw nsw i32 %i270, %i277
  %i279 = getelementptr inbounds i8, ptr %i262, i64 3
  %i280 = load i8, ptr %i271, align 1, !tbaa !21
  %i281 = zext i8 %i280 to i64
  %i282 = sub nsw i64 0, %i281
  %i283 = getelementptr inbounds i8, ptr %i39, i64 %i282
  %i284 = load i8, ptr %i283, align 1, !tbaa !21
  %i285 = zext i8 %i284 to i32
  %i286 = add nuw nsw i32 %i278, %i285
  %i287 = getelementptr inbounds i8, ptr %i262, i64 4
  %i288 = load i8, ptr %i279, align 1, !tbaa !21
  %i289 = zext i8 %i288 to i64
  %i290 = sub nsw i64 0, %i289
  %i291 = getelementptr inbounds i8, ptr %i39, i64 %i290
  %i292 = load i8, ptr %i291, align 1, !tbaa !21
  %i293 = zext i8 %i292 to i32
  %i294 = add nuw nsw i32 %i286, %i293
  %i295 = load i8, ptr %i287, align 1, !tbaa !21
  %i296 = zext i8 %i295 to i64
  %i297 = sub nsw i64 0, %i296
  %i298 = getelementptr inbounds i8, ptr %i39, i64 %i297
  %i299 = load i8, ptr %i298, align 1, !tbaa !21
  %i300 = zext i8 %i299 to i32
  %i301 = add nuw nsw i32 %i294, %i300
  %i302 = getelementptr inbounds i8, ptr %i287, i64 %i14
  %i303 = getelementptr inbounds i8, ptr %i302, i64 1
  %i304 = load i8, ptr %i302, align 1, !tbaa !21
  %i305 = zext i8 %i304 to i64
  %i306 = sub nsw i64 0, %i305
  %i307 = getelementptr inbounds i8, ptr %i39, i64 %i306
  %i308 = load i8, ptr %i307, align 1, !tbaa !21
  %i309 = zext i8 %i308 to i32
  %i310 = add nuw nsw i32 %i301, %i309
  %i311 = getelementptr inbounds i8, ptr %i302, i64 2
  %i312 = load i8, ptr %i303, align 1, !tbaa !21
  %i313 = zext i8 %i312 to i64
  %i314 = sub nsw i64 0, %i313
  %i315 = getelementptr inbounds i8, ptr %i39, i64 %i314
  %i316 = load i8, ptr %i315, align 1, !tbaa !21
  %i317 = zext i8 %i316 to i32
  %i318 = add nuw nsw i32 %i310, %i317
  %i319 = load i8, ptr %i311, align 1, !tbaa !21
  %i320 = zext i8 %i319 to i64
  %i321 = sub nsw i64 0, %i320
  %i322 = getelementptr inbounds i8, ptr %i39, i64 %i321
  %i323 = load i8, ptr %i322, align 1, !tbaa !21
  %i324 = zext i8 %i323 to i32
  %i325 = add nuw nsw i32 %i318, %i324
  %i326 = icmp sgt i32 %i325, %arg4
  br i1 %i326, label %bb31.bb330_crit_edge, label %bb327

bb31.bb330_crit_edge:                             ; preds = %bb31
  br label %bb330

bb327:                                            ; preds = %bb31
  %i328 = sub nsw i32 %arg4, %i325
  %i329 = getelementptr inbounds i32, ptr %arg1, i64 %i35
  store i32 %i328, ptr %i329, align 4, !tbaa !16
  br label %bb330

bb330:                                            ; preds = %bb327, %bb31.bb330_crit_edge
  %i331 = add nuw nsw i64 %i32, 1
  %i332 = icmp eq i64 %i331, %i22
  br i1 %i332, label %bb333, label %bb330.bb31_crit_edge, !llvm.loop !44

bb330.bb31_crit_edge:                             ; preds = %bb330
  br label %bb31

bb333:                                            ; preds = %bb330
  %i334 = add nuw nsw i64 %i24, 1
  %i335 = icmp eq i64 %i334, %i21
  br i1 %i335, label %bb336.loopexit, label %bb333.bb23_crit_edge, !llvm.loop !45

bb333.bb23_crit_edge:                             ; preds = %bb333
  br label %bb23

bb336.loopexit:                                   ; preds = %bb333
  br label %bb336

bb336:                                            ; preds = %bb336.loopexit, %bb11.bb336_crit_edge
  %i337 = add nsw i32 %arg6, -4
  %i338 = icmp sgt i32 %arg6, 8
  br i1 %i338, label %bb339, label %bb336.bb1162_crit_edge

bb336.bb1162_crit_edge:                           ; preds = %bb336
  br label %bb1162

bb339:                                            ; preds = %bb336
  %i340 = icmp sgt i32 %arg5, 8
  %i341 = add nsw i32 %arg5, -3
  %i342 = sext i32 %i341 to i64
  %i343 = add nsw i32 %arg5, -5
  %i344 = sext i32 %i343 to i64
  %i345 = add nsw i32 %arg5, -6
  %i346 = sext i32 %i345 to i64
  br i1 %i340, label %bb347, label %bb339.bb1162_crit_edge

bb339.bb1162_crit_edge:                           ; preds = %bb339
  br label %bb1162

bb347:                                            ; preds = %bb339
  %i348 = add nsw i32 %arg5, -4
  %i349 = zext nneg i32 %arg5 to i64
  %i350 = zext nneg i32 %i337 to i64
  %i351 = zext i32 %i348 to i64
  br label %bb352

bb352:                                            ; preds = %bb1159.bb352_crit_edge, %bb347
  %i353 = phi i64 [ 4, %bb347 ], [ %i1160, %bb1159.bb352_crit_edge ]
  %i354 = add nsw i64 %i353, -3
  %i355 = mul nsw i64 %i354, %i349
  %i356 = getelementptr inbounds i8, ptr %arg, i64 %i355
  %i357 = trunc i64 %i353 to i32
  %i358 = mul i32 %i357, %arg5
  %i359 = zext i32 %i358 to i64
  %i360 = trunc i64 %i353 to i32
  %i361 = trunc i64 %i353 to i32
  br label %bb362

bb362:                                            ; preds = %bb1156.bb362_crit_edge, %bb352
  %i363 = phi i64 [ 4, %bb352 ], [ %i1157, %bb1156.bb362_crit_edge ]
  %i364 = add nuw nsw i64 %i363, %i359
  %i365 = getelementptr inbounds i32, ptr %arg1, i64 %i364
  %i366 = load i32, ptr %i365, align 4, !tbaa !16
  %i367 = icmp sgt i32 %i366, 0
  br i1 %i367, label %bb368, label %bb362.bb1156_crit_edge

bb362.bb1156_crit_edge:                           ; preds = %bb362
  br label %bb1156

bb368:                                            ; preds = %bb362
  %i369 = sub nsw i32 %arg4, %i366
  %i370 = getelementptr inbounds i8, ptr %arg, i64 %i364
  %i371 = load i8, ptr %i370, align 1, !tbaa !21
  %i372 = zext i8 %i371 to i64
  %i373 = getelementptr inbounds i8, ptr %arg3, i64 %i372
  %i374 = icmp sgt i32 %i369, 600
  br i1 %i374, label %bb375, label %bb368.bb702_crit_edge

bb368.bb702_crit_edge:                            ; preds = %bb368
  br label %bb702

bb375:                                            ; preds = %bb368
  %i376 = getelementptr inbounds i8, ptr %i356, i64 %i363
  %i377 = getelementptr inbounds i8, ptr %i376, i64 -1
  %i378 = load i8, ptr %i377, align 1, !tbaa !21
  %i379 = zext i8 %i378 to i64
  %i380 = sub nsw i64 0, %i379
  %i381 = getelementptr inbounds i8, ptr %i373, i64 %i380
  %i382 = load i8, ptr %i381, align 1, !tbaa !21
  %i383 = zext i8 %i382 to i32
  %i384 = getelementptr inbounds i8, ptr %i376, i64 1
  %i385 = load i8, ptr %i376, align 1, !tbaa !21
  %i386 = zext i8 %i385 to i64
  %i387 = sub nsw i64 0, %i386
  %i388 = getelementptr inbounds i8, ptr %i373, i64 %i387
  %i389 = load i8, ptr %i388, align 1, !tbaa !21
  %i390 = zext i8 %i389 to i32
  %i391 = add nuw nsw i32 %i390, %i383
  %i392 = load i8, ptr %i384, align 1, !tbaa !21
  %i393 = zext i8 %i392 to i64
  %i394 = sub nsw i64 0, %i393
  %i395 = getelementptr inbounds i8, ptr %i373, i64 %i394
  %i396 = load i8, ptr %i395, align 1, !tbaa !21
  %i397 = zext i8 %i396 to i32
  %i398 = add nuw nsw i32 %i391, %i397
  %i399 = getelementptr inbounds i8, ptr %i384, i64 %i342
  %i400 = getelementptr inbounds i8, ptr %i399, i64 1
  %i401 = load i8, ptr %i399, align 1, !tbaa !21
  %i402 = zext i8 %i401 to i64
  %i403 = sub nsw i64 0, %i402
  %i404 = getelementptr inbounds i8, ptr %i373, i64 %i403
  %i405 = load i8, ptr %i404, align 1, !tbaa !21
  %i406 = zext i8 %i405 to i32
  %i407 = getelementptr inbounds i8, ptr %i399, i64 2
  %i408 = load i8, ptr %i400, align 1, !tbaa !21
  %i409 = zext i8 %i408 to i64
  %i410 = sub nsw i64 0, %i409
  %i411 = getelementptr inbounds i8, ptr %i373, i64 %i410
  %i412 = load i8, ptr %i411, align 1, !tbaa !21
  %i413 = zext i8 %i412 to i32
  %i414 = add nuw nsw i32 %i413, %i406
  %i415 = getelementptr inbounds i8, ptr %i399, i64 3
  %i416 = load i8, ptr %i407, align 1, !tbaa !21
  %i417 = zext i8 %i416 to i64
  %i418 = sub nsw i64 0, %i417
  %i419 = getelementptr inbounds i8, ptr %i373, i64 %i418
  %i420 = load i8, ptr %i419, align 1, !tbaa !21
  %i421 = zext i8 %i420 to i32
  %i422 = add nuw nsw i32 %i414, %i421
  %i423 = getelementptr inbounds i8, ptr %i399, i64 4
  %i424 = load i8, ptr %i415, align 1, !tbaa !21
  %i425 = zext i8 %i424 to i64
  %i426 = sub nsw i64 0, %i425
  %i427 = getelementptr inbounds i8, ptr %i373, i64 %i426
  %i428 = load i8, ptr %i427, align 1, !tbaa !21
  %i429 = zext i8 %i428 to i32
  %i430 = add nuw nsw i32 %i422, %i429
  %i431 = load i8, ptr %i423, align 1, !tbaa !21
  %i432 = zext i8 %i431 to i64
  %i433 = sub nsw i64 0, %i432
  %i434 = getelementptr inbounds i8, ptr %i373, i64 %i433
  %i435 = load i8, ptr %i434, align 1, !tbaa !21
  %i436 = zext i8 %i435 to i32
  %i437 = add nuw nsw i32 %i430, %i436
  %i438 = getelementptr inbounds i8, ptr %i423, i64 %i344
  %i439 = getelementptr inbounds i8, ptr %i438, i64 1
  %i440 = load i8, ptr %i438, align 1, !tbaa !21
  %i441 = zext i8 %i440 to i64
  %i442 = sub nsw i64 0, %i441
  %i443 = getelementptr inbounds i8, ptr %i373, i64 %i442
  %i444 = load i8, ptr %i443, align 1, !tbaa !21
  %i445 = zext i8 %i444 to i32
  %i446 = getelementptr inbounds i8, ptr %i438, i64 2
  %i447 = load i8, ptr %i439, align 1, !tbaa !21
  %i448 = zext i8 %i447 to i64
  %i449 = sub nsw i64 0, %i448
  %i450 = getelementptr inbounds i8, ptr %i373, i64 %i449
  %i451 = load i8, ptr %i450, align 1, !tbaa !21
  %i452 = zext i8 %i451 to i32
  %i453 = getelementptr inbounds i8, ptr %i438, i64 3
  %i454 = load i8, ptr %i446, align 1, !tbaa !21
  %i455 = zext i8 %i454 to i64
  %i456 = sub nsw i64 0, %i455
  %i457 = getelementptr inbounds i8, ptr %i373, i64 %i456
  %i458 = load i8, ptr %i457, align 1, !tbaa !21
  %i459 = zext i8 %i458 to i32
  %i460 = getelementptr inbounds i8, ptr %i438, i64 4
  %i461 = load i8, ptr %i453, align 1, !tbaa !21
  %i462 = zext i8 %i461 to i64
  %i463 = sub nsw i64 0, %i462
  %i464 = getelementptr inbounds i8, ptr %i373, i64 %i463
  %i465 = load i8, ptr %i464, align 1, !tbaa !21
  %i466 = zext i8 %i465 to i32
  %i467 = getelementptr inbounds i8, ptr %i438, i64 5
  %i468 = load i8, ptr %i460, align 1, !tbaa !21
  %i469 = zext i8 %i468 to i64
  %i470 = sub nsw i64 0, %i469
  %i471 = getelementptr inbounds i8, ptr %i373, i64 %i470
  %i472 = load i8, ptr %i471, align 1, !tbaa !21
  %i473 = zext i8 %i472 to i32
  %i474 = getelementptr inbounds i8, ptr %i438, i64 6
  %i475 = load i8, ptr %i467, align 1, !tbaa !21
  %i476 = zext i8 %i475 to i64
  %i477 = sub nsw i64 0, %i476
  %i478 = getelementptr inbounds i8, ptr %i373, i64 %i477
  %i479 = load i8, ptr %i478, align 1, !tbaa !21
  %i480 = zext i8 %i479 to i32
  %i481 = load i8, ptr %i474, align 1, !tbaa !21
  %i482 = zext i8 %i481 to i64
  %i483 = sub nsw i64 0, %i482
  %i484 = getelementptr inbounds i8, ptr %i373, i64 %i483
  %i485 = load i8, ptr %i484, align 1, !tbaa !21
  %i486 = zext i8 %i485 to i32
  %i487 = getelementptr inbounds i8, ptr %i474, i64 %i346
  %i488 = getelementptr inbounds i8, ptr %i487, i64 1
  %i489 = load i8, ptr %i487, align 1, !tbaa !21
  %i490 = zext i8 %i489 to i64
  %i491 = sub nsw i64 0, %i490
  %i492 = getelementptr inbounds i8, ptr %i373, i64 %i491
  %i493 = load i8, ptr %i492, align 1, !tbaa !21
  %i494 = zext i8 %i493 to i32
  %i495 = getelementptr inbounds i8, ptr %i487, i64 2
  %i496 = load i8, ptr %i488, align 1, !tbaa !21
  %i497 = zext i8 %i496 to i64
  %i498 = sub nsw i64 0, %i497
  %i499 = getelementptr inbounds i8, ptr %i373, i64 %i498
  %i500 = load i8, ptr %i499, align 1, !tbaa !21
  %i501 = zext i8 %i500 to i32
  %i502 = load i8, ptr %i495, align 1, !tbaa !21
  %i503 = zext i8 %i502 to i64
  %i504 = sub nsw i64 0, %i503
  %i505 = getelementptr inbounds i8, ptr %i373, i64 %i504
  %i506 = load i8, ptr %i505, align 1, !tbaa !21
  %i507 = zext i8 %i506 to i32
  %i508 = getelementptr inbounds i8, ptr %i487, i64 4
  %i509 = getelementptr inbounds i8, ptr %i487, i64 5
  %i510 = load i8, ptr %i508, align 1, !tbaa !21
  %i511 = zext i8 %i510 to i64
  %i512 = sub nsw i64 0, %i511
  %i513 = getelementptr inbounds i8, ptr %i373, i64 %i512
  %i514 = load i8, ptr %i513, align 1, !tbaa !21
  %i515 = zext i8 %i514 to i32
  %i516 = getelementptr inbounds i8, ptr %i487, i64 6
  %i517 = load i8, ptr %i509, align 1, !tbaa !21
  %i518 = zext i8 %i517 to i64
  %i519 = sub nsw i64 0, %i518
  %i520 = getelementptr inbounds i8, ptr %i373, i64 %i519
  %i521 = load i8, ptr %i520, align 1, !tbaa !21
  %i522 = zext i8 %i521 to i32
  %i523 = load i8, ptr %i516, align 1, !tbaa !21
  %i524 = zext i8 %i523 to i64
  %i525 = sub nsw i64 0, %i524
  %i526 = getelementptr inbounds i8, ptr %i373, i64 %i525
  %i527 = load i8, ptr %i526, align 1, !tbaa !21
  %i528 = zext i8 %i527 to i32
  %i529 = getelementptr inbounds i8, ptr %i516, i64 %i346
  %i530 = getelementptr inbounds i8, ptr %i529, i64 1
  %i531 = load i8, ptr %i529, align 1, !tbaa !21
  %i532 = zext i8 %i531 to i64
  %i533 = sub nsw i64 0, %i532
  %i534 = getelementptr inbounds i8, ptr %i373, i64 %i533
  %i535 = load i8, ptr %i534, align 1, !tbaa !21
  %i536 = zext i8 %i535 to i32
  %i537 = getelementptr inbounds i8, ptr %i529, i64 2
  %i538 = load i8, ptr %i530, align 1, !tbaa !21
  %i539 = zext i8 %i538 to i64
  %i540 = sub nsw i64 0, %i539
  %i541 = getelementptr inbounds i8, ptr %i373, i64 %i540
  %i542 = load i8, ptr %i541, align 1, !tbaa !21
  %i543 = zext i8 %i542 to i32
  %i544 = getelementptr inbounds i8, ptr %i529, i64 3
  %i545 = load i8, ptr %i537, align 1, !tbaa !21
  %i546 = zext i8 %i545 to i64
  %i547 = sub nsw i64 0, %i546
  %i548 = getelementptr inbounds i8, ptr %i373, i64 %i547
  %i549 = load i8, ptr %i548, align 1, !tbaa !21
  %i550 = zext i8 %i549 to i32
  %i551 = getelementptr inbounds i8, ptr %i529, i64 4
  %i552 = load i8, ptr %i544, align 1, !tbaa !21
  %i553 = zext i8 %i552 to i64
  %i554 = sub nsw i64 0, %i553
  %i555 = getelementptr inbounds i8, ptr %i373, i64 %i554
  %i556 = load i8, ptr %i555, align 1, !tbaa !21
  %i557 = zext i8 %i556 to i32
  %i558 = getelementptr inbounds i8, ptr %i529, i64 5
  %i559 = load i8, ptr %i551, align 1, !tbaa !21
  %i560 = zext i8 %i559 to i64
  %i561 = sub nsw i64 0, %i560
  %i562 = getelementptr inbounds i8, ptr %i373, i64 %i561
  %i563 = load i8, ptr %i562, align 1, !tbaa !21
  %i564 = zext i8 %i563 to i32
  %i565 = getelementptr inbounds i8, ptr %i529, i64 6
  %i566 = load i8, ptr %i558, align 1, !tbaa !21
  %i567 = zext i8 %i566 to i64
  %i568 = sub nsw i64 0, %i567
  %i569 = getelementptr inbounds i8, ptr %i373, i64 %i568
  %i570 = load i8, ptr %i569, align 1, !tbaa !21
  %i571 = zext i8 %i570 to i32
  %i572 = load i8, ptr %i565, align 1, !tbaa !21
  %i573 = zext i8 %i572 to i64
  %i574 = sub nsw i64 0, %i573
  %i575 = getelementptr inbounds i8, ptr %i373, i64 %i574
  %i576 = load i8, ptr %i575, align 1, !tbaa !21
  %i577 = zext i8 %i576 to i32
  %i578 = getelementptr inbounds i8, ptr %i565, i64 %i344
  %i579 = getelementptr inbounds i8, ptr %i578, i64 1
  %i580 = load i8, ptr %i578, align 1, !tbaa !21
  %i581 = zext i8 %i580 to i64
  %i582 = sub nsw i64 0, %i581
  %i583 = getelementptr inbounds i8, ptr %i373, i64 %i582
  %i584 = load i8, ptr %i583, align 1, !tbaa !21
  %i585 = zext i8 %i584 to i32
  %i586 = shl nuw nsw i32 %i585, 1
  %i587 = getelementptr inbounds i8, ptr %i578, i64 2
  %i588 = load i8, ptr %i579, align 1, !tbaa !21
  %i589 = zext i8 %i588 to i64
  %i590 = sub nsw i64 0, %i589
  %i591 = getelementptr inbounds i8, ptr %i373, i64 %i590
  %i592 = load i8, ptr %i591, align 1, !tbaa !21
  %i593 = zext i8 %i592 to i32
  %i594 = getelementptr inbounds i8, ptr %i578, i64 3
  %i595 = load i8, ptr %i587, align 1, !tbaa !21
  %i596 = zext i8 %i595 to i64
  %i597 = sub nsw i64 0, %i596
  %i598 = getelementptr inbounds i8, ptr %i373, i64 %i597
  %i599 = load i8, ptr %i598, align 1, !tbaa !21
  %i600 = zext i8 %i599 to i32
  %i601 = getelementptr inbounds i8, ptr %i578, i64 4
  %i602 = load i8, ptr %i594, align 1, !tbaa !21
  %i603 = zext i8 %i602 to i64
  %i604 = sub nsw i64 0, %i603
  %i605 = getelementptr inbounds i8, ptr %i373, i64 %i604
  %i606 = load i8, ptr %i605, align 1, !tbaa !21
  %i607 = zext i8 %i606 to i32
  %i608 = load i8, ptr %i601, align 1, !tbaa !21
  %i609 = zext i8 %i608 to i64
  %i610 = sub nsw i64 0, %i609
  %i611 = getelementptr inbounds i8, ptr %i373, i64 %i610
  %i612 = load i8, ptr %i611, align 1, !tbaa !21
  %i613 = zext i8 %i612 to i32
  %i614 = shl nuw nsw i32 %i613, 1
  %i615 = getelementptr inbounds i8, ptr %i601, i64 %i342
  %i616 = getelementptr inbounds i8, ptr %i615, i64 1
  %i617 = load i8, ptr %i615, align 1, !tbaa !21
  %i618 = zext i8 %i617 to i64
  %i619 = sub nsw i64 0, %i618
  %i620 = getelementptr inbounds i8, ptr %i373, i64 %i619
  %i621 = load i8, ptr %i620, align 1, !tbaa !21
  %i622 = zext i8 %i621 to i32
  %i623 = getelementptr inbounds i8, ptr %i615, i64 2
  %i624 = load i8, ptr %i616, align 1, !tbaa !21
  %i625 = zext i8 %i624 to i64
  %i626 = sub nsw i64 0, %i625
  %i627 = getelementptr inbounds i8, ptr %i373, i64 %i626
  %i628 = load i8, ptr %i627, align 1, !tbaa !21
  %i629 = zext i8 %i628 to i32
  %i630 = load i8, ptr %i623, align 1, !tbaa !21
  %i631 = zext i8 %i630 to i64
  %i632 = sub nsw i64 0, %i631
  %i633 = getelementptr inbounds i8, ptr %i373, i64 %i632
  %i634 = load i8, ptr %i633, align 1, !tbaa !21
  %i635 = zext i8 %i634 to i32
  %i636 = add nuw nsw i32 %i445, %i494
  %i637 = add nuw nsw i32 %i486, %i528
  %i638 = add nuw nsw i32 %i636, %i536
  %i639 = sub nsw i32 %i637, %i638
  %i640 = add nsw i32 %i639, %i577
  %i641 = mul nsw i32 %i640, 3
  %i642 = add nuw nsw i32 %i406, %i452
  %i643 = add nuw nsw i32 %i436, %i480
  %i644 = add nuw nsw i32 %i642, %i501
  %i645 = add nuw nsw i32 %i643, %i522
  %i646 = add nuw nsw i32 %i644, %i543
  %i647 = sub nsw i32 %i645, %i646
  %i648 = add nsw i32 %i647, %i571
  %i649 = shl nsw i32 %i648, 1
  %i650 = add nuw nsw i32 %i383, %i413
  %i651 = add nuw nsw i32 %i397, %i429
  %i652 = add nuw nsw i32 %i650, %i459
  %i653 = add nuw nsw i32 %i651, %i473
  %i654 = add nuw nsw i32 %i652, %i507
  %i655 = add nuw nsw i32 %i653, %i515
  %i656 = add nuw nsw i32 %i654, %i550
  %i657 = add nuw nsw i32 %i655, %i564
  %i658 = add nuw nsw i32 %i656, %i586
  %i659 = add nuw nsw i32 %i658, %i593
  %i660 = sub nsw i32 %i657, %i659
  %i661 = add nsw i32 %i660, %i641
  %i662 = add i32 %i661, %i649
  %i663 = add i32 %i662, %i607
  %i664 = add i32 %i663, %i614
  %i665 = sub i32 %i664, %i622
  %i666 = add i32 %i665, %i635
  %i667 = sub nsw i32 %i622, %i398
  %i668 = add nsw i32 %i667, %i629
  %i669 = add nsw i32 %i668, %i635
  %i670 = mul nsw i32 %i669, 3
  %i671 = sub nsw i32 %i593, %i437
  %i672 = add nsw i32 %i671, %i600
  %i673 = add nsw i32 %i672, %i607
  %i674 = shl nsw i32 %i673, 1
  %i675 = add nuw nsw i32 %i452, %i445
  %i676 = add nuw nsw i32 %i675, %i459
  %i677 = add nuw nsw i32 %i676, %i466
  %i678 = add nuw nsw i32 %i677, %i473
  %i679 = add nuw nsw i32 %i678, %i480
  %i680 = add nuw nsw i32 %i679, %i486
  %i681 = sub nsw i32 %i536, %i680
  %i682 = add nsw i32 %i681, %i543
  %i683 = add nsw i32 %i682, %i550
  %i684 = add nsw i32 %i683, %i557
  %i685 = add nsw i32 %i684, %i564
  %i686 = add nsw i32 %i685, %i571
  %i687 = add nsw i32 %i686, %i577
  %i688 = add nsw i32 %i687, %i586
  %i689 = add nsw i32 %i688, %i614
  %i690 = add i32 %i689, %i674
  %i691 = add i32 %i690, %i670
  %i692 = mul nsw i32 %i666, %i666
  %i693 = mul nsw i32 %i691, %i691
  %i694 = add nuw nsw i32 %i693, %i692
  %i695 = sitofp i32 %i694 to float
  %i696 = tail call float @sqrtf(float noundef %i695) #11
  %i697 = fpext float %i696 to double
  %i698 = sitofp i32 %i369 to float
  %i699 = fpext float %i698 to double
  %i700 = fmul double %i699, 9.000000e-01
  %i701 = fcmp olt double %i700, %i697
  br i1 %i701, label %bb1098, label %bb375.bb702_crit_edge

bb375.bb702_crit_edge:                            ; preds = %bb375
  br label %bb702

bb702:                                            ; preds = %bb375.bb702_crit_edge, %bb368.bb702_crit_edge
  %i703 = getelementptr inbounds i8, ptr %i356, i64 %i363
  %i704 = getelementptr inbounds i8, ptr %i703, i64 -1
  %i705 = load i8, ptr %i704, align 1, !tbaa !21
  %i706 = zext i8 %i705 to i64
  %i707 = sub nsw i64 0, %i706
  %i708 = getelementptr inbounds i8, ptr %i373, i64 %i707
  %i709 = load i8, ptr %i708, align 1, !tbaa !21
  %i710 = zext i8 %i709 to i32
  %i711 = getelementptr inbounds i8, ptr %i703, i64 1
  %i712 = load i8, ptr %i703, align 1, !tbaa !21
  %i713 = zext i8 %i712 to i64
  %i714 = sub nsw i64 0, %i713
  %i715 = getelementptr inbounds i8, ptr %i373, i64 %i714
  %i716 = load i8, ptr %i715, align 1, !tbaa !21
  %i717 = zext i8 %i716 to i32
  %i718 = load i8, ptr %i711, align 1, !tbaa !21
  %i719 = zext i8 %i718 to i64
  %i720 = sub nsw i64 0, %i719
  %i721 = getelementptr inbounds i8, ptr %i373, i64 %i720
  %i722 = load i8, ptr %i721, align 1, !tbaa !21
  %i723 = zext i8 %i722 to i32
  %i724 = getelementptr inbounds i8, ptr %i711, i64 %i342
  %i725 = getelementptr inbounds i8, ptr %i724, i64 1
  %i726 = load i8, ptr %i724, align 1, !tbaa !21
  %i727 = zext i8 %i726 to i64
  %i728 = sub nsw i64 0, %i727
  %i729 = getelementptr inbounds i8, ptr %i373, i64 %i728
  %i730 = load i8, ptr %i729, align 1, !tbaa !21
  %i731 = zext i8 %i730 to i32
  %i732 = shl nuw nsw i32 %i731, 2
  %i733 = getelementptr inbounds i8, ptr %i724, i64 2
  %i734 = load i8, ptr %i725, align 1, !tbaa !21
  %i735 = zext i8 %i734 to i64
  %i736 = sub nsw i64 0, %i735
  %i737 = getelementptr inbounds i8, ptr %i373, i64 %i736
  %i738 = load i8, ptr %i737, align 1, !tbaa !21
  %i739 = zext i8 %i738 to i32
  %i740 = getelementptr inbounds i8, ptr %i724, i64 3
  %i741 = load i8, ptr %i733, align 1, !tbaa !21
  %i742 = zext i8 %i741 to i64
  %i743 = sub nsw i64 0, %i742
  %i744 = getelementptr inbounds i8, ptr %i373, i64 %i743
  %i745 = load i8, ptr %i744, align 1, !tbaa !21
  %i746 = zext i8 %i745 to i32
  %i747 = getelementptr inbounds i8, ptr %i724, i64 4
  %i748 = load i8, ptr %i740, align 1, !tbaa !21
  %i749 = zext i8 %i748 to i64
  %i750 = sub nsw i64 0, %i749
  %i751 = getelementptr inbounds i8, ptr %i373, i64 %i750
  %i752 = load i8, ptr %i751, align 1, !tbaa !21
  %i753 = zext i8 %i752 to i32
  %i754 = load i8, ptr %i747, align 1, !tbaa !21
  %i755 = zext i8 %i754 to i64
  %i756 = sub nsw i64 0, %i755
  %i757 = getelementptr inbounds i8, ptr %i373, i64 %i756
  %i758 = load i8, ptr %i757, align 1, !tbaa !21
  %i759 = zext i8 %i758 to i32
  %i760 = shl nuw nsw i32 %i759, 2
  %i761 = getelementptr inbounds i8, ptr %i747, i64 %i344
  %i762 = getelementptr inbounds i8, ptr %i761, i64 1
  %i763 = load i8, ptr %i761, align 1, !tbaa !21
  %i764 = zext i8 %i763 to i64
  %i765 = sub nsw i64 0, %i764
  %i766 = getelementptr inbounds i8, ptr %i373, i64 %i765
  %i767 = load i8, ptr %i766, align 1, !tbaa !21
  %i768 = zext i8 %i767 to i32
  %i769 = getelementptr inbounds i8, ptr %i761, i64 2
  %i770 = load i8, ptr %i762, align 1, !tbaa !21
  %i771 = zext i8 %i770 to i64
  %i772 = sub nsw i64 0, %i771
  %i773 = getelementptr inbounds i8, ptr %i373, i64 %i772
  %i774 = load i8, ptr %i773, align 1, !tbaa !21
  %i775 = zext i8 %i774 to i32
  %i776 = getelementptr inbounds i8, ptr %i761, i64 3
  %i777 = load i8, ptr %i769, align 1, !tbaa !21
  %i778 = zext i8 %i777 to i64
  %i779 = sub nsw i64 0, %i778
  %i780 = getelementptr inbounds i8, ptr %i373, i64 %i779
  %i781 = load i8, ptr %i780, align 1, !tbaa !21
  %i782 = zext i8 %i781 to i32
  %i783 = getelementptr inbounds i8, ptr %i761, i64 4
  %i784 = load i8, ptr %i776, align 1, !tbaa !21
  %i785 = zext i8 %i784 to i64
  %i786 = sub nsw i64 0, %i785
  %i787 = getelementptr inbounds i8, ptr %i373, i64 %i786
  %i788 = load i8, ptr %i787, align 1, !tbaa !21
  %i789 = zext i8 %i788 to i32
  %i790 = getelementptr inbounds i8, ptr %i761, i64 5
  %i791 = load i8, ptr %i783, align 1, !tbaa !21
  %i792 = zext i8 %i791 to i64
  %i793 = sub nsw i64 0, %i792
  %i794 = getelementptr inbounds i8, ptr %i373, i64 %i793
  %i795 = load i8, ptr %i794, align 1, !tbaa !21
  %i796 = zext i8 %i795 to i32
  %i797 = getelementptr inbounds i8, ptr %i761, i64 6
  %i798 = load i8, ptr %i790, align 1, !tbaa !21
  %i799 = zext i8 %i798 to i64
  %i800 = sub nsw i64 0, %i799
  %i801 = getelementptr inbounds i8, ptr %i373, i64 %i800
  %i802 = load i8, ptr %i801, align 1, !tbaa !21
  %i803 = zext i8 %i802 to i32
  %i804 = load i8, ptr %i797, align 1, !tbaa !21
  %i805 = zext i8 %i804 to i64
  %i806 = sub nsw i64 0, %i805
  %i807 = getelementptr inbounds i8, ptr %i373, i64 %i806
  %i808 = load i8, ptr %i807, align 1, !tbaa !21
  %i809 = zext i8 %i808 to i32
  %i810 = getelementptr inbounds i8, ptr %i797, i64 %i346
  %i811 = getelementptr inbounds i8, ptr %i810, i64 6
  %i812 = getelementptr inbounds i8, ptr %i811, i64 %i346
  %i813 = getelementptr inbounds i8, ptr %i812, i64 1
  %i814 = load i8, ptr %i812, align 1, !tbaa !21
  %i815 = zext i8 %i814 to i64
  %i816 = sub nsw i64 0, %i815
  %i817 = getelementptr inbounds i8, ptr %i373, i64 %i816
  %i818 = load i8, ptr %i817, align 1, !tbaa !21
  %i819 = zext i8 %i818 to i32
  %i820 = getelementptr inbounds i8, ptr %i812, i64 2
  %i821 = load i8, ptr %i813, align 1, !tbaa !21
  %i822 = zext i8 %i821 to i64
  %i823 = sub nsw i64 0, %i822
  %i824 = getelementptr inbounds i8, ptr %i373, i64 %i823
  %i825 = load i8, ptr %i824, align 1, !tbaa !21
  %i826 = zext i8 %i825 to i32
  %i827 = getelementptr inbounds i8, ptr %i812, i64 3
  %i828 = load i8, ptr %i820, align 1, !tbaa !21
  %i829 = zext i8 %i828 to i64
  %i830 = sub nsw i64 0, %i829
  %i831 = getelementptr inbounds i8, ptr %i373, i64 %i830
  %i832 = load i8, ptr %i831, align 1, !tbaa !21
  %i833 = zext i8 %i832 to i32
  %i834 = getelementptr inbounds i8, ptr %i812, i64 4
  %i835 = load i8, ptr %i827, align 1, !tbaa !21
  %i836 = zext i8 %i835 to i64
  %i837 = sub nsw i64 0, %i836
  %i838 = getelementptr inbounds i8, ptr %i373, i64 %i837
  %i839 = load i8, ptr %i838, align 1, !tbaa !21
  %i840 = zext i8 %i839 to i32
  %i841 = getelementptr inbounds i8, ptr %i812, i64 5
  %i842 = load i8, ptr %i834, align 1, !tbaa !21
  %i843 = zext i8 %i842 to i64
  %i844 = sub nsw i64 0, %i843
  %i845 = getelementptr inbounds i8, ptr %i373, i64 %i844
  %i846 = load i8, ptr %i845, align 1, !tbaa !21
  %i847 = zext i8 %i846 to i32
  %i848 = getelementptr inbounds i8, ptr %i812, i64 6
  %i849 = load i8, ptr %i841, align 1, !tbaa !21
  %i850 = zext i8 %i849 to i64
  %i851 = sub nsw i64 0, %i850
  %i852 = getelementptr inbounds i8, ptr %i373, i64 %i851
  %i853 = load i8, ptr %i852, align 1, !tbaa !21
  %i854 = zext i8 %i853 to i32
  %i855 = load i8, ptr %i848, align 1, !tbaa !21
  %i856 = zext i8 %i855 to i64
  %i857 = sub nsw i64 0, %i856
  %i858 = getelementptr inbounds i8, ptr %i373, i64 %i857
  %i859 = load i8, ptr %i858, align 1, !tbaa !21
  %i860 = zext i8 %i859 to i32
  %i861 = getelementptr inbounds i8, ptr %i848, i64 %i344
  %i862 = getelementptr inbounds i8, ptr %i861, i64 1
  %i863 = load i8, ptr %i861, align 1, !tbaa !21
  %i864 = zext i8 %i863 to i64
  %i865 = sub nsw i64 0, %i864
  %i866 = getelementptr inbounds i8, ptr %i373, i64 %i865
  %i867 = load i8, ptr %i866, align 1, !tbaa !21
  %i868 = zext i8 %i867 to i32
  %i869 = shl nuw nsw i32 %i868, 2
  %i870 = getelementptr inbounds i8, ptr %i861, i64 2
  %i871 = load i8, ptr %i862, align 1, !tbaa !21
  %i872 = zext i8 %i871 to i64
  %i873 = sub nsw i64 0, %i872
  %i874 = getelementptr inbounds i8, ptr %i373, i64 %i873
  %i875 = load i8, ptr %i874, align 1, !tbaa !21
  %i876 = zext i8 %i875 to i32
  %i877 = getelementptr inbounds i8, ptr %i861, i64 3
  %i878 = load i8, ptr %i870, align 1, !tbaa !21
  %i879 = zext i8 %i878 to i64
  %i880 = sub nsw i64 0, %i879
  %i881 = getelementptr inbounds i8, ptr %i373, i64 %i880
  %i882 = load i8, ptr %i881, align 1, !tbaa !21
  %i883 = zext i8 %i882 to i32
  %i884 = getelementptr inbounds i8, ptr %i861, i64 4
  %i885 = load i8, ptr %i877, align 1, !tbaa !21
  %i886 = zext i8 %i885 to i64
  %i887 = sub nsw i64 0, %i886
  %i888 = getelementptr inbounds i8, ptr %i373, i64 %i887
  %i889 = load i8, ptr %i888, align 1, !tbaa !21
  %i890 = zext i8 %i889 to i32
  %i891 = load i8, ptr %i884, align 1, !tbaa !21
  %i892 = zext i8 %i891 to i64
  %i893 = sub nsw i64 0, %i892
  %i894 = getelementptr inbounds i8, ptr %i373, i64 %i893
  %i895 = load i8, ptr %i894, align 1, !tbaa !21
  %i896 = zext i8 %i895 to i32
  %i897 = shl nuw nsw i32 %i896, 2
  %i898 = getelementptr inbounds i8, ptr %i884, i64 %i342
  %i899 = getelementptr inbounds i8, ptr %i898, i64 1
  %i900 = load i8, ptr %i898, align 1, !tbaa !21
  %i901 = zext i8 %i900 to i64
  %i902 = sub nsw i64 0, %i901
  %i903 = getelementptr inbounds i8, ptr %i373, i64 %i902
  %i904 = load i8, ptr %i903, align 1, !tbaa !21
  %i905 = zext i8 %i904 to i32
  %i906 = getelementptr inbounds i8, ptr %i898, i64 2
  %i907 = load i8, ptr %i899, align 1, !tbaa !21
  %i908 = zext i8 %i907 to i64
  %i909 = sub nsw i64 0, %i908
  %i910 = getelementptr inbounds i8, ptr %i373, i64 %i909
  %i911 = load i8, ptr %i910, align 1, !tbaa !21
  %i912 = zext i8 %i911 to i32
  %i913 = load i8, ptr %i906, align 1, !tbaa !21
  %i914 = zext i8 %i913 to i64
  %i915 = sub nsw i64 0, %i914
  %i916 = getelementptr inbounds i8, ptr %i373, i64 %i915
  %i917 = load i8, ptr %i916, align 1, !tbaa !21
  %i918 = zext i8 %i917 to i32
  %i919 = add nuw nsw i32 %i746, %i739
  %i920 = add nuw nsw i32 %i919, %i753
  %i921 = add nuw nsw i32 %i920, %i876
  %i922 = add nuw nsw i32 %i921, %i883
  %i923 = add nuw nsw i32 %i922, %i890
  %i924 = shl nuw nsw i32 %i923, 2
  %i925 = add nuw nsw i32 %i717, %i710
  %i926 = add nuw nsw i32 %i925, %i723
  %i927 = add nuw nsw i32 %i926, %i905
  %i928 = add nuw nsw i32 %i927, %i912
  %i929 = add nuw nsw i32 %i928, %i918
  %i930 = mul nuw nsw i32 %i929, 9
  %i931 = add nuw nsw i32 %i760, %i732
  %i932 = add nuw nsw i32 %i931, %i768
  %i933 = add nuw nsw i32 %i932, %i775
  %i934 = add nuw nsw i32 %i933, %i782
  %i935 = add nuw nsw i32 %i934, %i789
  %i936 = add nuw nsw i32 %i935, %i796
  %i937 = add nuw nsw i32 %i936, %i803
  %i938 = add nuw nsw i32 %i937, %i809
  %i939 = add nuw nsw i32 %i938, %i819
  %i940 = add nuw nsw i32 %i939, %i826
  %i941 = add nuw nsw i32 %i940, %i833
  %i942 = add nuw nsw i32 %i941, %i840
  %i943 = add nuw nsw i32 %i942, %i847
  %i944 = add nuw nsw i32 %i943, %i854
  %i945 = add nuw nsw i32 %i944, %i860
  %i946 = add nuw nsw i32 %i945, %i869
  %i947 = add nuw nsw i32 %i946, %i897
  %i948 = add nuw nsw i32 %i947, %i924
  %i949 = add nuw nsw i32 %i948, %i930
  %i950 = add nuw nsw i32 %i710, %i768
  %i951 = add nuw nsw i32 %i723, %i809
  %i952 = add nuw nsw i32 %i951, %i819
  %i953 = add nuw nsw i32 %i950, %i860
  %i954 = add nuw nsw i32 %i952, %i905
  %i955 = sub nsw i32 %i953, %i954
  %i956 = add nsw i32 %i955, %i918
  %i957 = mul nsw i32 %i956, 3
  %i958 = add nuw nsw i32 %i739, %i775
  %i959 = add nuw nsw i32 %i753, %i803
  %i960 = add nuw nsw i32 %i959, %i826
  %i961 = add nuw nsw i32 %i958, %i854
  %i962 = add nuw nsw i32 %i960, %i876
  %i963 = sub nsw i32 %i961, %i962
  %i964 = add nsw i32 %i963, %i890
  %i965 = shl nsw i32 %i964, 1
  %i966 = add nuw nsw i32 %i732, %i782
  %i967 = add nuw nsw i32 %i760, %i796
  %i968 = add nuw nsw i32 %i967, %i833
  %i969 = add nuw nsw i32 %i966, %i847
  %i970 = add nuw nsw i32 %i968, %i869
  %i971 = sub nsw i32 %i969, %i970
  %i972 = add nsw i32 %i971, %i897
  %i973 = add i32 %i972, %i965
  %i974 = add i32 %i973, %i957
  %i975 = icmp eq i32 %i949, 0
  br i1 %i975, label %bb702.bb1057_crit_edge, label %bb976

bb702.bb1057_crit_edge:                           ; preds = %bb702
  br label %bb1057

bb976:                                            ; preds = %bb702
  %i977 = load i8, ptr %i810, align 1, !tbaa !21
  %i978 = zext i8 %i977 to i64
  %i979 = sub nsw i64 0, %i978
  %i980 = getelementptr inbounds i8, ptr %i373, i64 %i979
  %i981 = load i8, ptr %i980, align 1, !tbaa !21
  %i982 = zext i8 %i981 to i32
  %i983 = getelementptr inbounds i8, ptr %i810, i64 1
  %i984 = load i8, ptr %i983, align 1, !tbaa !21
  %i985 = zext i8 %i984 to i64
  %i986 = sub nsw i64 0, %i985
  %i987 = getelementptr inbounds i8, ptr %i373, i64 %i986
  %i988 = load i8, ptr %i987, align 1, !tbaa !21
  %i989 = zext i8 %i988 to i32
  %i990 = getelementptr inbounds i8, ptr %i810, i64 2
  %i991 = load i8, ptr %i990, align 1, !tbaa !21
  %i992 = zext i8 %i991 to i64
  %i993 = sub nsw i64 0, %i992
  %i994 = getelementptr inbounds i8, ptr %i373, i64 %i993
  %i995 = load i8, ptr %i994, align 1, !tbaa !21
  %i996 = zext i8 %i995 to i32
  %i997 = getelementptr inbounds i8, ptr %i810, i64 4
  %i998 = load i8, ptr %i997, align 1, !tbaa !21
  %i999 = zext i8 %i998 to i64
  %i1000 = sub nsw i64 0, %i999
  %i1001 = getelementptr inbounds i8, ptr %i373, i64 %i1000
  %i1002 = load i8, ptr %i1001, align 1, !tbaa !21
  %i1003 = zext i8 %i1002 to i32
  %i1004 = getelementptr inbounds i8, ptr %i810, i64 5
  %i1005 = load i8, ptr %i1004, align 1, !tbaa !21
  %i1006 = zext i8 %i1005 to i64
  %i1007 = sub nsw i64 0, %i1006
  %i1008 = getelementptr inbounds i8, ptr %i373, i64 %i1007
  %i1009 = load i8, ptr %i1008, align 1, !tbaa !21
  %i1010 = zext i8 %i1009 to i32
  %i1011 = load i8, ptr %i811, align 1, !tbaa !21
  %i1012 = zext i8 %i1011 to i64
  %i1013 = sub nsw i64 0, %i1012
  %i1014 = getelementptr inbounds i8, ptr %i373, i64 %i1013
  %i1015 = load i8, ptr %i1014, align 1, !tbaa !21
  %i1016 = zext i8 %i1015 to i32
  %i1017 = add nuw nsw i32 %i803, %i775
  %i1018 = add nuw nsw i32 %i1017, %i826
  %i1019 = add nuw nsw i32 %i1018, %i854
  %i1020 = add nuw nsw i32 %i1019, %i989
  %i1021 = add nuw nsw i32 %i1020, %i1010
  %i1022 = shl nuw nsw i32 %i1021, 2
  %i1023 = add nuw nsw i32 %i809, %i768
  %i1024 = add nuw nsw i32 %i1023, %i819
  %i1025 = add nuw nsw i32 %i1024, %i860
  %i1026 = add nuw nsw i32 %i1025, %i982
  %i1027 = add nuw nsw i32 %i1026, %i1016
  %i1028 = mul nuw nsw i32 %i1027, 9
  %i1029 = add nuw nsw i32 %i723, %i710
  %i1030 = add nuw nsw i32 %i1029, %i732
  %i1031 = add nuw nsw i32 %i1030, %i739
  %i1032 = add nuw nsw i32 %i1031, %i753
  %i1033 = add nuw nsw i32 %i1032, %i760
  %i1034 = add nuw nsw i32 %i1033, %i782
  %i1035 = add nuw nsw i32 %i1034, %i796
  %i1036 = add nuw nsw i32 %i1035, %i833
  %i1037 = add nuw nsw i32 %i1036, %i847
  %i1038 = add nuw nsw i32 %i1037, %i869
  %i1039 = add nuw nsw i32 %i1038, %i876
  %i1040 = add nuw nsw i32 %i1039, %i890
  %i1041 = add nuw nsw i32 %i1040, %i897
  %i1042 = add nuw nsw i32 %i1041, %i905
  %i1043 = add nuw nsw i32 %i1042, %i918
  %i1044 = add nuw nsw i32 %i1043, %i996
  %i1045 = add nuw nsw i32 %i1044, %i1003
  %i1046 = add nuw nsw i32 %i1045, %i1022
  %i1047 = add nuw nsw i32 %i1046, %i1028
  %i1048 = sitofp i32 %i1047 to float
  %i1049 = sitofp i32 %i949 to float
  %i1050 = fdiv float %i1048, %i1049
  %i1051 = fcmp olt float %i1050, 5.000000e-01
  br i1 %i1051, label %bb976.bb1057_crit_edge, label %bb1052

bb976.bb1057_crit_edge:                           ; preds = %bb976
  br label %bb1057

bb1052:                                           ; preds = %bb976
  %i1053 = fcmp ogt float %i1050, 2.000000e+00
  br i1 %i1053, label %bb1052.bb1057_crit_edge, label %bb1054

bb1052.bb1057_crit_edge:                          ; preds = %bb1052
  br label %bb1057

bb1054:                                           ; preds = %bb1052
  %i1055 = icmp slt i32 %i974, 1
  %i1056 = select i1 %i1055, i32 1, i32 -1
  br label %bb1057

bb1057:                                           ; preds = %bb1054, %bb1052.bb1057_crit_edge, %bb976.bb1057_crit_edge, %bb702.bb1057_crit_edge
  %i1058 = phi i32 [ 0, %bb976.bb1057_crit_edge ], [ 1, %bb1052.bb1057_crit_edge ], [ %i1056, %bb1054 ], [ 1, %bb702.bb1057_crit_edge ]
  %i1059 = phi i32 [ 1, %bb976.bb1057_crit_edge ], [ 0, %bb1052.bb1057_crit_edge ], [ 1, %bb1054 ], [ 0, %bb702.bb1057_crit_edge ]
  %i1060 = add nsw i32 %i1058, %i360
  %i1061 = mul nsw i32 %i1060, %arg5
  %i1062 = trunc i64 %i363 to i32
  %i1063 = add nuw nsw i32 %i1059, %i1062
  %i1064 = add i32 %i1063, %i1061
  %i1065 = sext i32 %i1064 to i64
  %i1066 = getelementptr inbounds i32, ptr %arg1, i64 %i1065
  %i1067 = load i32, ptr %i1066, align 4, !tbaa !16
  %i1068 = icmp sgt i32 %i366, %i1067
  br i1 %i1068, label %bb1069, label %bb1057.bb1156_crit_edge

bb1057.bb1156_crit_edge:                          ; preds = %bb1057
  br label %bb1156

bb1069:                                           ; preds = %bb1057
  %i1070 = sub nsw i32 %i360, %i1058
  %i1071 = mul nsw i32 %i1070, %arg5
  %i1072 = sub nsw i32 %i1062, %i1059
  %i1073 = add i32 %i1072, %i1071
  %i1074 = sext i32 %i1073 to i64
  %i1075 = getelementptr inbounds i32, ptr %arg1, i64 %i1074
  %i1076 = load i32, ptr %i1075, align 4, !tbaa !16
  %i1077 = icmp slt i32 %i366, %i1076
  br i1 %i1077, label %bb1069.bb1156_crit_edge, label %bb1078

bb1069.bb1156_crit_edge:                          ; preds = %bb1069
  br label %bb1156

bb1078:                                           ; preds = %bb1069
  %i1079 = shl nsw i32 %i1058, 1
  %i1080 = add nsw i32 %i1079, %i360
  %i1081 = mul nsw i32 %i1080, %arg5
  %i1082 = shl nuw nsw i32 %i1059, 1
  %i1083 = add nuw i32 %i1082, %i1062
  %i1084 = add i32 %i1083, %i1081
  %i1085 = sext i32 %i1084 to i64
  %i1086 = getelementptr inbounds i32, ptr %arg1, i64 %i1085
  %i1087 = load i32, ptr %i1086, align 4, !tbaa !16
  %i1088 = icmp sgt i32 %i366, %i1087
  br i1 %i1088, label %bb1089, label %bb1078.bb1156_crit_edge

bb1078.bb1156_crit_edge:                          ; preds = %bb1078
  br label %bb1156

bb1089:                                           ; preds = %bb1078
  %i1090 = sub nsw i32 %i360, %i1079
  %i1091 = mul nsw i32 %i1090, %arg5
  %i1092 = sub nsw i32 %i1062, %i1082
  %i1093 = add i32 %i1092, %i1091
  %i1094 = sext i32 %i1093 to i64
  %i1095 = getelementptr inbounds i32, ptr %arg1, i64 %i1094
  %i1096 = load i32, ptr %i1095, align 4, !tbaa !16
  %i1097 = icmp slt i32 %i366, %i1096
  br i1 %i1097, label %bb1089.bb1156_crit_edge, label %bb1089.bb1153_crit_edge

bb1089.bb1153_crit_edge:                          ; preds = %bb1089
  br label %bb1153

bb1089.bb1156_crit_edge:                          ; preds = %bb1089
  br label %bb1156

bb1098:                                           ; preds = %bb375
  %i1099 = icmp eq i32 %i666, 0
  %i1100 = sitofp i32 %i691 to float
  %i1101 = sitofp i32 %i666 to float
  %i1102 = fdiv float %i1100, %i1101
  %i1103 = select i1 %i1099, float 1.000000e+06, float %i1102
  %i1104 = fcmp uge float %i1103, 0.000000e+00
  %i1105 = fneg float %i1103
  %i1106 = select i1 %i1104, float %i1103, float %i1105
  %i1107 = fcmp olt float %i1106, 5.000000e-01
  br i1 %i1107, label %bb1098.bb1112_crit_edge, label %bb1108

bb1098.bb1112_crit_edge:                          ; preds = %bb1098
  br label %bb1112

bb1108:                                           ; preds = %bb1098
  %i1109 = fcmp ogt float %i1106, 2.000000e+00
  br i1 %i1109, label %bb1108.bb1112_crit_edge, label %bb1110

bb1108.bb1112_crit_edge:                          ; preds = %bb1108
  br label %bb1112

bb1110:                                           ; preds = %bb1108
  %i1111 = select i1 %i1104, i32 1, i32 -1
  br label %bb1112

bb1112:                                           ; preds = %bb1110, %bb1108.bb1112_crit_edge, %bb1098.bb1112_crit_edge
  %i1113 = phi i32 [ 0, %bb1098.bb1112_crit_edge ], [ 1, %bb1108.bb1112_crit_edge ], [ %i1111, %bb1110 ]
  %i1114 = phi i32 [ 1, %bb1098.bb1112_crit_edge ], [ 0, %bb1108.bb1112_crit_edge ], [ 1, %bb1110 ]
  %i1115 = add nsw i32 %i1113, %i361
  %i1116 = mul nsw i32 %i1115, %arg5
  %i1117 = trunc i64 %i363 to i32
  %i1118 = add nuw nsw i32 %i1114, %i1117
  %i1119 = add i32 %i1118, %i1116
  %i1120 = sext i32 %i1119 to i64
  %i1121 = getelementptr inbounds i32, ptr %arg1, i64 %i1120
  %i1122 = load i32, ptr %i1121, align 4, !tbaa !16
  %i1123 = icmp sgt i32 %i366, %i1122
  br i1 %i1123, label %bb1124, label %bb1112.bb1156_crit_edge

bb1112.bb1156_crit_edge:                          ; preds = %bb1112
  br label %bb1156

bb1124:                                           ; preds = %bb1112
  %i1125 = sub nsw i32 %i361, %i1113
  %i1126 = mul nsw i32 %i1125, %arg5
  %i1127 = sub nsw i32 %i1117, %i1114
  %i1128 = add i32 %i1127, %i1126
  %i1129 = sext i32 %i1128 to i64
  %i1130 = getelementptr inbounds i32, ptr %arg1, i64 %i1129
  %i1131 = load i32, ptr %i1130, align 4, !tbaa !16
  %i1132 = icmp slt i32 %i366, %i1131
  br i1 %i1132, label %bb1124.bb1156_crit_edge, label %bb1133

bb1124.bb1156_crit_edge:                          ; preds = %bb1124
  br label %bb1156

bb1133:                                           ; preds = %bb1124
  %i1134 = shl nsw i32 %i1113, 1
  %i1135 = add nsw i32 %i1134, %i361
  %i1136 = mul nsw i32 %i1135, %arg5
  %i1137 = shl nuw nsw i32 %i1114, 1
  %i1138 = add nuw i32 %i1137, %i1117
  %i1139 = add i32 %i1138, %i1136
  %i1140 = sext i32 %i1139 to i64
  %i1141 = getelementptr inbounds i32, ptr %arg1, i64 %i1140
  %i1142 = load i32, ptr %i1141, align 4, !tbaa !16
  %i1143 = icmp sgt i32 %i366, %i1142
  br i1 %i1143, label %bb1144, label %bb1133.bb1156_crit_edge

bb1133.bb1156_crit_edge:                          ; preds = %bb1133
  br label %bb1156

bb1144:                                           ; preds = %bb1133
  %i1145 = sub nsw i32 %i361, %i1134
  %i1146 = mul nsw i32 %i1145, %arg5
  %i1147 = sub nsw i32 %i1117, %i1137
  %i1148 = add i32 %i1147, %i1146
  %i1149 = sext i32 %i1148 to i64
  %i1150 = getelementptr inbounds i32, ptr %arg1, i64 %i1149
  %i1151 = load i32, ptr %i1150, align 4, !tbaa !16
  %i1152 = icmp slt i32 %i366, %i1151
  br i1 %i1152, label %bb1144.bb1156_crit_edge, label %bb1144.bb1153_crit_edge

bb1144.bb1153_crit_edge:                          ; preds = %bb1144
  br label %bb1153

bb1144.bb1156_crit_edge:                          ; preds = %bb1144
  br label %bb1156

bb1153:                                           ; preds = %bb1144.bb1153_crit_edge, %bb1089.bb1153_crit_edge
  %i1154 = phi i8 [ 2, %bb1089.bb1153_crit_edge ], [ 1, %bb1144.bb1153_crit_edge ]
  %i1155 = getelementptr inbounds i8, ptr %arg2, i64 %i364
  store i8 %i1154, ptr %i1155, align 1, !tbaa !21
  br label %bb1156

bb1156:                                           ; preds = %bb1153, %bb1144.bb1156_crit_edge, %bb1133.bb1156_crit_edge, %bb1124.bb1156_crit_edge, %bb1112.bb1156_crit_edge, %bb1089.bb1156_crit_edge, %bb1078.bb1156_crit_edge, %bb1069.bb1156_crit_edge, %bb1057.bb1156_crit_edge, %bb362.bb1156_crit_edge
  %i1157 = add nuw nsw i64 %i363, 1
  %i1158 = icmp eq i64 %i1157, %i351
  br i1 %i1158, label %bb1159, label %bb1156.bb362_crit_edge, !llvm.loop !46

bb1156.bb362_crit_edge:                           ; preds = %bb1156
  br label %bb362

bb1159:                                           ; preds = %bb1156
  %i1160 = add nuw nsw i64 %i353, 1
  %i1161 = icmp eq i64 %i1160, %i350
  br i1 %i1161, label %bb1162.loopexit, label %bb1159.bb352_crit_edge, !llvm.loop !47

bb1159.bb352_crit_edge:                           ; preds = %bb1159
  br label %bb352

bb1162.loopexit:                                  ; preds = %bb1159
  br label %bb1162

bb1162:                                           ; preds = %bb1162.loopexit, %bb339.bb1162_crit_edge, %bb336.bb1162_crit_edge, %bb.bb1162_crit_edge
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
  %i9 = add i32 %arg6, -1
  %i10 = icmp sgt i32 %arg6, 2
  br i1 %i10, label %bb11, label %bb.bb361_crit_edge

bb.bb361_crit_edge:                               ; preds = %bb
  br label %bb361

bb11:                                             ; preds = %bb
  %i12 = icmp sgt i32 %arg5, 2
  %i13 = add nsw i32 %arg5, -2
  %i14 = sext i32 %i13 to i64
  br i1 %i12, label %bb15, label %bb11.bb109_crit_edge

bb11.bb109_crit_edge:                             ; preds = %bb11
  br label %bb109

bb15:                                             ; preds = %bb11
  %i16 = add nsw i32 %arg5, -1
  %i17 = zext nneg i32 %arg5 to i64
  %i18 = zext nneg i32 %i9 to i64
  %i19 = zext i32 %i16 to i64
  br label %bb20

bb20:                                             ; preds = %bb106.bb20_crit_edge, %bb15
  %i21 = phi i64 [ 1, %bb15 ], [ %i107, %bb106.bb20_crit_edge ]
  %i22 = add nsw i64 %i21, -1
  %i23 = mul nsw i64 %i22, %i17
  %i24 = getelementptr inbounds i8, ptr %arg, i64 %i23
  %i25 = trunc i64 %i21 to i32
  %i26 = mul i32 %i25, %arg5
  %i27 = zext i32 %i26 to i64
  br label %bb28

bb28:                                             ; preds = %bb103.bb28_crit_edge, %bb20
  %i29 = phi i64 [ 1, %bb20 ], [ %i104, %bb103.bb28_crit_edge ]
  %i30 = getelementptr inbounds i8, ptr %i24, i64 %i29
  %i31 = getelementptr inbounds i8, ptr %i30, i64 -1
  %i32 = add nuw nsw i64 %i29, %i27
  %i33 = getelementptr inbounds i8, ptr %arg, i64 %i32
  %i34 = load i8, ptr %i33, align 1, !tbaa !21
  %i35 = zext i8 %i34 to i64
  %i36 = getelementptr inbounds i8, ptr %arg3, i64 %i35
  %i37 = load i8, ptr %i31, align 1, !tbaa !21
  %i38 = zext i8 %i37 to i64
  %i39 = sub nsw i64 0, %i38
  %i40 = getelementptr inbounds i8, ptr %i36, i64 %i39
  %i41 = load i8, ptr %i40, align 1, !tbaa !21
  %i42 = zext i8 %i41 to i32
  %i43 = add nuw nsw i32 %i42, 100
  %i44 = getelementptr inbounds i8, ptr %i30, i64 1
  %i45 = load i8, ptr %i30, align 1, !tbaa !21
  %i46 = zext i8 %i45 to i64
  %i47 = sub nsw i64 0, %i46
  %i48 = getelementptr inbounds i8, ptr %i36, i64 %i47
  %i49 = load i8, ptr %i48, align 1, !tbaa !21
  %i50 = zext i8 %i49 to i32
  %i51 = add nuw nsw i32 %i43, %i50
  %i52 = load i8, ptr %i44, align 1, !tbaa !21
  %i53 = zext i8 %i52 to i64
  %i54 = sub nsw i64 0, %i53
  %i55 = getelementptr inbounds i8, ptr %i36, i64 %i54
  %i56 = load i8, ptr %i55, align 1, !tbaa !21
  %i57 = zext i8 %i56 to i32
  %i58 = add nuw nsw i32 %i51, %i57
  %i59 = getelementptr inbounds i8, ptr %i44, i64 %i14
  %i60 = load i8, ptr %i59, align 1, !tbaa !21
  %i61 = zext i8 %i60 to i64
  %i62 = sub nsw i64 0, %i61
  %i63 = getelementptr inbounds i8, ptr %i36, i64 %i62
  %i64 = load i8, ptr %i63, align 1, !tbaa !21
  %i65 = zext i8 %i64 to i32
  %i66 = add nuw nsw i32 %i58, %i65
  %i67 = getelementptr inbounds i8, ptr %i59, i64 2
  %i68 = load i8, ptr %i67, align 1, !tbaa !21
  %i69 = zext i8 %i68 to i64
  %i70 = sub nsw i64 0, %i69
  %i71 = getelementptr inbounds i8, ptr %i36, i64 %i70
  %i72 = load i8, ptr %i71, align 1, !tbaa !21
  %i73 = zext i8 %i72 to i32
  %i74 = add nuw nsw i32 %i66, %i73
  %i75 = getelementptr inbounds i8, ptr %i67, i64 %i14
  %i76 = getelementptr inbounds i8, ptr %i75, i64 1
  %i77 = load i8, ptr %i75, align 1, !tbaa !21
  %i78 = zext i8 %i77 to i64
  %i79 = sub nsw i64 0, %i78
  %i80 = getelementptr inbounds i8, ptr %i36, i64 %i79
  %i81 = load i8, ptr %i80, align 1, !tbaa !21
  %i82 = zext i8 %i81 to i32
  %i83 = add nuw nsw i32 %i74, %i82
  %i84 = getelementptr inbounds i8, ptr %i75, i64 2
  %i85 = load i8, ptr %i76, align 1, !tbaa !21
  %i86 = zext i8 %i85 to i64
  %i87 = sub nsw i64 0, %i86
  %i88 = getelementptr inbounds i8, ptr %i36, i64 %i87
  %i89 = load i8, ptr %i88, align 1, !tbaa !21
  %i90 = zext i8 %i89 to i32
  %i91 = add nuw nsw i32 %i83, %i90
  %i92 = load i8, ptr %i84, align 1, !tbaa !21
  %i93 = zext i8 %i92 to i64
  %i94 = sub nsw i64 0, %i93
  %i95 = getelementptr inbounds i8, ptr %i36, i64 %i94
  %i96 = load i8, ptr %i95, align 1, !tbaa !21
  %i97 = zext i8 %i96 to i32
  %i98 = add nuw nsw i32 %i91, %i97
  %i99 = icmp ult i32 %i98, 731
  br i1 %i99, label %bb100, label %bb28.bb103_crit_edge

bb28.bb103_crit_edge:                             ; preds = %bb28
  br label %bb103

bb100:                                            ; preds = %bb28
  %i101 = sub nuw nsw i32 730, %i98
  %i102 = getelementptr inbounds i32, ptr %arg1, i64 %i32
  store i32 %i101, ptr %i102, align 4, !tbaa !16
  br label %bb103

bb103:                                            ; preds = %bb100, %bb28.bb103_crit_edge
  %i104 = add nuw nsw i64 %i29, 1
  %i105 = icmp eq i64 %i104, %i19
  br i1 %i105, label %bb106, label %bb103.bb28_crit_edge, !llvm.loop !48

bb103.bb28_crit_edge:                             ; preds = %bb103
  br label %bb28

bb106:                                            ; preds = %bb103
  %i107 = add nuw nsw i64 %i21, 1
  %i108 = icmp eq i64 %i107, %i18
  br i1 %i108, label %bb109.loopexit, label %bb106.bb20_crit_edge, !llvm.loop !49

bb106.bb20_crit_edge:                             ; preds = %bb106
  br label %bb20

bb109.loopexit:                                   ; preds = %bb106
  br label %bb109

bb109:                                            ; preds = %bb109.loopexit, %bb11.bb109_crit_edge
  %i110 = add nsw i32 %arg6, -2
  %i111 = icmp sgt i32 %arg6, 4
  br i1 %i111, label %bb112, label %bb109.bb361_crit_edge

bb109.bb361_crit_edge:                            ; preds = %bb109
  br label %bb361

bb112:                                            ; preds = %bb109
  %i113 = add i32 %arg5, -2
  %i114 = icmp sgt i32 %arg5, 4
  %i115 = sext i32 %i113 to i64
  br i1 %i114, label %bb116, label %bb112.bb361_crit_edge

bb112.bb361_crit_edge:                            ; preds = %bb112
  br label %bb361

bb116:                                            ; preds = %bb112
  %i117 = zext nneg i32 %arg5 to i64
  %i118 = zext nneg i32 %i110 to i64
  %i119 = zext i32 %i113 to i64
  br label %bb120

bb120:                                            ; preds = %bb358.bb120_crit_edge, %bb116
  %i121 = phi i64 [ 2, %bb116 ], [ %i359, %bb358.bb120_crit_edge ]
  %i122 = add nsw i64 %i121, -1
  %i123 = mul nsw i64 %i122, %i117
  %i124 = getelementptr inbounds i8, ptr %arg, i64 %i123
  %i125 = trunc i64 %i121 to i32
  %i126 = mul i32 %i125, %arg5
  %i127 = zext i32 %i126 to i64
  %i128 = trunc i64 %i121 to i32
  %i129 = trunc i64 %i121 to i32
  br label %bb130

bb130:                                            ; preds = %bb355.bb130_crit_edge, %bb120
  %i131 = phi i64 [ 2, %bb120 ], [ %i356, %bb355.bb130_crit_edge ]
  %i132 = add nuw nsw i64 %i131, %i127
  %i133 = getelementptr inbounds i32, ptr %arg1, i64 %i132
  %i134 = load i32, ptr %i133, align 4, !tbaa !16
  %i135 = icmp sgt i32 %i134, 0
  br i1 %i135, label %bb136, label %bb130.bb355_crit_edge

bb130.bb355_crit_edge:                            ; preds = %bb130
  br label %bb355

bb136:                                            ; preds = %bb130
  %i137 = getelementptr inbounds i8, ptr %arg, i64 %i132
  %i138 = load i8, ptr %i137, align 1, !tbaa !21
  %i139 = zext i8 %i138 to i64
  %i140 = getelementptr inbounds i8, ptr %arg3, i64 %i139
  %i141 = icmp ult i32 %i134, 480
  br i1 %i141, label %bb142, label %bb136.bb219_crit_edge

bb136.bb219_crit_edge:                            ; preds = %bb136
  br label %bb219

bb142:                                            ; preds = %bb136
  %i143 = sub nuw nsw i32 730, %i134
  %i144 = getelementptr inbounds i8, ptr %i124, i64 %i131
  %i145 = getelementptr inbounds i8, ptr %i144, i64 -1
  %i146 = load i8, ptr %i145, align 1, !tbaa !21
  %i147 = zext i8 %i146 to i64
  %i148 = sub nsw i64 0, %i147
  %i149 = getelementptr inbounds i8, ptr %i140, i64 %i148
  %i150 = load i8, ptr %i149, align 1, !tbaa !21
  %i151 = zext i8 %i150 to i32
  %i152 = getelementptr inbounds i8, ptr %i144, i64 1
  %i153 = load i8, ptr %i144, align 1, !tbaa !21
  %i154 = zext i8 %i153 to i64
  %i155 = sub nsw i64 0, %i154
  %i156 = getelementptr inbounds i8, ptr %i140, i64 %i155
  %i157 = load i8, ptr %i156, align 1, !tbaa !21
  %i158 = zext i8 %i157 to i32
  %i159 = load i8, ptr %i152, align 1, !tbaa !21
  %i160 = zext i8 %i159 to i64
  %i161 = sub nsw i64 0, %i160
  %i162 = getelementptr inbounds i8, ptr %i140, i64 %i161
  %i163 = load i8, ptr %i162, align 1, !tbaa !21
  %i164 = zext i8 %i163 to i32
  %i165 = getelementptr inbounds i8, ptr %i152, i64 %i115
  %i166 = load i8, ptr %i165, align 1, !tbaa !21
  %i167 = zext i8 %i166 to i64
  %i168 = sub nsw i64 0, %i167
  %i169 = getelementptr inbounds i8, ptr %i140, i64 %i168
  %i170 = load i8, ptr %i169, align 1, !tbaa !21
  %i171 = zext i8 %i170 to i32
  %i172 = getelementptr inbounds i8, ptr %i165, i64 2
  %i173 = load i8, ptr %i172, align 1, !tbaa !21
  %i174 = zext i8 %i173 to i64
  %i175 = sub nsw i64 0, %i174
  %i176 = getelementptr inbounds i8, ptr %i140, i64 %i175
  %i177 = load i8, ptr %i176, align 1, !tbaa !21
  %i178 = zext i8 %i177 to i32
  %i179 = getelementptr inbounds i8, ptr %i172, i64 %i115
  %i180 = getelementptr inbounds i8, ptr %i179, i64 1
  %i181 = load i8, ptr %i179, align 1, !tbaa !21
  %i182 = zext i8 %i181 to i64
  %i183 = sub nsw i64 0, %i182
  %i184 = getelementptr inbounds i8, ptr %i140, i64 %i183
  %i185 = load i8, ptr %i184, align 1, !tbaa !21
  %i186 = zext i8 %i185 to i32
  %i187 = add nuw nsw i32 %i158, %i151
  %i188 = add nuw nsw i32 %i187, %i164
  %i189 = sub nsw i32 %i186, %i188
  %i190 = getelementptr inbounds i8, ptr %i179, i64 2
  %i191 = load i8, ptr %i180, align 1, !tbaa !21
  %i192 = zext i8 %i191 to i64
  %i193 = sub nsw i64 0, %i192
  %i194 = getelementptr inbounds i8, ptr %i140, i64 %i193
  %i195 = load i8, ptr %i194, align 1, !tbaa !21
  %i196 = zext i8 %i195 to i32
  %i197 = add nsw i32 %i189, %i196
  %i198 = load i8, ptr %i190, align 1, !tbaa !21
  %i199 = zext i8 %i198 to i64
  %i200 = sub nsw i64 0, %i199
  %i201 = getelementptr inbounds i8, ptr %i140, i64 %i200
  %i202 = load i8, ptr %i201, align 1, !tbaa !21
  %i203 = zext i8 %i202 to i32
  %i204 = add nuw nsw i32 %i151, %i171
  %i205 = add nuw nsw i32 %i164, %i178
  %i206 = add nuw nsw i32 %i204, %i186
  %i207 = sub nsw i32 %i205, %i206
  %i208 = add nsw i32 %i207, %i203
  %i209 = add nsw i32 %i197, %i203
  %i210 = mul nsw i32 %i208, %i208
  %i211 = mul nsw i32 %i209, %i209
  %i212 = add nuw nsw i32 %i210, %i211
  %i213 = sitofp i32 %i212 to float
  %i214 = tail call float @sqrtf(float noundef %i213) #11
  %i215 = fpext float %i214 to double
  %i216 = sitofp i32 %i143 to double
  %i217 = fmul double %i216, 4.000000e-01
  %i218 = fcmp olt double %i217, %i215
  br i1 %i218, label %bb317, label %bb142.bb219_crit_edge

bb142.bb219_crit_edge:                            ; preds = %bb142
  br label %bb219

bb219:                                            ; preds = %bb142.bb219_crit_edge, %bb136.bb219_crit_edge
  %i220 = getelementptr inbounds i8, ptr %i124, i64 %i131
  %i221 = getelementptr inbounds i8, ptr %i220, i64 -1
  %i222 = load i8, ptr %i221, align 1, !tbaa !21
  %i223 = zext i8 %i222 to i64
  %i224 = sub nsw i64 0, %i223
  %i225 = getelementptr inbounds i8, ptr %i140, i64 %i224
  %i226 = load i8, ptr %i225, align 1, !tbaa !21
  %i227 = zext i8 %i226 to i32
  %i228 = getelementptr inbounds i8, ptr %i220, i64 1
  %i229 = load i8, ptr %i220, align 1, !tbaa !21
  %i230 = zext i8 %i229 to i64
  %i231 = sub nsw i64 0, %i230
  %i232 = getelementptr inbounds i8, ptr %i140, i64 %i231
  %i233 = load i8, ptr %i232, align 1, !tbaa !21
  %i234 = zext i8 %i233 to i32
  %i235 = load i8, ptr %i228, align 1, !tbaa !21
  %i236 = zext i8 %i235 to i64
  %i237 = sub nsw i64 0, %i236
  %i238 = getelementptr inbounds i8, ptr %i140, i64 %i237
  %i239 = load i8, ptr %i238, align 1, !tbaa !21
  %i240 = zext i8 %i239 to i32
  %i241 = getelementptr inbounds i8, ptr %i228, i64 %i115
  %i242 = getelementptr inbounds i8, ptr %i241, i64 2
  %i243 = getelementptr inbounds i8, ptr %i242, i64 %i115
  %i244 = getelementptr inbounds i8, ptr %i243, i64 1
  %i245 = load i8, ptr %i243, align 1, !tbaa !21
  %i246 = zext i8 %i245 to i64
  %i247 = sub nsw i64 0, %i246
  %i248 = getelementptr inbounds i8, ptr %i140, i64 %i247
  %i249 = load i8, ptr %i248, align 1, !tbaa !21
  %i250 = zext i8 %i249 to i32
  %i251 = getelementptr inbounds i8, ptr %i243, i64 2
  %i252 = load i8, ptr %i244, align 1, !tbaa !21
  %i253 = zext i8 %i252 to i64
  %i254 = sub nsw i64 0, %i253
  %i255 = getelementptr inbounds i8, ptr %i140, i64 %i254
  %i256 = load i8, ptr %i255, align 1, !tbaa !21
  %i257 = zext i8 %i256 to i32
  %i258 = load i8, ptr %i251, align 1, !tbaa !21
  %i259 = zext i8 %i258 to i64
  %i260 = sub nsw i64 0, %i259
  %i261 = getelementptr inbounds i8, ptr %i140, i64 %i260
  %i262 = load i8, ptr %i261, align 1, !tbaa !21
  %i263 = zext i8 %i262 to i32
  %i264 = add nuw nsw i32 %i250, %i240
  %i265 = add nuw nsw i32 %i264, %i227
  %i266 = add nuw nsw i32 %i265, %i234
  %i267 = add nuw nsw i32 %i266, %i257
  %i268 = add nuw nsw i32 %i267, %i263
  %i269 = add nuw nsw i32 %i263, %i227
  %i270 = icmp eq i32 %i268, 0
  br i1 %i270, label %bb219.bb296_crit_edge, label %bb271

bb219.bb296_crit_edge:                            ; preds = %bb219
  br label %bb296

bb271:                                            ; preds = %bb219
  %i272 = load i8, ptr %i241, align 1, !tbaa !21
  %i273 = zext i8 %i272 to i64
  %i274 = sub nsw i64 0, %i273
  %i275 = getelementptr inbounds i8, ptr %i140, i64 %i274
  %i276 = load i8, ptr %i275, align 1, !tbaa !21
  %i277 = zext i8 %i276 to i32
  %i278 = load i8, ptr %i242, align 1, !tbaa !21
  %i279 = zext i8 %i278 to i64
  %i280 = sub nsw i64 0, %i279
  %i281 = getelementptr inbounds i8, ptr %i140, i64 %i280
  %i282 = load i8, ptr %i281, align 1, !tbaa !21
  %i283 = zext i8 %i282 to i32
  %i284 = add nuw nsw i32 %i265, %i263
  %i285 = add nuw nsw i32 %i284, %i277
  %i286 = add nuw nsw i32 %i285, %i283
  %i287 = sitofp i32 %i286 to float
  %i288 = sitofp i32 %i268 to float
  %i289 = fdiv float %i287, %i288
  %i290 = fcmp olt float %i289, 5.000000e-01
  br i1 %i290, label %bb271.bb296_crit_edge, label %bb291

bb271.bb296_crit_edge:                            ; preds = %bb271
  br label %bb296

bb291:                                            ; preds = %bb271
  %i292 = fcmp ogt float %i289, 2.000000e+00
  br i1 %i292, label %bb291.bb296_crit_edge, label %bb293

bb291.bb296_crit_edge:                            ; preds = %bb291
  br label %bb296

bb293:                                            ; preds = %bb291
  %i294 = icmp ugt i32 %i269, %i264
  %i295 = select i1 %i294, i32 -1, i32 1
  br label %bb296

bb296:                                            ; preds = %bb293, %bb291.bb296_crit_edge, %bb271.bb296_crit_edge, %bb219.bb296_crit_edge
  %i297 = phi i32 [ 0, %bb271.bb296_crit_edge ], [ 1, %bb291.bb296_crit_edge ], [ %i295, %bb293 ], [ 1, %bb219.bb296_crit_edge ]
  %i298 = phi i32 [ 1, %bb271.bb296_crit_edge ], [ 0, %bb291.bb296_crit_edge ], [ 1, %bb293 ], [ 0, %bb219.bb296_crit_edge ]
  %i299 = add nsw i32 %i297, %i128
  %i300 = mul nsw i32 %i299, %arg5
  %i301 = trunc i64 %i131 to i32
  %i302 = add nuw nsw i32 %i298, %i301
  %i303 = add i32 %i302, %i300
  %i304 = sext i32 %i303 to i64
  %i305 = getelementptr inbounds i32, ptr %arg1, i64 %i304
  %i306 = load i32, ptr %i305, align 4, !tbaa !16
  %i307 = icmp sgt i32 %i134, %i306
  br i1 %i307, label %bb308, label %bb296.bb355_crit_edge

bb296.bb355_crit_edge:                            ; preds = %bb296
  br label %bb355

bb308:                                            ; preds = %bb296
  %i309 = sub nsw i32 %i128, %i297
  %i310 = mul nsw i32 %i309, %arg5
  %i311 = sub nsw i32 %i301, %i298
  %i312 = add i32 %i311, %i310
  %i313 = sext i32 %i312 to i64
  %i314 = getelementptr inbounds i32, ptr %arg1, i64 %i313
  %i315 = load i32, ptr %i314, align 4, !tbaa !16
  %i316 = icmp slt i32 %i134, %i315
  br i1 %i316, label %bb308.bb355_crit_edge, label %bb308.bb352_crit_edge

bb308.bb352_crit_edge:                            ; preds = %bb308
  br label %bb352

bb308.bb355_crit_edge:                            ; preds = %bb308
  br label %bb355

bb317:                                            ; preds = %bb142
  %i318 = icmp eq i32 %i208, 0
  %i319 = sitofp i32 %i209 to float
  %i320 = sitofp i32 %i208 to float
  %i321 = fdiv float %i319, %i320
  %i322 = select i1 %i318, float 1.000000e+06, float %i321
  %i323 = fcmp uge float %i322, 0.000000e+00
  %i324 = fneg float %i322
  %i325 = select i1 %i323, float %i322, float %i324
  %i326 = fcmp olt float %i325, 5.000000e-01
  br i1 %i326, label %bb317.bb331_crit_edge, label %bb327

bb317.bb331_crit_edge:                            ; preds = %bb317
  br label %bb331

bb327:                                            ; preds = %bb317
  %i328 = fcmp ogt float %i325, 2.000000e+00
  br i1 %i328, label %bb327.bb331_crit_edge, label %bb329

bb327.bb331_crit_edge:                            ; preds = %bb327
  br label %bb331

bb329:                                            ; preds = %bb327
  %i330 = select i1 %i323, i32 1, i32 -1
  br label %bb331

bb331:                                            ; preds = %bb329, %bb327.bb331_crit_edge, %bb317.bb331_crit_edge
  %i332 = phi i32 [ 0, %bb317.bb331_crit_edge ], [ 1, %bb327.bb331_crit_edge ], [ %i330, %bb329 ]
  %i333 = phi i32 [ 1, %bb317.bb331_crit_edge ], [ 0, %bb327.bb331_crit_edge ], [ 1, %bb329 ]
  %i334 = add nsw i32 %i332, %i129
  %i335 = mul nsw i32 %i334, %arg5
  %i336 = trunc i64 %i131 to i32
  %i337 = add nuw nsw i32 %i333, %i336
  %i338 = add i32 %i337, %i335
  %i339 = sext i32 %i338 to i64
  %i340 = getelementptr inbounds i32, ptr %arg1, i64 %i339
  %i341 = load i32, ptr %i340, align 4, !tbaa !16
  %i342 = icmp sgt i32 %i134, %i341
  br i1 %i342, label %bb343, label %bb331.bb355_crit_edge

bb331.bb355_crit_edge:                            ; preds = %bb331
  br label %bb355

bb343:                                            ; preds = %bb331
  %i344 = sub nsw i32 %i129, %i332
  %i345 = mul nsw i32 %i344, %arg5
  %i346 = sub nsw i32 %i336, %i333
  %i347 = add i32 %i346, %i345
  %i348 = sext i32 %i347 to i64
  %i349 = getelementptr inbounds i32, ptr %arg1, i64 %i348
  %i350 = load i32, ptr %i349, align 4, !tbaa !16
  %i351 = icmp slt i32 %i134, %i350
  br i1 %i351, label %bb343.bb355_crit_edge, label %bb343.bb352_crit_edge

bb343.bb352_crit_edge:                            ; preds = %bb343
  br label %bb352

bb343.bb355_crit_edge:                            ; preds = %bb343
  br label %bb355

bb352:                                            ; preds = %bb343.bb352_crit_edge, %bb308.bb352_crit_edge
  %i353 = phi i8 [ 2, %bb308.bb352_crit_edge ], [ 1, %bb343.bb352_crit_edge ]
  %i354 = getelementptr inbounds i8, ptr %arg2, i64 %i132
  store i8 %i353, ptr %i354, align 1, !tbaa !21
  br label %bb355

bb355:                                            ; preds = %bb352, %bb343.bb355_crit_edge, %bb331.bb355_crit_edge, %bb308.bb355_crit_edge, %bb296.bb355_crit_edge, %bb130.bb355_crit_edge
  %i356 = add nuw nsw i64 %i131, 1
  %i357 = icmp eq i64 %i356, %i119
  br i1 %i357, label %bb358, label %bb355.bb130_crit_edge, !llvm.loop !50

bb355.bb130_crit_edge:                            ; preds = %bb355
  br label %bb130

bb358:                                            ; preds = %bb355
  %i359 = add nuw nsw i64 %i121, 1
  %i360 = icmp eq i64 %i359, %i118
  br i1 %i360, label %bb361.loopexit, label %bb358.bb120_crit_edge, !llvm.loop !51

bb358.bb120_crit_edge:                            ; preds = %bb358
  br label %bb120

bb361.loopexit:                                   ; preds = %bb358
  br label %bb361

bb361:                                            ; preds = %bb361.loopexit, %bb112.bb361_crit_edge, %bb109.bb361_crit_edge, %bb.bb361_crit_edge
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @corner_draw(ptr nocapture noundef writeonly %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2, i32 noundef %arg3) local_unnamed_addr #17 {
bb:
  %i = getelementptr inbounds %struct.anon, ptr %arg1, i64 0, i32 2
  %i4 = load i32, ptr %i, align 4, !tbaa !52
  %i5 = icmp eq i32 %i4, 7
  br i1 %i5, label %bb.bb51_crit_edge, label %bb6

bb.bb51_crit_edge:                                ; preds = %bb
  br label %bb51

bb6:                                              ; preds = %bb
  %i7 = icmp eq i32 %arg3, 0
  %i8 = add nsw i32 %arg2, -2
  %i9 = sext i32 %i8 to i64
  br i1 %i7, label %bb10.preheader, label %bb35.preheader

bb35.preheader:                                   ; preds = %bb6
  br label %bb35

bb10.preheader:                                   ; preds = %bb6
  br label %bb10

bb10:                                             ; preds = %bb10.bb10_crit_edge, %bb10.preheader
  %i11 = phi i64 [ %i30, %bb10.bb10_crit_edge ], [ 0, %bb10.preheader ]
  %i12 = phi ptr [ %i31, %bb10.bb10_crit_edge ], [ %arg1, %bb10.preheader ]
  %i13 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i11, i32 1
  %i14 = load i32, ptr %i13, align 4, !tbaa !54
  %i15 = add nsw i32 %i14, -1
  %i16 = mul nsw i32 %i15, %arg2
  %i17 = sext i32 %i16 to i64
  %i18 = getelementptr inbounds i8, ptr %arg, i64 %i17
  %i19 = load i32, ptr %i12, align 4, !tbaa !55
  %i20 = sext i32 %i19 to i64
  %i21 = getelementptr inbounds i8, ptr %i18, i64 %i20
  %i22 = getelementptr inbounds i8, ptr %i21, i64 -1
  store i8 -1, ptr %i22, align 1, !tbaa !21
  %i23 = getelementptr inbounds i8, ptr %i21, i64 1
  store i8 -1, ptr %i21, align 1, !tbaa !21
  store i8 -1, ptr %i23, align 1, !tbaa !21
  %i24 = getelementptr inbounds i8, ptr %i23, i64 %i9
  %i25 = getelementptr inbounds i8, ptr %i24, i64 1
  store i8 -1, ptr %i24, align 1, !tbaa !21
  %i26 = getelementptr inbounds i8, ptr %i24, i64 2
  store i8 0, ptr %i25, align 1, !tbaa !21
  store i8 -1, ptr %i26, align 1, !tbaa !21
  %i27 = getelementptr inbounds i8, ptr %i26, i64 %i9
  %i28 = getelementptr inbounds i8, ptr %i27, i64 1
  store i8 -1, ptr %i27, align 1, !tbaa !21
  %i29 = getelementptr inbounds i8, ptr %i27, i64 2
  store i8 -1, ptr %i28, align 1, !tbaa !21
  store i8 -1, ptr %i29, align 1, !tbaa !21
  %i30 = add nuw nsw i64 %i11, 1
  %i31 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i30
  %i32 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i30, i32 2
  %i33 = load i32, ptr %i32, align 4, !tbaa !52
  %i34 = icmp eq i32 %i33, 7
  br i1 %i34, label %bb51.loopexit, label %bb10.bb10_crit_edge, !llvm.loop !56

bb10.bb10_crit_edge:                              ; preds = %bb10
  br label %bb10

bb35:                                             ; preds = %bb35.bb35_crit_edge, %bb35.preheader
  %i36 = phi i64 [ %i46, %bb35.bb35_crit_edge ], [ 0, %bb35.preheader ]
  %i37 = phi ptr [ %i47, %bb35.bb35_crit_edge ], [ %arg1, %bb35.preheader ]
  %i38 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i36, i32 1
  %i39 = load i32, ptr %i38, align 4, !tbaa !54
  %i40 = mul nsw i32 %i39, %arg2
  %i41 = sext i32 %i40 to i64
  %i42 = getelementptr inbounds i8, ptr %arg, i64 %i41
  %i43 = load i32, ptr %i37, align 4, !tbaa !55
  %i44 = sext i32 %i43 to i64
  %i45 = getelementptr inbounds i8, ptr %i42, i64 %i44
  store i8 0, ptr %i45, align 1, !tbaa !21
  %i46 = add nuw nsw i64 %i36, 1
  %i47 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i46
  %i48 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i46, i32 2
  %i49 = load i32, ptr %i48, align 4, !tbaa !52
  %i50 = icmp eq i32 %i49, 7
  br i1 %i50, label %bb51.loopexit1, label %bb35.bb35_crit_edge, !llvm.loop !56

bb35.bb35_crit_edge:                              ; preds = %bb35
  br label %bb35

bb51.loopexit:                                    ; preds = %bb10
  br label %bb51

bb51.loopexit1:                                   ; preds = %bb35
  br label %bb51

bb51:                                             ; preds = %bb51.loopexit1, %bb51.loopexit, %bb.bb51_crit_edge
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
  br i1 %i12, label %bb13, label %bb.bb840_crit_edge

bb.bb840_crit_edge:                               ; preds = %bb
  br label %bb840

bb13:                                             ; preds = %bb
  %i14 = add i32 %arg5, -5
  %i15 = icmp sgt i32 %arg5, 10
  %i16 = add nsw i32 %arg5, -3
  %i17 = sext i32 %i16 to i64
  %i18 = sext i32 %i14 to i64
  %i19 = add nsw i32 %arg5, -6
  %i20 = sext i32 %i19 to i64
  br i1 %i15, label %bb21, label %bb13.bb840_crit_edge

bb13.bb840_crit_edge:                             ; preds = %bb13
  br label %bb840

bb21:                                             ; preds = %bb13
  %i22 = zext nneg i32 %arg5 to i64
  %i23 = zext nneg i32 %i11 to i64
  %i24 = zext i32 %i14 to i64
  br label %bb25

bb25:                                             ; preds = %bb580.bb25_crit_edge, %bb21
  %i26 = phi i64 [ 5, %bb21 ], [ %i581, %bb580.bb25_crit_edge ]
  %i27 = add nsw i64 %i26, -3
  %i28 = mul nsw i64 %i27, %i22
  %i29 = getelementptr inbounds i8, ptr %arg, i64 %i28
  %i30 = trunc i64 %i26 to i32
  %i31 = mul i32 %i30, %arg5
  %i32 = zext i32 %i31 to i64
  %i33 = trunc i64 %i26 to i32
  %i34 = trunc i64 %i26 to i32
  br label %bb35

bb35:                                             ; preds = %bb577.bb35_crit_edge, %bb25
  %i36 = phi i64 [ 5, %bb25 ], [ %i578, %bb577.bb35_crit_edge ]
  %i37 = getelementptr inbounds i8, ptr %i29, i64 %i36
  %i38 = getelementptr inbounds i8, ptr %i37, i64 -1
  %i39 = add nuw nsw i64 %i36, %i32
  %i40 = getelementptr inbounds i8, ptr %arg, i64 %i39
  %i41 = load i8, ptr %i40, align 1, !tbaa !21
  %i42 = zext i8 %i41 to i64
  %i43 = getelementptr inbounds i8, ptr %arg2, i64 %i42
  %i44 = load i8, ptr %i38, align 1, !tbaa !21
  %i45 = zext i8 %i44 to i64
  %i46 = sub nsw i64 0, %i45
  %i47 = getelementptr inbounds i8, ptr %i43, i64 %i46
  %i48 = load i8, ptr %i47, align 1, !tbaa !21
  %i49 = zext i8 %i48 to i32
  %i50 = add nuw nsw i32 %i49, 100
  %i51 = getelementptr inbounds i8, ptr %i37, i64 1
  %i52 = load i8, ptr %i37, align 1, !tbaa !21
  %i53 = zext i8 %i52 to i64
  %i54 = sub nsw i64 0, %i53
  %i55 = getelementptr inbounds i8, ptr %i43, i64 %i54
  %i56 = load i8, ptr %i55, align 1, !tbaa !21
  %i57 = zext i8 %i56 to i32
  %i58 = add nuw nsw i32 %i50, %i57
  %i59 = load i8, ptr %i51, align 1, !tbaa !21
  %i60 = zext i8 %i59 to i64
  %i61 = sub nsw i64 0, %i60
  %i62 = getelementptr inbounds i8, ptr %i43, i64 %i61
  %i63 = load i8, ptr %i62, align 1, !tbaa !21
  %i64 = zext i8 %i63 to i32
  %i65 = add nuw nsw i32 %i58, %i64
  %i66 = getelementptr inbounds i8, ptr %i51, i64 %i17
  %i67 = getelementptr inbounds i8, ptr %i66, i64 1
  %i68 = load i8, ptr %i66, align 1, !tbaa !21
  %i69 = zext i8 %i68 to i64
  %i70 = sub nsw i64 0, %i69
  %i71 = getelementptr inbounds i8, ptr %i43, i64 %i70
  %i72 = load i8, ptr %i71, align 1, !tbaa !21
  %i73 = zext i8 %i72 to i32
  %i74 = add nuw nsw i32 %i65, %i73
  %i75 = getelementptr inbounds i8, ptr %i66, i64 2
  %i76 = load i8, ptr %i67, align 1, !tbaa !21
  %i77 = zext i8 %i76 to i64
  %i78 = sub nsw i64 0, %i77
  %i79 = getelementptr inbounds i8, ptr %i43, i64 %i78
  %i80 = load i8, ptr %i79, align 1, !tbaa !21
  %i81 = zext i8 %i80 to i32
  %i82 = add nuw nsw i32 %i74, %i81
  %i83 = getelementptr inbounds i8, ptr %i66, i64 3
  %i84 = load i8, ptr %i75, align 1, !tbaa !21
  %i85 = zext i8 %i84 to i64
  %i86 = sub nsw i64 0, %i85
  %i87 = getelementptr inbounds i8, ptr %i43, i64 %i86
  %i88 = load i8, ptr %i87, align 1, !tbaa !21
  %i89 = zext i8 %i88 to i32
  %i90 = add nuw nsw i32 %i82, %i89
  %i91 = getelementptr inbounds i8, ptr %i66, i64 4
  %i92 = load i8, ptr %i83, align 1, !tbaa !21
  %i93 = zext i8 %i92 to i64
  %i94 = sub nsw i64 0, %i93
  %i95 = getelementptr inbounds i8, ptr %i43, i64 %i94
  %i96 = load i8, ptr %i95, align 1, !tbaa !21
  %i97 = zext i8 %i96 to i32
  %i98 = add nuw nsw i32 %i90, %i97
  %i99 = load i8, ptr %i91, align 1, !tbaa !21
  %i100 = zext i8 %i99 to i64
  %i101 = sub nsw i64 0, %i100
  %i102 = getelementptr inbounds i8, ptr %i43, i64 %i101
  %i103 = load i8, ptr %i102, align 1, !tbaa !21
  %i104 = zext i8 %i103 to i32
  %i105 = add nuw nsw i32 %i98, %i104
  %i106 = getelementptr inbounds i8, ptr %i91, i64 %i18
  %i107 = getelementptr inbounds i8, ptr %i106, i64 1
  %i108 = load i8, ptr %i106, align 1, !tbaa !21
  %i109 = zext i8 %i108 to i64
  %i110 = sub nsw i64 0, %i109
  %i111 = getelementptr inbounds i8, ptr %i43, i64 %i110
  %i112 = load i8, ptr %i111, align 1, !tbaa !21
  %i113 = zext i8 %i112 to i32
  %i114 = add nuw nsw i32 %i105, %i113
  %i115 = getelementptr inbounds i8, ptr %i106, i64 2
  %i116 = load i8, ptr %i107, align 1, !tbaa !21
  %i117 = zext i8 %i116 to i64
  %i118 = sub nsw i64 0, %i117
  %i119 = getelementptr inbounds i8, ptr %i43, i64 %i118
  %i120 = load i8, ptr %i119, align 1, !tbaa !21
  %i121 = zext i8 %i120 to i32
  %i122 = add nuw nsw i32 %i114, %i121
  %i123 = getelementptr inbounds i8, ptr %i106, i64 3
  %i124 = load i8, ptr %i115, align 1, !tbaa !21
  %i125 = zext i8 %i124 to i64
  %i126 = sub nsw i64 0, %i125
  %i127 = getelementptr inbounds i8, ptr %i43, i64 %i126
  %i128 = load i8, ptr %i127, align 1, !tbaa !21
  %i129 = zext i8 %i128 to i32
  %i130 = add nuw nsw i32 %i122, %i129
  %i131 = getelementptr inbounds i8, ptr %i106, i64 4
  %i132 = load i8, ptr %i123, align 1, !tbaa !21
  %i133 = zext i8 %i132 to i64
  %i134 = sub nsw i64 0, %i133
  %i135 = getelementptr inbounds i8, ptr %i43, i64 %i134
  %i136 = load i8, ptr %i135, align 1, !tbaa !21
  %i137 = zext i8 %i136 to i32
  %i138 = add nuw nsw i32 %i130, %i137
  %i139 = getelementptr inbounds i8, ptr %i106, i64 5
  %i140 = load i8, ptr %i131, align 1, !tbaa !21
  %i141 = zext i8 %i140 to i64
  %i142 = sub nsw i64 0, %i141
  %i143 = getelementptr inbounds i8, ptr %i43, i64 %i142
  %i144 = load i8, ptr %i143, align 1, !tbaa !21
  %i145 = zext i8 %i144 to i32
  %i146 = add nuw nsw i32 %i138, %i145
  %i147 = getelementptr inbounds i8, ptr %i106, i64 6
  %i148 = load i8, ptr %i139, align 1, !tbaa !21
  %i149 = zext i8 %i148 to i64
  %i150 = sub nsw i64 0, %i149
  %i151 = getelementptr inbounds i8, ptr %i43, i64 %i150
  %i152 = load i8, ptr %i151, align 1, !tbaa !21
  %i153 = zext i8 %i152 to i32
  %i154 = add nuw nsw i32 %i146, %i153
  %i155 = load i8, ptr %i147, align 1, !tbaa !21
  %i156 = zext i8 %i155 to i64
  %i157 = sub nsw i64 0, %i156
  %i158 = getelementptr inbounds i8, ptr %i43, i64 %i157
  %i159 = load i8, ptr %i158, align 1, !tbaa !21
  %i160 = zext i8 %i159 to i32
  %i161 = add nuw nsw i32 %i154, %i160
  %i162 = getelementptr inbounds i8, ptr %i147, i64 %i20
  %i163 = getelementptr inbounds i8, ptr %i162, i64 1
  %i164 = load i8, ptr %i162, align 1, !tbaa !21
  %i165 = zext i8 %i164 to i64
  %i166 = sub nsw i64 0, %i165
  %i167 = getelementptr inbounds i8, ptr %i43, i64 %i166
  %i168 = load i8, ptr %i167, align 1, !tbaa !21
  %i169 = zext i8 %i168 to i32
  %i170 = add nuw nsw i32 %i161, %i169
  %i171 = getelementptr inbounds i8, ptr %i162, i64 2
  %i172 = load i8, ptr %i163, align 1, !tbaa !21
  %i173 = zext i8 %i172 to i64
  %i174 = sub nsw i64 0, %i173
  %i175 = getelementptr inbounds i8, ptr %i43, i64 %i174
  %i176 = load i8, ptr %i175, align 1, !tbaa !21
  %i177 = zext i8 %i176 to i32
  %i178 = add nuw nsw i32 %i170, %i177
  %i179 = load i8, ptr %i171, align 1, !tbaa !21
  %i180 = zext i8 %i179 to i64
  %i181 = sub nsw i64 0, %i180
  %i182 = getelementptr inbounds i8, ptr %i43, i64 %i181
  %i183 = load i8, ptr %i182, align 1, !tbaa !21
  %i184 = zext i8 %i183 to i32
  %i185 = add nuw nsw i32 %i178, %i184
  %i186 = icmp slt i32 %i185, %arg3
  br i1 %i186, label %bb187, label %bb35.bb577_crit_edge

bb35.bb577_crit_edge:                             ; preds = %bb35
  br label %bb577

bb187:                                            ; preds = %bb35
  %i188 = getelementptr inbounds i8, ptr %i162, i64 4
  %i189 = load i8, ptr %i188, align 1, !tbaa !21
  %i190 = zext i8 %i189 to i64
  %i191 = sub nsw i64 0, %i190
  %i192 = getelementptr inbounds i8, ptr %i43, i64 %i191
  %i193 = load i8, ptr %i192, align 1, !tbaa !21
  %i194 = zext i8 %i193 to i32
  %i195 = add nuw nsw i32 %i185, %i194
  %i196 = icmp ult i32 %i195, %arg3
  br i1 %i196, label %bb197, label %bb187.bb577_crit_edge

bb187.bb577_crit_edge:                            ; preds = %bb187
  br label %bb577

bb197:                                            ; preds = %bb187
  %i198 = getelementptr inbounds i8, ptr %i162, i64 5
  %i199 = getelementptr inbounds i8, ptr %i162, i64 6
  %i200 = load i8, ptr %i198, align 1, !tbaa !21
  %i201 = zext i8 %i200 to i64
  %i202 = sub nsw i64 0, %i201
  %i203 = getelementptr inbounds i8, ptr %i43, i64 %i202
  %i204 = load i8, ptr %i203, align 1, !tbaa !21
  %i205 = zext i8 %i204 to i32
  %i206 = add nuw nsw i32 %i195, %i205
  %i207 = icmp ult i32 %i206, %arg3
  br i1 %i207, label %bb208, label %bb197.bb577_crit_edge

bb197.bb577_crit_edge:                            ; preds = %bb197
  br label %bb577

bb208:                                            ; preds = %bb197
  %i209 = load i8, ptr %i199, align 1, !tbaa !21
  %i210 = zext i8 %i209 to i64
  %i211 = sub nsw i64 0, %i210
  %i212 = getelementptr inbounds i8, ptr %i43, i64 %i211
  %i213 = load i8, ptr %i212, align 1, !tbaa !21
  %i214 = zext i8 %i213 to i32
  %i215 = add nuw nsw i32 %i206, %i214
  %i216 = icmp ult i32 %i215, %arg3
  br i1 %i216, label %bb217, label %bb208.bb577_crit_edge

bb208.bb577_crit_edge:                            ; preds = %bb208
  br label %bb577

bb217:                                            ; preds = %bb208
  %i218 = getelementptr inbounds i8, ptr %i199, i64 %i20
  %i219 = load i8, ptr %i218, align 1, !tbaa !21
  %i220 = zext i8 %i219 to i64
  %i221 = sub nsw i64 0, %i220
  %i222 = getelementptr inbounds i8, ptr %i43, i64 %i221
  %i223 = load i8, ptr %i222, align 1, !tbaa !21
  %i224 = zext i8 %i223 to i32
  %i225 = add nuw nsw i32 %i215, %i224
  %i226 = icmp ult i32 %i225, %arg3
  br i1 %i226, label %bb227, label %bb217.bb577_crit_edge

bb217.bb577_crit_edge:                            ; preds = %bb217
  br label %bb577

bb227:                                            ; preds = %bb217
  %i228 = getelementptr inbounds i8, ptr %i218, i64 1
  %i229 = load i8, ptr %i228, align 1, !tbaa !21
  %i230 = zext i8 %i229 to i64
  %i231 = sub nsw i64 0, %i230
  %i232 = getelementptr inbounds i8, ptr %i43, i64 %i231
  %i233 = load i8, ptr %i232, align 1, !tbaa !21
  %i234 = zext i8 %i233 to i32
  %i235 = add nuw nsw i32 %i225, %i234
  %i236 = icmp ult i32 %i235, %arg3
  br i1 %i236, label %bb237, label %bb227.bb577_crit_edge

bb227.bb577_crit_edge:                            ; preds = %bb227
  br label %bb577

bb237:                                            ; preds = %bb227
  %i238 = getelementptr inbounds i8, ptr %i218, i64 2
  %i239 = load i8, ptr %i238, align 1, !tbaa !21
  %i240 = zext i8 %i239 to i64
  %i241 = sub nsw i64 0, %i240
  %i242 = getelementptr inbounds i8, ptr %i43, i64 %i241
  %i243 = load i8, ptr %i242, align 1, !tbaa !21
  %i244 = zext i8 %i243 to i32
  %i245 = add nuw nsw i32 %i235, %i244
  %i246 = icmp ult i32 %i245, %arg3
  br i1 %i246, label %bb247, label %bb237.bb577_crit_edge

bb237.bb577_crit_edge:                            ; preds = %bb237
  br label %bb577

bb247:                                            ; preds = %bb237
  %i248 = getelementptr inbounds i8, ptr %i218, i64 3
  %i249 = load i8, ptr %i248, align 1, !tbaa !21
  %i250 = zext i8 %i249 to i64
  %i251 = sub nsw i64 0, %i250
  %i252 = getelementptr inbounds i8, ptr %i43, i64 %i251
  %i253 = load i8, ptr %i252, align 1, !tbaa !21
  %i254 = zext i8 %i253 to i32
  %i255 = add nuw nsw i32 %i245, %i254
  %i256 = icmp ult i32 %i255, %arg3
  br i1 %i256, label %bb257, label %bb247.bb577_crit_edge

bb247.bb577_crit_edge:                            ; preds = %bb247
  br label %bb577

bb257:                                            ; preds = %bb247
  %i258 = getelementptr inbounds i8, ptr %i218, i64 4
  %i259 = load i8, ptr %i258, align 1, !tbaa !21
  %i260 = zext i8 %i259 to i64
  %i261 = sub nsw i64 0, %i260
  %i262 = getelementptr inbounds i8, ptr %i43, i64 %i261
  %i263 = load i8, ptr %i262, align 1, !tbaa !21
  %i264 = zext i8 %i263 to i32
  %i265 = add nuw nsw i32 %i255, %i264
  %i266 = icmp ult i32 %i265, %arg3
  br i1 %i266, label %bb267, label %bb257.bb577_crit_edge

bb257.bb577_crit_edge:                            ; preds = %bb257
  br label %bb577

bb267:                                            ; preds = %bb257
  %i268 = getelementptr inbounds i8, ptr %i218, i64 5
  %i269 = getelementptr inbounds i8, ptr %i218, i64 6
  %i270 = load i8, ptr %i268, align 1, !tbaa !21
  %i271 = zext i8 %i270 to i64
  %i272 = sub nsw i64 0, %i271
  %i273 = getelementptr inbounds i8, ptr %i43, i64 %i272
  %i274 = load i8, ptr %i273, align 1, !tbaa !21
  %i275 = zext i8 %i274 to i32
  %i276 = add nuw nsw i32 %i265, %i275
  %i277 = icmp ult i32 %i276, %arg3
  br i1 %i277, label %bb278, label %bb267.bb577_crit_edge

bb267.bb577_crit_edge:                            ; preds = %bb267
  br label %bb577

bb278:                                            ; preds = %bb267
  %i279 = load i8, ptr %i269, align 1, !tbaa !21
  %i280 = zext i8 %i279 to i64
  %i281 = sub nsw i64 0, %i280
  %i282 = getelementptr inbounds i8, ptr %i43, i64 %i281
  %i283 = load i8, ptr %i282, align 1, !tbaa !21
  %i284 = zext i8 %i283 to i32
  %i285 = add nuw nsw i32 %i276, %i284
  %i286 = icmp ult i32 %i285, %arg3
  br i1 %i286, label %bb287, label %bb278.bb577_crit_edge

bb278.bb577_crit_edge:                            ; preds = %bb278
  br label %bb577

bb287:                                            ; preds = %bb278
  %i288 = getelementptr inbounds i8, ptr %i269, i64 %i18
  %i289 = load i8, ptr %i288, align 1, !tbaa !21
  %i290 = zext i8 %i289 to i64
  %i291 = sub nsw i64 0, %i290
  %i292 = getelementptr inbounds i8, ptr %i43, i64 %i291
  %i293 = load i8, ptr %i292, align 1, !tbaa !21
  %i294 = zext i8 %i293 to i32
  %i295 = add nuw nsw i32 %i285, %i294
  %i296 = icmp ult i32 %i295, %arg3
  br i1 %i296, label %bb297, label %bb287.bb577_crit_edge

bb287.bb577_crit_edge:                            ; preds = %bb287
  br label %bb577

bb297:                                            ; preds = %bb287
  %i298 = getelementptr inbounds i8, ptr %i288, i64 1
  %i299 = load i8, ptr %i298, align 1, !tbaa !21
  %i300 = zext i8 %i299 to i64
  %i301 = sub nsw i64 0, %i300
  %i302 = getelementptr inbounds i8, ptr %i43, i64 %i301
  %i303 = load i8, ptr %i302, align 1, !tbaa !21
  %i304 = zext i8 %i303 to i32
  %i305 = add nuw nsw i32 %i295, %i304
  %i306 = icmp ult i32 %i305, %arg3
  br i1 %i306, label %bb307, label %bb297.bb577_crit_edge

bb297.bb577_crit_edge:                            ; preds = %bb297
  br label %bb577

bb307:                                            ; preds = %bb297
  %i308 = getelementptr inbounds i8, ptr %i288, i64 2
  %i309 = load i8, ptr %i308, align 1, !tbaa !21
  %i310 = zext i8 %i309 to i64
  %i311 = sub nsw i64 0, %i310
  %i312 = getelementptr inbounds i8, ptr %i43, i64 %i311
  %i313 = load i8, ptr %i312, align 1, !tbaa !21
  %i314 = zext i8 %i313 to i32
  %i315 = add nuw nsw i32 %i305, %i314
  %i316 = icmp ult i32 %i315, %arg3
  br i1 %i316, label %bb317, label %bb307.bb577_crit_edge

bb307.bb577_crit_edge:                            ; preds = %bb307
  br label %bb577

bb317:                                            ; preds = %bb307
  %i318 = getelementptr inbounds i8, ptr %i288, i64 3
  %i319 = getelementptr inbounds i8, ptr %i288, i64 4
  %i320 = load i8, ptr %i318, align 1, !tbaa !21
  %i321 = zext i8 %i320 to i64
  %i322 = sub nsw i64 0, %i321
  %i323 = getelementptr inbounds i8, ptr %i43, i64 %i322
  %i324 = load i8, ptr %i323, align 1, !tbaa !21
  %i325 = zext i8 %i324 to i32
  %i326 = add nuw nsw i32 %i315, %i325
  %i327 = icmp ult i32 %i326, %arg3
  br i1 %i327, label %bb328, label %bb317.bb577_crit_edge

bb317.bb577_crit_edge:                            ; preds = %bb317
  br label %bb577

bb328:                                            ; preds = %bb317
  %i329 = load i8, ptr %i319, align 1, !tbaa !21
  %i330 = zext i8 %i329 to i64
  %i331 = sub nsw i64 0, %i330
  %i332 = getelementptr inbounds i8, ptr %i43, i64 %i331
  %i333 = load i8, ptr %i332, align 1, !tbaa !21
  %i334 = zext i8 %i333 to i32
  %i335 = add nuw nsw i32 %i326, %i334
  %i336 = icmp ult i32 %i335, %arg3
  br i1 %i336, label %bb337, label %bb328.bb577_crit_edge

bb328.bb577_crit_edge:                            ; preds = %bb328
  br label %bb577

bb337:                                            ; preds = %bb328
  %i338 = getelementptr inbounds i8, ptr %i319, i64 %i17
  %i339 = load i8, ptr %i338, align 1, !tbaa !21
  %i340 = zext i8 %i339 to i64
  %i341 = sub nsw i64 0, %i340
  %i342 = getelementptr inbounds i8, ptr %i43, i64 %i341
  %i343 = load i8, ptr %i342, align 1, !tbaa !21
  %i344 = zext i8 %i343 to i32
  %i345 = add nuw nsw i32 %i335, %i344
  %i346 = icmp ult i32 %i345, %arg3
  br i1 %i346, label %bb347, label %bb337.bb577_crit_edge

bb337.bb577_crit_edge:                            ; preds = %bb337
  br label %bb577

bb347:                                            ; preds = %bb337
  %i348 = getelementptr inbounds i8, ptr %i338, i64 1
  %i349 = load i8, ptr %i348, align 1, !tbaa !21
  %i350 = zext i8 %i349 to i64
  %i351 = sub nsw i64 0, %i350
  %i352 = getelementptr inbounds i8, ptr %i43, i64 %i351
  %i353 = load i8, ptr %i352, align 1, !tbaa !21
  %i354 = zext i8 %i353 to i32
  %i355 = add nuw nsw i32 %i345, %i354
  %i356 = icmp ult i32 %i355, %arg3
  br i1 %i356, label %bb357, label %bb347.bb577_crit_edge

bb347.bb577_crit_edge:                            ; preds = %bb347
  br label %bb577

bb357:                                            ; preds = %bb347
  %i358 = getelementptr inbounds i8, ptr %i338, i64 2
  %i359 = load i8, ptr %i358, align 1, !tbaa !21
  %i360 = zext i8 %i359 to i64
  %i361 = sub nsw i64 0, %i360
  %i362 = getelementptr inbounds i8, ptr %i43, i64 %i361
  %i363 = load i8, ptr %i362, align 1, !tbaa !21
  %i364 = zext i8 %i363 to i32
  %i365 = add nuw nsw i32 %i355, %i364
  %i366 = icmp ult i32 %i365, %arg3
  br i1 %i366, label %bb367, label %bb357.bb577_crit_edge

bb357.bb577_crit_edge:                            ; preds = %bb357
  br label %bb577

bb367:                                            ; preds = %bb357
  %i368 = add nuw nsw i32 %i57, %i49
  %i369 = add nuw nsw i32 %i368, %i64
  %i370 = add nuw nsw i32 %i81, %i73
  %i371 = add nuw nsw i32 %i370, %i89
  %i372 = add nuw nsw i32 %i371, %i97
  %i373 = add nuw nsw i32 %i372, %i104
  %i374 = shl nuw nsw i32 %i294, 1
  %i375 = shl nuw nsw i32 %i334, 1
  %i376 = add nuw nsw i32 %i113, %i169
  %i377 = add nuw nsw i32 %i160, %i214
  %i378 = add nuw nsw i32 %i376, %i224
  %i379 = sub nsw i32 %i377, %i378
  %i380 = add nsw i32 %i379, %i284
  %i381 = mul nsw i32 %i380, 3
  %i382 = add nuw nsw i32 %i73, %i121
  %i383 = add nuw nsw i32 %i104, %i153
  %i384 = add nuw nsw i32 %i382, %i177
  %i385 = add nuw nsw i32 %i383, %i205
  %i386 = add nuw nsw i32 %i384, %i234
  %i387 = sub nsw i32 %i385, %i386
  %i388 = add nsw i32 %i387, %i275
  %i389 = shl nsw i32 %i388, 1
  %i390 = add nuw nsw i32 %i49, %i81
  %i391 = add nuw nsw i32 %i64, %i97
  %i392 = add nuw nsw i32 %i390, %i129
  %i393 = add nuw nsw i32 %i391, %i145
  %i394 = add nuw nsw i32 %i392, %i184
  %i395 = add nuw nsw i32 %i393, %i194
  %i396 = add nuw nsw i32 %i394, %i244
  %i397 = sub nsw i32 %i395, %i396
  %i398 = add nsw i32 %i397, %i264
  %i399 = add i32 %i398, %i389
  %i400 = add i32 %i399, %i381
  %i401 = add nuw nsw i32 %i374, %i304
  %i402 = sub i32 %i400, %i401
  %i403 = add i32 %i402, %i325
  %i404 = add i32 %i403, %i375
  %i405 = sub i32 %i404, %i344
  %i406 = add i32 %i405, %i364
  %i407 = sub nsw i32 %i344, %i369
  %i408 = add nsw i32 %i407, %i354
  %i409 = add nsw i32 %i408, %i364
  %i410 = mul nsw i32 %i409, 3
  %i411 = sub nsw i32 %i304, %i373
  %i412 = add nsw i32 %i411, %i314
  %i413 = add nsw i32 %i412, %i325
  %i414 = shl nsw i32 %i413, 1
  %i415 = add nuw nsw i32 %i121, %i113
  %i416 = add nuw nsw i32 %i415, %i129
  %i417 = add nuw nsw i32 %i416, %i137
  %i418 = add nuw nsw i32 %i417, %i145
  %i419 = add nuw nsw i32 %i418, %i153
  %i420 = add nuw nsw i32 %i419, %i160
  %i421 = sub nsw i32 %i224, %i420
  %i422 = add nsw i32 %i421, %i234
  %i423 = add nsw i32 %i422, %i244
  %i424 = add nsw i32 %i423, %i254
  %i425 = add nsw i32 %i424, %i264
  %i426 = add nsw i32 %i425, %i275
  %i427 = add nsw i32 %i426, %i284
  %i428 = add nsw i32 %i427, %i374
  %i429 = add i32 %i428, %i414
  %i430 = add i32 %i429, %i375
  %i431 = add i32 %i430, %i410
  %i432 = mul nsw i32 %i406, %i406
  %i433 = mul nsw i32 %i431, %i431
  %i434 = add nuw nsw i32 %i433, %i432
  %i435 = mul nuw nsw i32 %i365, %i365
  %i436 = lshr i32 %i435, 1
  %i437 = icmp ugt i32 %i434, %i436
  br i1 %i437, label %bb438, label %bb367.bb577_crit_edge

bb367.bb577_crit_edge:                            ; preds = %bb367
  br label %bb577

bb438:                                            ; preds = %bb367
  %i439 = icmp ult i32 %i433, %i432
  %i440 = trunc i64 %i36 to i32
  br i1 %i439, label %bb498, label %bb441

bb441:                                            ; preds = %bb438
  %i442 = sitofp i32 %i406 to float
  %i443 = tail call i32 @llvm.abs.i32(i32 %i431, i1 true)
  %i444 = sitofp i32 %i443 to float
  %i445 = fdiv float %i442, %i444
  %i446 = trunc i32 %i443 to i16
  %i447 = trunc i32 %i431 to i16
  %i448 = sdiv i16 %i446, %i447
  %i449 = sext i16 %i448 to i32
  %i450 = add nsw i32 %i33, %i449
  %i451 = mul nsw i32 %i450, %arg5
  %i452 = fcmp olt float %i445, 0.000000e+00
  %i453 = fpext float %i445 to double
  %i454 = select i1 %i452, double -5.000000e-01, double 5.000000e-01
  %i455 = fadd double %i454, %i453
  %i456 = fptosi double %i455 to i32
  %i457 = add i32 %i440, %i456
  %i458 = add i32 %i457, %i451
  %i459 = sext i32 %i458 to i64
  %i460 = getelementptr inbounds i8, ptr %arg, i64 %i459
  %i461 = load i8, ptr %i460, align 1, !tbaa !21
  %i462 = zext i8 %i461 to i64
  %i463 = sub nsw i64 0, %i462
  %i464 = getelementptr inbounds i8, ptr %i43, i64 %i463
  %i465 = load i8, ptr %i464, align 1, !tbaa !21
  %i466 = zext i8 %i465 to i32
  %i467 = shl nsw i32 %i449, 1
  %i468 = add nsw i32 %i467, %i33
  %i469 = mul nsw i32 %i468, %arg5
  %i470 = fmul float %i445, 2.000000e+00
  %i471 = fcmp olt float %i470, 0.000000e+00
  %i472 = fpext float %i470 to double
  %i473 = select i1 %i471, double -5.000000e-01, double 5.000000e-01
  %i474 = fadd double %i473, %i472
  %i475 = fptosi double %i474 to i32
  %i476 = add i32 %i440, %i475
  %i477 = add i32 %i476, %i469
  %i478 = sext i32 %i477 to i64
  %i479 = getelementptr inbounds i8, ptr %arg, i64 %i478
  %i480 = load i8, ptr %i479, align 1, !tbaa !21
  %i481 = zext i8 %i480 to i64
  %i482 = sub nsw i64 0, %i481
  %i483 = getelementptr inbounds i8, ptr %i43, i64 %i482
  %i484 = load i8, ptr %i483, align 1, !tbaa !21
  %i485 = zext i8 %i484 to i32
  %i486 = add nuw nsw i32 %i485, %i466
  %i487 = mul nsw i32 %i449, 3
  %i488 = add nsw i32 %i487, %i33
  %i489 = mul nsw i32 %i488, %arg5
  %i490 = fmul float %i445, 3.000000e+00
  %i491 = fcmp olt float %i490, 0.000000e+00
  %i492 = fpext float %i490 to double
  %i493 = select i1 %i491, double -5.000000e-01, double 5.000000e-01
  %i494 = fadd double %i493, %i492
  %i495 = fptosi double %i494 to i32
  %i496 = add i32 %i440, %i495
  %i497 = add i32 %i496, %i489
  br label %bb555

bb498:                                            ; preds = %bb438
  %i499 = sitofp i32 %i431 to float
  %i500 = tail call i32 @llvm.abs.i32(i32 %i406, i1 true)
  %i501 = sitofp i32 %i500 to float
  %i502 = fdiv float %i499, %i501
  %i503 = trunc i32 %i500 to i16
  %i504 = trunc i32 %i406 to i16
  %i505 = sdiv i16 %i503, %i504
  %i506 = sext i16 %i505 to i32
  %i507 = fcmp olt float %i502, 0.000000e+00
  %i508 = fpext float %i502 to double
  %i509 = select i1 %i507, double -5.000000e-01, double 5.000000e-01
  %i510 = fadd double %i509, %i508
  %i511 = fptosi double %i510 to i32
  %i512 = add nsw i32 %i34, %i511
  %i513 = mul nsw i32 %i512, %arg5
  %i514 = add nsw i32 %i513, %i440
  %i515 = add nsw i32 %i514, %i506
  %i516 = sext i32 %i515 to i64
  %i517 = getelementptr inbounds i8, ptr %arg, i64 %i516
  %i518 = load i8, ptr %i517, align 1, !tbaa !21
  %i519 = zext i8 %i518 to i64
  %i520 = sub nsw i64 0, %i519
  %i521 = getelementptr inbounds i8, ptr %i43, i64 %i520
  %i522 = load i8, ptr %i521, align 1, !tbaa !21
  %i523 = zext i8 %i522 to i32
  %i524 = fmul float %i502, 2.000000e+00
  %i525 = fcmp olt float %i524, 0.000000e+00
  %i526 = fpext float %i524 to double
  %i527 = select i1 %i525, double -5.000000e-01, double 5.000000e-01
  %i528 = fadd double %i527, %i526
  %i529 = fptosi double %i528 to i32
  %i530 = add nsw i32 %i34, %i529
  %i531 = mul nsw i32 %i530, %arg5
  %i532 = add nsw i32 %i531, %i440
  %i533 = shl nsw i32 %i506, 1
  %i534 = add nsw i32 %i532, %i533
  %i535 = sext i32 %i534 to i64
  %i536 = getelementptr inbounds i8, ptr %arg, i64 %i535
  %i537 = load i8, ptr %i536, align 1, !tbaa !21
  %i538 = zext i8 %i537 to i64
  %i539 = sub nsw i64 0, %i538
  %i540 = getelementptr inbounds i8, ptr %i43, i64 %i539
  %i541 = load i8, ptr %i540, align 1, !tbaa !21
  %i542 = zext i8 %i541 to i32
  %i543 = add nuw nsw i32 %i542, %i523
  %i544 = fmul float %i502, 3.000000e+00
  %i545 = fcmp olt float %i544, 0.000000e+00
  %i546 = fpext float %i544 to double
  %i547 = select i1 %i545, double -5.000000e-01, double 5.000000e-01
  %i548 = fadd double %i547, %i546
  %i549 = fptosi double %i548 to i32
  %i550 = add nsw i32 %i34, %i549
  %i551 = mul nsw i32 %i550, %arg5
  %i552 = add nsw i32 %i551, %i440
  %i553 = mul nsw i32 %i506, 3
  %i554 = add nsw i32 %i552, %i553
  br label %bb555

bb555:                                            ; preds = %bb498, %bb441
  %i556 = phi i32 [ %i554, %bb498 ], [ %i497, %bb441 ]
  %i557 = phi i32 [ %i543, %bb498 ], [ %i486, %bb441 ]
  %i558 = sext i32 %i556 to i64
  %i559 = getelementptr inbounds i8, ptr %arg, i64 %i558
  %i560 = load i8, ptr %i559, align 1, !tbaa !21
  %i561 = zext i8 %i560 to i64
  %i562 = sub nsw i64 0, %i561
  %i563 = getelementptr inbounds i8, ptr %i43, i64 %i562
  %i564 = load i8, ptr %i563, align 1, !tbaa !21
  %i565 = zext i8 %i564 to i32
  %i566 = add nuw nsw i32 %i557, %i565
  %i567 = icmp ugt i32 %i566, 290
  br i1 %i567, label %bb568, label %bb555.bb577_crit_edge

bb555.bb577_crit_edge:                            ; preds = %bb555
  br label %bb577

bb568:                                            ; preds = %bb555
  %i569 = sub nsw i32 %arg3, %i365
  %i570 = getelementptr inbounds i32, ptr %arg1, i64 %i39
  store i32 %i569, ptr %i570, align 4, !tbaa !16
  %i571 = mul nsw i32 %i406, 51
  %i572 = sdiv i32 %i571, %i365
  %i573 = getelementptr inbounds i32, ptr %i9, i64 %i39
  store i32 %i572, ptr %i573, align 4, !tbaa !16
  %i574 = mul nsw i32 %i431, 51
  %i575 = sdiv i32 %i574, %i365
  %i576 = getelementptr inbounds i32, ptr %i10, i64 %i39
  store i32 %i575, ptr %i576, align 4, !tbaa !16
  br label %bb577

bb577:                                            ; preds = %bb568, %bb555.bb577_crit_edge, %bb367.bb577_crit_edge, %bb357.bb577_crit_edge, %bb347.bb577_crit_edge, %bb337.bb577_crit_edge, %bb328.bb577_crit_edge, %bb317.bb577_crit_edge, %bb307.bb577_crit_edge, %bb297.bb577_crit_edge, %bb287.bb577_crit_edge, %bb278.bb577_crit_edge, %bb267.bb577_crit_edge, %bb257.bb577_crit_edge, %bb247.bb577_crit_edge, %bb237.bb577_crit_edge, %bb227.bb577_crit_edge, %bb217.bb577_crit_edge, %bb208.bb577_crit_edge, %bb197.bb577_crit_edge, %bb187.bb577_crit_edge, %bb35.bb577_crit_edge
  %i578 = add nuw nsw i64 %i36, 1
  %i579 = icmp eq i64 %i578, %i24
  br i1 %i579, label %bb580, label %bb577.bb35_crit_edge, !llvm.loop !57

bb577.bb35_crit_edge:                             ; preds = %bb577
  br label %bb35

bb580:                                            ; preds = %bb577
  %i581 = add nuw nsw i64 %i26, 1
  %i582 = icmp eq i64 %i581, %i23
  br i1 %i582, label %bb583, label %bb580.bb25_crit_edge, !llvm.loop !58

bb580.bb25_crit_edge:                             ; preds = %bb580
  br label %bb25

bb583:                                            ; preds = %bb580
  br i1 %i12, label %bb584, label %bb583.bb840_crit_edge

bb583.bb840_crit_edge:                            ; preds = %bb583
  br label %bb840

bb584:                                            ; preds = %bb583
  %i585 = add nsw i32 %arg5, -5
  %i586 = zext nneg i32 %arg5 to i64
  %i587 = zext nneg i32 %i11 to i64
  %i588 = zext i32 %i585 to i64
  br label %bb589

bb589:                                            ; preds = %bb833.bb589_crit_edge, %bb584
  %i590 = phi i64 [ 5, %bb584 ], [ %i599, %bb833.bb589_crit_edge ]
  %i591 = phi i32 [ 0, %bb584 ], [ %i830, %bb833.bb589_crit_edge ]
  %i592 = mul nsw i64 %i590, %i586
  %i593 = add nsw i64 %i590, -3
  %i594 = mul nsw i64 %i593, %i586
  %i595 = add nsw i64 %i590, -2
  %i596 = mul nsw i64 %i595, %i586
  %i597 = add nsw i64 %i590, -1
  %i598 = mul nsw i64 %i597, %i586
  %i599 = add nuw nsw i64 %i590, 1
  %i600 = mul nsw i64 %i599, %i586
  %i601 = add nuw nsw i64 %i590, 2
  %i602 = mul nsw i64 %i601, %i586
  %i603 = add nuw nsw i64 %i590, 3
  %i604 = mul nsw i64 %i603, %i586
  %i605 = getelementptr i32, ptr %arg1, i64 %i594
  %i606 = getelementptr i32, ptr %arg1, i64 %i596
  %i607 = getelementptr i32, ptr %arg1, i64 %i598
  %i608 = getelementptr i32, ptr %arg1, i64 %i600
  %i609 = getelementptr i32, ptr %arg1, i64 %i602
  %i610 = getelementptr i32, ptr %arg1, i64 %i604
  %i611 = trunc i64 %i590 to i32
  br label %bb612

bb612:                                            ; preds = %bb829.bb612_crit_edge, %bb589
  %i613 = phi i64 [ 5, %bb589 ], [ %i831, %bb829.bb612_crit_edge ]
  %i614 = phi i32 [ %i591, %bb589 ], [ %i830, %bb829.bb612_crit_edge ]
  %i615 = add nuw nsw i64 %i613, %i592
  %i616 = getelementptr inbounds i32, ptr %arg1, i64 %i615
  %i617 = load i32, ptr %i616, align 4, !tbaa !16
  %i618 = icmp sgt i32 %i617, 0
  br i1 %i618, label %bb619, label %bb612.bb829_crit_edge

bb612.bb829_crit_edge:                            ; preds = %bb612
  br label %bb829

bb619:                                            ; preds = %bb612
  %i620 = getelementptr i32, ptr %i605, i64 %i613
  %i621 = getelementptr i32, ptr %i620, i64 -3
  %i622 = load i32, ptr %i621, align 4, !tbaa !16
  %i623 = icmp sgt i32 %i617, %i622
  br i1 %i623, label %bb624, label %bb619.bb829_crit_edge

bb619.bb829_crit_edge:                            ; preds = %bb619
  br label %bb829

bb624:                                            ; preds = %bb619
  %i625 = getelementptr i32, ptr %i620, i64 -2
  %i626 = load i32, ptr %i625, align 4, !tbaa !16
  %i627 = icmp sgt i32 %i617, %i626
  br i1 %i627, label %bb628, label %bb624.bb829_crit_edge

bb624.bb829_crit_edge:                            ; preds = %bb624
  br label %bb829

bb628:                                            ; preds = %bb624
  %i629 = getelementptr i32, ptr %i620, i64 -1
  %i630 = load i32, ptr %i629, align 4, !tbaa !16
  %i631 = icmp sgt i32 %i617, %i630
  br i1 %i631, label %bb632, label %bb628.bb829_crit_edge

bb628.bb829_crit_edge:                            ; preds = %bb628
  br label %bb829

bb632:                                            ; preds = %bb628
  %i633 = load i32, ptr %i620, align 4, !tbaa !16
  %i634 = icmp sgt i32 %i617, %i633
  br i1 %i634, label %bb635, label %bb632.bb829_crit_edge

bb632.bb829_crit_edge:                            ; preds = %bb632
  br label %bb829

bb635:                                            ; preds = %bb632
  %i636 = getelementptr i32, ptr %i620, i64 1
  %i637 = load i32, ptr %i636, align 4, !tbaa !16
  %i638 = icmp sgt i32 %i617, %i637
  br i1 %i638, label %bb639, label %bb635.bb829_crit_edge

bb635.bb829_crit_edge:                            ; preds = %bb635
  br label %bb829

bb639:                                            ; preds = %bb635
  %i640 = getelementptr i32, ptr %i620, i64 2
  %i641 = load i32, ptr %i640, align 4, !tbaa !16
  %i642 = icmp sgt i32 %i617, %i641
  br i1 %i642, label %bb643, label %bb639.bb829_crit_edge

bb639.bb829_crit_edge:                            ; preds = %bb639
  br label %bb829

bb643:                                            ; preds = %bb639
  %i644 = getelementptr i32, ptr %i620, i64 3
  %i645 = load i32, ptr %i644, align 4, !tbaa !16
  %i646 = icmp sgt i32 %i617, %i645
  br i1 %i646, label %bb647, label %bb643.bb829_crit_edge

bb643.bb829_crit_edge:                            ; preds = %bb643
  br label %bb829

bb647:                                            ; preds = %bb643
  %i648 = getelementptr i32, ptr %i606, i64 %i613
  %i649 = getelementptr i32, ptr %i648, i64 -3
  %i650 = load i32, ptr %i649, align 4, !tbaa !16
  %i651 = icmp sgt i32 %i617, %i650
  br i1 %i651, label %bb652, label %bb647.bb829_crit_edge

bb647.bb829_crit_edge:                            ; preds = %bb647
  br label %bb829

bb652:                                            ; preds = %bb647
  %i653 = getelementptr i32, ptr %i648, i64 -2
  %i654 = load i32, ptr %i653, align 4, !tbaa !16
  %i655 = icmp sgt i32 %i617, %i654
  br i1 %i655, label %bb656, label %bb652.bb829_crit_edge

bb652.bb829_crit_edge:                            ; preds = %bb652
  br label %bb829

bb656:                                            ; preds = %bb652
  %i657 = getelementptr i32, ptr %i648, i64 -1
  %i658 = load i32, ptr %i657, align 4, !tbaa !16
  %i659 = icmp sgt i32 %i617, %i658
  br i1 %i659, label %bb660, label %bb656.bb829_crit_edge

bb656.bb829_crit_edge:                            ; preds = %bb656
  br label %bb829

bb660:                                            ; preds = %bb656
  %i661 = load i32, ptr %i648, align 4, !tbaa !16
  %i662 = icmp sgt i32 %i617, %i661
  br i1 %i662, label %bb663, label %bb660.bb829_crit_edge

bb660.bb829_crit_edge:                            ; preds = %bb660
  br label %bb829

bb663:                                            ; preds = %bb660
  %i664 = getelementptr i32, ptr %i648, i64 1
  %i665 = load i32, ptr %i664, align 4, !tbaa !16
  %i666 = icmp sgt i32 %i617, %i665
  br i1 %i666, label %bb667, label %bb663.bb829_crit_edge

bb663.bb829_crit_edge:                            ; preds = %bb663
  br label %bb829

bb667:                                            ; preds = %bb663
  %i668 = getelementptr i32, ptr %i648, i64 2
  %i669 = load i32, ptr %i668, align 4, !tbaa !16
  %i670 = icmp sgt i32 %i617, %i669
  br i1 %i670, label %bb671, label %bb667.bb829_crit_edge

bb667.bb829_crit_edge:                            ; preds = %bb667
  br label %bb829

bb671:                                            ; preds = %bb667
  %i672 = getelementptr i32, ptr %i648, i64 3
  %i673 = load i32, ptr %i672, align 4, !tbaa !16
  %i674 = icmp sgt i32 %i617, %i673
  br i1 %i674, label %bb675, label %bb671.bb829_crit_edge

bb671.bb829_crit_edge:                            ; preds = %bb671
  br label %bb829

bb675:                                            ; preds = %bb671
  %i676 = getelementptr i32, ptr %i607, i64 %i613
  %i677 = getelementptr i32, ptr %i676, i64 -3
  %i678 = load i32, ptr %i677, align 4, !tbaa !16
  %i679 = icmp sgt i32 %i617, %i678
  br i1 %i679, label %bb680, label %bb675.bb829_crit_edge

bb675.bb829_crit_edge:                            ; preds = %bb675
  br label %bb829

bb680:                                            ; preds = %bb675
  %i681 = getelementptr i32, ptr %i676, i64 -2
  %i682 = load i32, ptr %i681, align 4, !tbaa !16
  %i683 = icmp sgt i32 %i617, %i682
  br i1 %i683, label %bb684, label %bb680.bb829_crit_edge

bb680.bb829_crit_edge:                            ; preds = %bb680
  br label %bb829

bb684:                                            ; preds = %bb680
  %i685 = getelementptr i32, ptr %i676, i64 -1
  %i686 = load i32, ptr %i685, align 4, !tbaa !16
  %i687 = icmp sgt i32 %i617, %i686
  br i1 %i687, label %bb688, label %bb684.bb829_crit_edge

bb684.bb829_crit_edge:                            ; preds = %bb684
  br label %bb829

bb688:                                            ; preds = %bb684
  %i689 = load i32, ptr %i676, align 4, !tbaa !16
  %i690 = icmp sgt i32 %i617, %i689
  br i1 %i690, label %bb691, label %bb688.bb829_crit_edge

bb688.bb829_crit_edge:                            ; preds = %bb688
  br label %bb829

bb691:                                            ; preds = %bb688
  %i692 = getelementptr i32, ptr %i676, i64 1
  %i693 = load i32, ptr %i692, align 4, !tbaa !16
  %i694 = icmp sgt i32 %i617, %i693
  br i1 %i694, label %bb695, label %bb691.bb829_crit_edge

bb691.bb829_crit_edge:                            ; preds = %bb691
  br label %bb829

bb695:                                            ; preds = %bb691
  %i696 = getelementptr i32, ptr %i676, i64 2
  %i697 = load i32, ptr %i696, align 4, !tbaa !16
  %i698 = icmp sgt i32 %i617, %i697
  br i1 %i698, label %bb699, label %bb695.bb829_crit_edge

bb695.bb829_crit_edge:                            ; preds = %bb695
  br label %bb829

bb699:                                            ; preds = %bb695
  %i700 = getelementptr i32, ptr %i676, i64 3
  %i701 = load i32, ptr %i700, align 4, !tbaa !16
  %i702 = icmp sgt i32 %i617, %i701
  br i1 %i702, label %bb703, label %bb699.bb829_crit_edge

bb699.bb829_crit_edge:                            ; preds = %bb699
  br label %bb829

bb703:                                            ; preds = %bb699
  %i704 = getelementptr i32, ptr %i616, i64 -3
  %i705 = load i32, ptr %i704, align 4, !tbaa !16
  %i706 = icmp sgt i32 %i617, %i705
  br i1 %i706, label %bb707, label %bb703.bb829_crit_edge

bb703.bb829_crit_edge:                            ; preds = %bb703
  br label %bb829

bb707:                                            ; preds = %bb703
  %i708 = getelementptr i32, ptr %i616, i64 -2
  %i709 = load i32, ptr %i708, align 4, !tbaa !16
  %i710 = icmp sgt i32 %i617, %i709
  br i1 %i710, label %bb711, label %bb707.bb829_crit_edge

bb707.bb829_crit_edge:                            ; preds = %bb707
  br label %bb829

bb711:                                            ; preds = %bb707
  %i712 = getelementptr i32, ptr %i616, i64 -1
  %i713 = load i32, ptr %i712, align 4, !tbaa !16
  %i714 = icmp sgt i32 %i617, %i713
  br i1 %i714, label %bb715, label %bb711.bb829_crit_edge

bb711.bb829_crit_edge:                            ; preds = %bb711
  br label %bb829

bb715:                                            ; preds = %bb711
  %i716 = getelementptr i32, ptr %i616, i64 1
  %i717 = load i32, ptr %i716, align 4, !tbaa !16
  %i718 = icmp slt i32 %i617, %i717
  br i1 %i718, label %bb715.bb829_crit_edge, label %bb719

bb715.bb829_crit_edge:                            ; preds = %bb715
  br label %bb829

bb719:                                            ; preds = %bb715
  %i720 = getelementptr i32, ptr %i616, i64 2
  %i721 = load i32, ptr %i720, align 4, !tbaa !16
  %i722 = icmp slt i32 %i617, %i721
  br i1 %i722, label %bb719.bb829_crit_edge, label %bb723

bb719.bb829_crit_edge:                            ; preds = %bb719
  br label %bb829

bb723:                                            ; preds = %bb719
  %i724 = getelementptr i32, ptr %i616, i64 3
  %i725 = load i32, ptr %i724, align 4, !tbaa !16
  %i726 = icmp slt i32 %i617, %i725
  br i1 %i726, label %bb723.bb829_crit_edge, label %bb727

bb723.bb829_crit_edge:                            ; preds = %bb723
  br label %bb829

bb727:                                            ; preds = %bb723
  %i728 = getelementptr i32, ptr %i608, i64 %i613
  %i729 = getelementptr i32, ptr %i728, i64 -3
  %i730 = load i32, ptr %i729, align 4, !tbaa !16
  %i731 = icmp slt i32 %i617, %i730
  br i1 %i731, label %bb727.bb829_crit_edge, label %bb732

bb727.bb829_crit_edge:                            ; preds = %bb727
  br label %bb829

bb732:                                            ; preds = %bb727
  %i733 = getelementptr i32, ptr %i728, i64 -2
  %i734 = load i32, ptr %i733, align 4, !tbaa !16
  %i735 = icmp slt i32 %i617, %i734
  br i1 %i735, label %bb732.bb829_crit_edge, label %bb736

bb732.bb829_crit_edge:                            ; preds = %bb732
  br label %bb829

bb736:                                            ; preds = %bb732
  %i737 = getelementptr i32, ptr %i728, i64 -1
  %i738 = load i32, ptr %i737, align 4, !tbaa !16
  %i739 = icmp slt i32 %i617, %i738
  br i1 %i739, label %bb736.bb829_crit_edge, label %bb740

bb736.bb829_crit_edge:                            ; preds = %bb736
  br label %bb829

bb740:                                            ; preds = %bb736
  %i741 = load i32, ptr %i728, align 4, !tbaa !16
  %i742 = icmp slt i32 %i617, %i741
  br i1 %i742, label %bb740.bb829_crit_edge, label %bb743

bb740.bb829_crit_edge:                            ; preds = %bb740
  br label %bb829

bb743:                                            ; preds = %bb740
  %i744 = getelementptr i32, ptr %i728, i64 1
  %i745 = load i32, ptr %i744, align 4, !tbaa !16
  %i746 = icmp slt i32 %i617, %i745
  br i1 %i746, label %bb743.bb829_crit_edge, label %bb747

bb743.bb829_crit_edge:                            ; preds = %bb743
  br label %bb829

bb747:                                            ; preds = %bb743
  %i748 = getelementptr i32, ptr %i728, i64 2
  %i749 = load i32, ptr %i748, align 4, !tbaa !16
  %i750 = icmp slt i32 %i617, %i749
  br i1 %i750, label %bb747.bb829_crit_edge, label %bb751

bb747.bb829_crit_edge:                            ; preds = %bb747
  br label %bb829

bb751:                                            ; preds = %bb747
  %i752 = getelementptr i32, ptr %i728, i64 3
  %i753 = load i32, ptr %i752, align 4, !tbaa !16
  %i754 = icmp slt i32 %i617, %i753
  br i1 %i754, label %bb751.bb829_crit_edge, label %bb755

bb751.bb829_crit_edge:                            ; preds = %bb751
  br label %bb829

bb755:                                            ; preds = %bb751
  %i756 = getelementptr i32, ptr %i609, i64 %i613
  %i757 = getelementptr i32, ptr %i756, i64 -3
  %i758 = load i32, ptr %i757, align 4, !tbaa !16
  %i759 = icmp slt i32 %i617, %i758
  br i1 %i759, label %bb755.bb829_crit_edge, label %bb760

bb755.bb829_crit_edge:                            ; preds = %bb755
  br label %bb829

bb760:                                            ; preds = %bb755
  %i761 = getelementptr i32, ptr %i756, i64 -2
  %i762 = load i32, ptr %i761, align 4, !tbaa !16
  %i763 = icmp slt i32 %i617, %i762
  br i1 %i763, label %bb760.bb829_crit_edge, label %bb764

bb760.bb829_crit_edge:                            ; preds = %bb760
  br label %bb829

bb764:                                            ; preds = %bb760
  %i765 = getelementptr i32, ptr %i756, i64 -1
  %i766 = load i32, ptr %i765, align 4, !tbaa !16
  %i767 = icmp slt i32 %i617, %i766
  br i1 %i767, label %bb764.bb829_crit_edge, label %bb768

bb764.bb829_crit_edge:                            ; preds = %bb764
  br label %bb829

bb768:                                            ; preds = %bb764
  %i769 = load i32, ptr %i756, align 4, !tbaa !16
  %i770 = icmp slt i32 %i617, %i769
  br i1 %i770, label %bb768.bb829_crit_edge, label %bb771

bb768.bb829_crit_edge:                            ; preds = %bb768
  br label %bb829

bb771:                                            ; preds = %bb768
  %i772 = getelementptr i32, ptr %i756, i64 1
  %i773 = load i32, ptr %i772, align 4, !tbaa !16
  %i774 = icmp slt i32 %i617, %i773
  br i1 %i774, label %bb771.bb829_crit_edge, label %bb775

bb771.bb829_crit_edge:                            ; preds = %bb771
  br label %bb829

bb775:                                            ; preds = %bb771
  %i776 = getelementptr i32, ptr %i756, i64 2
  %i777 = load i32, ptr %i776, align 4, !tbaa !16
  %i778 = icmp slt i32 %i617, %i777
  br i1 %i778, label %bb775.bb829_crit_edge, label %bb779

bb775.bb829_crit_edge:                            ; preds = %bb775
  br label %bb829

bb779:                                            ; preds = %bb775
  %i780 = getelementptr i32, ptr %i756, i64 3
  %i781 = load i32, ptr %i780, align 4, !tbaa !16
  %i782 = icmp slt i32 %i617, %i781
  br i1 %i782, label %bb779.bb829_crit_edge, label %bb783

bb779.bb829_crit_edge:                            ; preds = %bb779
  br label %bb829

bb783:                                            ; preds = %bb779
  %i784 = getelementptr i32, ptr %i610, i64 %i613
  %i785 = getelementptr i32, ptr %i784, i64 -3
  %i786 = load i32, ptr %i785, align 4, !tbaa !16
  %i787 = icmp slt i32 %i617, %i786
  br i1 %i787, label %bb783.bb829_crit_edge, label %bb788

bb783.bb829_crit_edge:                            ; preds = %bb783
  br label %bb829

bb788:                                            ; preds = %bb783
  %i789 = getelementptr i32, ptr %i784, i64 -2
  %i790 = load i32, ptr %i789, align 4, !tbaa !16
  %i791 = icmp slt i32 %i617, %i790
  br i1 %i791, label %bb788.bb829_crit_edge, label %bb792

bb788.bb829_crit_edge:                            ; preds = %bb788
  br label %bb829

bb792:                                            ; preds = %bb788
  %i793 = getelementptr i32, ptr %i784, i64 -1
  %i794 = load i32, ptr %i793, align 4, !tbaa !16
  %i795 = icmp slt i32 %i617, %i794
  br i1 %i795, label %bb792.bb829_crit_edge, label %bb796

bb792.bb829_crit_edge:                            ; preds = %bb792
  br label %bb829

bb796:                                            ; preds = %bb792
  %i797 = load i32, ptr %i784, align 4, !tbaa !16
  %i798 = icmp slt i32 %i617, %i797
  br i1 %i798, label %bb796.bb829_crit_edge, label %bb799

bb796.bb829_crit_edge:                            ; preds = %bb796
  br label %bb829

bb799:                                            ; preds = %bb796
  %i800 = getelementptr i32, ptr %i784, i64 1
  %i801 = load i32, ptr %i800, align 4, !tbaa !16
  %i802 = icmp slt i32 %i617, %i801
  br i1 %i802, label %bb799.bb829_crit_edge, label %bb803

bb799.bb829_crit_edge:                            ; preds = %bb799
  br label %bb829

bb803:                                            ; preds = %bb799
  %i804 = getelementptr i32, ptr %i784, i64 2
  %i805 = load i32, ptr %i804, align 4, !tbaa !16
  %i806 = icmp slt i32 %i617, %i805
  br i1 %i806, label %bb803.bb829_crit_edge, label %bb807

bb803.bb829_crit_edge:                            ; preds = %bb803
  br label %bb829

bb807:                                            ; preds = %bb803
  %i808 = getelementptr i32, ptr %i784, i64 3
  %i809 = load i32, ptr %i808, align 4, !tbaa !16
  %i810 = icmp slt i32 %i617, %i809
  br i1 %i810, label %bb807.bb829_crit_edge, label %bb811

bb807.bb829_crit_edge:                            ; preds = %bb807
  br label %bb829

bb811:                                            ; preds = %bb807
  %i812 = sext i32 %i614 to i64
  %i813 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i812
  %i814 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i812, i32 2
  store i32 0, ptr %i814, align 4, !tbaa !52
  %i815 = trunc i64 %i613 to i32
  store i32 %i815, ptr %i813, align 4, !tbaa !55
  %i816 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i812, i32 1
  store i32 %i611, ptr %i816, align 4, !tbaa !54
  %i817 = getelementptr inbounds i32, ptr %i9, i64 %i615
  %i818 = load i32, ptr %i817, align 4, !tbaa !16
  %i819 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i812, i32 3
  store i32 %i818, ptr %i819, align 4, !tbaa !59
  %i820 = getelementptr inbounds i32, ptr %i10, i64 %i615
  %i821 = load i32, ptr %i820, align 4, !tbaa !16
  %i822 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i812, i32 4
  store i32 %i821, ptr %i822, align 4, !tbaa !60
  %i823 = getelementptr inbounds i8, ptr %arg, i64 %i615
  %i824 = load i8, ptr %i823, align 1, !tbaa !21
  %i825 = zext i8 %i824 to i32
  %i826 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i812, i32 5
  store i32 %i825, ptr %i826, align 4, !tbaa !61
  %i827 = add nsw i32 %i614, 1
  %i828 = icmp eq i32 %i827, 15000
  br i1 %i828, label %bb835, label %bb811.bb829_crit_edge

bb811.bb829_crit_edge:                            ; preds = %bb811
  br label %bb829

bb829:                                            ; preds = %bb811.bb829_crit_edge, %bb807.bb829_crit_edge, %bb803.bb829_crit_edge, %bb799.bb829_crit_edge, %bb796.bb829_crit_edge, %bb792.bb829_crit_edge, %bb788.bb829_crit_edge, %bb783.bb829_crit_edge, %bb779.bb829_crit_edge, %bb775.bb829_crit_edge, %bb771.bb829_crit_edge, %bb768.bb829_crit_edge, %bb764.bb829_crit_edge, %bb760.bb829_crit_edge, %bb755.bb829_crit_edge, %bb751.bb829_crit_edge, %bb747.bb829_crit_edge, %bb743.bb829_crit_edge, %bb740.bb829_crit_edge, %bb736.bb829_crit_edge, %bb732.bb829_crit_edge, %bb727.bb829_crit_edge, %bb723.bb829_crit_edge, %bb719.bb829_crit_edge, %bb715.bb829_crit_edge, %bb711.bb829_crit_edge, %bb707.bb829_crit_edge, %bb703.bb829_crit_edge, %bb699.bb829_crit_edge, %bb695.bb829_crit_edge, %bb691.bb829_crit_edge, %bb688.bb829_crit_edge, %bb684.bb829_crit_edge, %bb680.bb829_crit_edge, %bb675.bb829_crit_edge, %bb671.bb829_crit_edge, %bb667.bb829_crit_edge, %bb663.bb829_crit_edge, %bb660.bb829_crit_edge, %bb656.bb829_crit_edge, %bb652.bb829_crit_edge, %bb647.bb829_crit_edge, %bb643.bb829_crit_edge, %bb639.bb829_crit_edge, %bb635.bb829_crit_edge, %bb632.bb829_crit_edge, %bb628.bb829_crit_edge, %bb624.bb829_crit_edge, %bb619.bb829_crit_edge, %bb612.bb829_crit_edge
  %i830 = phi i32 [ %i827, %bb811.bb829_crit_edge ], [ %i614, %bb807.bb829_crit_edge ], [ %i614, %bb803.bb829_crit_edge ], [ %i614, %bb799.bb829_crit_edge ], [ %i614, %bb796.bb829_crit_edge ], [ %i614, %bb792.bb829_crit_edge ], [ %i614, %bb788.bb829_crit_edge ], [ %i614, %bb783.bb829_crit_edge ], [ %i614, %bb779.bb829_crit_edge ], [ %i614, %bb775.bb829_crit_edge ], [ %i614, %bb771.bb829_crit_edge ], [ %i614, %bb768.bb829_crit_edge ], [ %i614, %bb764.bb829_crit_edge ], [ %i614, %bb760.bb829_crit_edge ], [ %i614, %bb755.bb829_crit_edge ], [ %i614, %bb751.bb829_crit_edge ], [ %i614, %bb747.bb829_crit_edge ], [ %i614, %bb743.bb829_crit_edge ], [ %i614, %bb740.bb829_crit_edge ], [ %i614, %bb736.bb829_crit_edge ], [ %i614, %bb732.bb829_crit_edge ], [ %i614, %bb727.bb829_crit_edge ], [ %i614, %bb723.bb829_crit_edge ], [ %i614, %bb719.bb829_crit_edge ], [ %i614, %bb715.bb829_crit_edge ], [ %i614, %bb711.bb829_crit_edge ], [ %i614, %bb707.bb829_crit_edge ], [ %i614, %bb703.bb829_crit_edge ], [ %i614, %bb699.bb829_crit_edge ], [ %i614, %bb695.bb829_crit_edge ], [ %i614, %bb691.bb829_crit_edge ], [ %i614, %bb688.bb829_crit_edge ], [ %i614, %bb684.bb829_crit_edge ], [ %i614, %bb680.bb829_crit_edge ], [ %i614, %bb675.bb829_crit_edge ], [ %i614, %bb671.bb829_crit_edge ], [ %i614, %bb667.bb829_crit_edge ], [ %i614, %bb663.bb829_crit_edge ], [ %i614, %bb660.bb829_crit_edge ], [ %i614, %bb656.bb829_crit_edge ], [ %i614, %bb652.bb829_crit_edge ], [ %i614, %bb647.bb829_crit_edge ], [ %i614, %bb643.bb829_crit_edge ], [ %i614, %bb639.bb829_crit_edge ], [ %i614, %bb635.bb829_crit_edge ], [ %i614, %bb632.bb829_crit_edge ], [ %i614, %bb628.bb829_crit_edge ], [ %i614, %bb624.bb829_crit_edge ], [ %i614, %bb619.bb829_crit_edge ], [ %i614, %bb612.bb829_crit_edge ]
  %i831 = add nuw nsw i64 %i613, 1
  %i832 = icmp eq i64 %i831, %i588
  br i1 %i832, label %bb833, label %bb829.bb612_crit_edge, !llvm.loop !62

bb829.bb612_crit_edge:                            ; preds = %bb829
  br label %bb612

bb833:                                            ; preds = %bb829
  %i834 = icmp eq i64 %i599, %i587
  br i1 %i834, label %bb838, label %bb833.bb589_crit_edge, !llvm.loop !63

bb833.bb589_crit_edge:                            ; preds = %bb833
  br label %bb589

bb835:                                            ; preds = %bb811
  %i836 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i837 = tail call i64 @fwrite(ptr nonnull @.str.29, i64 18, i64 1, ptr %i836) #22
  tail call void @exit(i32 noundef 1) #23
  unreachable

bb838:                                            ; preds = %bb833
  %i839 = sext i32 %i830 to i64
  br label %bb840

bb840:                                            ; preds = %bb838, %bb583.bb840_crit_edge, %bb13.bb840_crit_edge, %bb.bb840_crit_edge
  %i841 = phi i64 [ 0, %bb583.bb840_crit_edge ], [ %i839, %bb838 ], [ 0, %bb.bb840_crit_edge ], [ 0, %bb13.bb840_crit_edge ]
  %i842 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i841, i32 2
  store i32 7, ptr %i842, align 4, !tbaa !52
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
  br i1 %i10, label %bb11, label %bb.bb838_crit_edge

bb.bb838_crit_edge:                               ; preds = %bb
  br label %bb838

bb11:                                             ; preds = %bb
  %i12 = icmp sgt i32 %arg5, 14
  %i13 = add nsw i32 %arg5, -3
  %i14 = sext i32 %i13 to i64
  %i15 = add nsw i32 %arg5, -5
  %i16 = sext i32 %i15 to i64
  %i17 = add nsw i32 %arg5, -6
  %i18 = sext i32 %i17 to i64
  br i1 %i12, label %bb19, label %bb11.bb838_crit_edge

bb11.bb838_crit_edge:                             ; preds = %bb11
  br label %bb838

bb19:                                             ; preds = %bb11
  %i20 = add nsw i32 %arg5, -7
  %i21 = zext nneg i32 %arg5 to i64
  %i22 = zext nneg i32 %i9 to i64
  %i23 = zext i32 %i20 to i64
  br label %bb24

bb24:                                             ; preds = %bb370.bb24_crit_edge, %bb19
  %i25 = phi i64 [ 7, %bb19 ], [ %i371, %bb370.bb24_crit_edge ]
  %i26 = add nsw i64 %i25, -3
  %i27 = mul nsw i64 %i26, %i21
  %i28 = getelementptr inbounds i8, ptr %arg, i64 %i27
  %i29 = trunc i64 %i25 to i32
  %i30 = mul i32 %i29, %arg5
  %i31 = zext i32 %i30 to i64
  br label %bb32

bb32:                                             ; preds = %bb367.bb32_crit_edge, %bb24
  %i33 = phi i64 [ 7, %bb24 ], [ %i368, %bb367.bb32_crit_edge ]
  %i34 = getelementptr inbounds i8, ptr %i28, i64 %i33
  %i35 = getelementptr inbounds i8, ptr %i34, i64 -1
  %i36 = add nuw nsw i64 %i33, %i31
  %i37 = getelementptr inbounds i8, ptr %arg, i64 %i36
  %i38 = load i8, ptr %i37, align 1, !tbaa !21
  %i39 = zext i8 %i38 to i64
  %i40 = getelementptr inbounds i8, ptr %arg2, i64 %i39
  %i41 = load i8, ptr %i35, align 1, !tbaa !21
  %i42 = zext i8 %i41 to i64
  %i43 = sub nsw i64 0, %i42
  %i44 = getelementptr inbounds i8, ptr %i40, i64 %i43
  %i45 = load i8, ptr %i44, align 1, !tbaa !21
  %i46 = zext i8 %i45 to i32
  %i47 = add nuw nsw i32 %i46, 100
  %i48 = getelementptr inbounds i8, ptr %i34, i64 1
  %i49 = load i8, ptr %i34, align 1, !tbaa !21
  %i50 = zext i8 %i49 to i64
  %i51 = sub nsw i64 0, %i50
  %i52 = getelementptr inbounds i8, ptr %i40, i64 %i51
  %i53 = load i8, ptr %i52, align 1, !tbaa !21
  %i54 = zext i8 %i53 to i32
  %i55 = add nuw nsw i32 %i47, %i54
  %i56 = load i8, ptr %i48, align 1, !tbaa !21
  %i57 = zext i8 %i56 to i64
  %i58 = sub nsw i64 0, %i57
  %i59 = getelementptr inbounds i8, ptr %i40, i64 %i58
  %i60 = load i8, ptr %i59, align 1, !tbaa !21
  %i61 = zext i8 %i60 to i32
  %i62 = add nuw nsw i32 %i55, %i61
  %i63 = getelementptr inbounds i8, ptr %i48, i64 %i14
  %i64 = getelementptr inbounds i8, ptr %i63, i64 1
  %i65 = load i8, ptr %i63, align 1, !tbaa !21
  %i66 = zext i8 %i65 to i64
  %i67 = sub nsw i64 0, %i66
  %i68 = getelementptr inbounds i8, ptr %i40, i64 %i67
  %i69 = load i8, ptr %i68, align 1, !tbaa !21
  %i70 = zext i8 %i69 to i32
  %i71 = add nuw nsw i32 %i62, %i70
  %i72 = getelementptr inbounds i8, ptr %i63, i64 2
  %i73 = load i8, ptr %i64, align 1, !tbaa !21
  %i74 = zext i8 %i73 to i64
  %i75 = sub nsw i64 0, %i74
  %i76 = getelementptr inbounds i8, ptr %i40, i64 %i75
  %i77 = load i8, ptr %i76, align 1, !tbaa !21
  %i78 = zext i8 %i77 to i32
  %i79 = add nuw nsw i32 %i71, %i78
  %i80 = getelementptr inbounds i8, ptr %i63, i64 3
  %i81 = load i8, ptr %i72, align 1, !tbaa !21
  %i82 = zext i8 %i81 to i64
  %i83 = sub nsw i64 0, %i82
  %i84 = getelementptr inbounds i8, ptr %i40, i64 %i83
  %i85 = load i8, ptr %i84, align 1, !tbaa !21
  %i86 = zext i8 %i85 to i32
  %i87 = add nuw nsw i32 %i79, %i86
  %i88 = getelementptr inbounds i8, ptr %i63, i64 4
  %i89 = load i8, ptr %i80, align 1, !tbaa !21
  %i90 = zext i8 %i89 to i64
  %i91 = sub nsw i64 0, %i90
  %i92 = getelementptr inbounds i8, ptr %i40, i64 %i91
  %i93 = load i8, ptr %i92, align 1, !tbaa !21
  %i94 = zext i8 %i93 to i32
  %i95 = add nuw nsw i32 %i87, %i94
  %i96 = load i8, ptr %i88, align 1, !tbaa !21
  %i97 = zext i8 %i96 to i64
  %i98 = sub nsw i64 0, %i97
  %i99 = getelementptr inbounds i8, ptr %i40, i64 %i98
  %i100 = load i8, ptr %i99, align 1, !tbaa !21
  %i101 = zext i8 %i100 to i32
  %i102 = add nuw nsw i32 %i95, %i101
  %i103 = getelementptr inbounds i8, ptr %i88, i64 %i16
  %i104 = getelementptr inbounds i8, ptr %i103, i64 1
  %i105 = load i8, ptr %i103, align 1, !tbaa !21
  %i106 = zext i8 %i105 to i64
  %i107 = sub nsw i64 0, %i106
  %i108 = getelementptr inbounds i8, ptr %i40, i64 %i107
  %i109 = load i8, ptr %i108, align 1, !tbaa !21
  %i110 = zext i8 %i109 to i32
  %i111 = add nuw nsw i32 %i102, %i110
  %i112 = getelementptr inbounds i8, ptr %i103, i64 2
  %i113 = load i8, ptr %i104, align 1, !tbaa !21
  %i114 = zext i8 %i113 to i64
  %i115 = sub nsw i64 0, %i114
  %i116 = getelementptr inbounds i8, ptr %i40, i64 %i115
  %i117 = load i8, ptr %i116, align 1, !tbaa !21
  %i118 = zext i8 %i117 to i32
  %i119 = add nuw nsw i32 %i111, %i118
  %i120 = getelementptr inbounds i8, ptr %i103, i64 3
  %i121 = load i8, ptr %i112, align 1, !tbaa !21
  %i122 = zext i8 %i121 to i64
  %i123 = sub nsw i64 0, %i122
  %i124 = getelementptr inbounds i8, ptr %i40, i64 %i123
  %i125 = load i8, ptr %i124, align 1, !tbaa !21
  %i126 = zext i8 %i125 to i32
  %i127 = add nuw nsw i32 %i119, %i126
  %i128 = getelementptr inbounds i8, ptr %i103, i64 4
  %i129 = load i8, ptr %i120, align 1, !tbaa !21
  %i130 = zext i8 %i129 to i64
  %i131 = sub nsw i64 0, %i130
  %i132 = getelementptr inbounds i8, ptr %i40, i64 %i131
  %i133 = load i8, ptr %i132, align 1, !tbaa !21
  %i134 = zext i8 %i133 to i32
  %i135 = add nuw nsw i32 %i127, %i134
  %i136 = getelementptr inbounds i8, ptr %i103, i64 5
  %i137 = load i8, ptr %i128, align 1, !tbaa !21
  %i138 = zext i8 %i137 to i64
  %i139 = sub nsw i64 0, %i138
  %i140 = getelementptr inbounds i8, ptr %i40, i64 %i139
  %i141 = load i8, ptr %i140, align 1, !tbaa !21
  %i142 = zext i8 %i141 to i32
  %i143 = add nuw nsw i32 %i135, %i142
  %i144 = getelementptr inbounds i8, ptr %i103, i64 6
  %i145 = load i8, ptr %i136, align 1, !tbaa !21
  %i146 = zext i8 %i145 to i64
  %i147 = sub nsw i64 0, %i146
  %i148 = getelementptr inbounds i8, ptr %i40, i64 %i147
  %i149 = load i8, ptr %i148, align 1, !tbaa !21
  %i150 = zext i8 %i149 to i32
  %i151 = add nuw nsw i32 %i143, %i150
  %i152 = load i8, ptr %i144, align 1, !tbaa !21
  %i153 = zext i8 %i152 to i64
  %i154 = sub nsw i64 0, %i153
  %i155 = getelementptr inbounds i8, ptr %i40, i64 %i154
  %i156 = load i8, ptr %i155, align 1, !tbaa !21
  %i157 = zext i8 %i156 to i32
  %i158 = add nuw nsw i32 %i151, %i157
  %i159 = getelementptr inbounds i8, ptr %i144, i64 %i18
  %i160 = getelementptr inbounds i8, ptr %i159, i64 1
  %i161 = load i8, ptr %i159, align 1, !tbaa !21
  %i162 = zext i8 %i161 to i64
  %i163 = sub nsw i64 0, %i162
  %i164 = getelementptr inbounds i8, ptr %i40, i64 %i163
  %i165 = load i8, ptr %i164, align 1, !tbaa !21
  %i166 = zext i8 %i165 to i32
  %i167 = add nuw nsw i32 %i158, %i166
  %i168 = getelementptr inbounds i8, ptr %i159, i64 2
  %i169 = load i8, ptr %i160, align 1, !tbaa !21
  %i170 = zext i8 %i169 to i64
  %i171 = sub nsw i64 0, %i170
  %i172 = getelementptr inbounds i8, ptr %i40, i64 %i171
  %i173 = load i8, ptr %i172, align 1, !tbaa !21
  %i174 = zext i8 %i173 to i32
  %i175 = add nuw nsw i32 %i167, %i174
  %i176 = load i8, ptr %i168, align 1, !tbaa !21
  %i177 = zext i8 %i176 to i64
  %i178 = sub nsw i64 0, %i177
  %i179 = getelementptr inbounds i8, ptr %i40, i64 %i178
  %i180 = load i8, ptr %i179, align 1, !tbaa !21
  %i181 = zext i8 %i180 to i32
  %i182 = add nuw nsw i32 %i175, %i181
  %i183 = icmp slt i32 %i182, %arg3
  br i1 %i183, label %bb184, label %bb32.bb367_crit_edge

bb32.bb367_crit_edge:                             ; preds = %bb32
  br label %bb367

bb184:                                            ; preds = %bb32
  %i185 = getelementptr inbounds i8, ptr %i159, i64 4
  %i186 = load i8, ptr %i185, align 1, !tbaa !21
  %i187 = zext i8 %i186 to i64
  %i188 = sub nsw i64 0, %i187
  %i189 = getelementptr inbounds i8, ptr %i40, i64 %i188
  %i190 = load i8, ptr %i189, align 1, !tbaa !21
  %i191 = zext i8 %i190 to i32
  %i192 = add nuw nsw i32 %i182, %i191
  %i193 = icmp ult i32 %i192, %arg3
  br i1 %i193, label %bb194, label %bb184.bb367_crit_edge

bb184.bb367_crit_edge:                            ; preds = %bb184
  br label %bb367

bb194:                                            ; preds = %bb184
  %i195 = getelementptr inbounds i8, ptr %i159, i64 5
  %i196 = getelementptr inbounds i8, ptr %i159, i64 6
  %i197 = load i8, ptr %i195, align 1, !tbaa !21
  %i198 = zext i8 %i197 to i64
  %i199 = sub nsw i64 0, %i198
  %i200 = getelementptr inbounds i8, ptr %i40, i64 %i199
  %i201 = load i8, ptr %i200, align 1, !tbaa !21
  %i202 = zext i8 %i201 to i32
  %i203 = add nuw nsw i32 %i192, %i202
  %i204 = icmp ult i32 %i203, %arg3
  br i1 %i204, label %bb205, label %bb194.bb367_crit_edge

bb194.bb367_crit_edge:                            ; preds = %bb194
  br label %bb367

bb205:                                            ; preds = %bb194
  %i206 = load i8, ptr %i196, align 1, !tbaa !21
  %i207 = zext i8 %i206 to i64
  %i208 = sub nsw i64 0, %i207
  %i209 = getelementptr inbounds i8, ptr %i40, i64 %i208
  %i210 = load i8, ptr %i209, align 1, !tbaa !21
  %i211 = zext i8 %i210 to i32
  %i212 = add nuw nsw i32 %i203, %i211
  %i213 = icmp ult i32 %i212, %arg3
  br i1 %i213, label %bb214, label %bb205.bb367_crit_edge

bb205.bb367_crit_edge:                            ; preds = %bb205
  br label %bb367

bb214:                                            ; preds = %bb205
  %i215 = getelementptr inbounds i8, ptr %i196, i64 %i18
  %i216 = load i8, ptr %i215, align 1, !tbaa !21
  %i217 = zext i8 %i216 to i64
  %i218 = sub nsw i64 0, %i217
  %i219 = getelementptr inbounds i8, ptr %i40, i64 %i218
  %i220 = load i8, ptr %i219, align 1, !tbaa !21
  %i221 = zext i8 %i220 to i32
  %i222 = add nuw nsw i32 %i212, %i221
  %i223 = icmp ult i32 %i222, %arg3
  br i1 %i223, label %bb224, label %bb214.bb367_crit_edge

bb214.bb367_crit_edge:                            ; preds = %bb214
  br label %bb367

bb224:                                            ; preds = %bb214
  %i225 = getelementptr inbounds i8, ptr %i215, i64 1
  %i226 = load i8, ptr %i225, align 1, !tbaa !21
  %i227 = zext i8 %i226 to i64
  %i228 = sub nsw i64 0, %i227
  %i229 = getelementptr inbounds i8, ptr %i40, i64 %i228
  %i230 = load i8, ptr %i229, align 1, !tbaa !21
  %i231 = zext i8 %i230 to i32
  %i232 = add nuw nsw i32 %i222, %i231
  %i233 = icmp ult i32 %i232, %arg3
  br i1 %i233, label %bb234, label %bb224.bb367_crit_edge

bb224.bb367_crit_edge:                            ; preds = %bb224
  br label %bb367

bb234:                                            ; preds = %bb224
  %i235 = getelementptr inbounds i8, ptr %i215, i64 2
  %i236 = load i8, ptr %i235, align 1, !tbaa !21
  %i237 = zext i8 %i236 to i64
  %i238 = sub nsw i64 0, %i237
  %i239 = getelementptr inbounds i8, ptr %i40, i64 %i238
  %i240 = load i8, ptr %i239, align 1, !tbaa !21
  %i241 = zext i8 %i240 to i32
  %i242 = add nuw nsw i32 %i232, %i241
  %i243 = icmp ult i32 %i242, %arg3
  br i1 %i243, label %bb244, label %bb234.bb367_crit_edge

bb234.bb367_crit_edge:                            ; preds = %bb234
  br label %bb367

bb244:                                            ; preds = %bb234
  %i245 = getelementptr inbounds i8, ptr %i215, i64 3
  %i246 = load i8, ptr %i245, align 1, !tbaa !21
  %i247 = zext i8 %i246 to i64
  %i248 = sub nsw i64 0, %i247
  %i249 = getelementptr inbounds i8, ptr %i40, i64 %i248
  %i250 = load i8, ptr %i249, align 1, !tbaa !21
  %i251 = zext i8 %i250 to i32
  %i252 = add nuw nsw i32 %i242, %i251
  %i253 = icmp ult i32 %i252, %arg3
  br i1 %i253, label %bb254, label %bb244.bb367_crit_edge

bb244.bb367_crit_edge:                            ; preds = %bb244
  br label %bb367

bb254:                                            ; preds = %bb244
  %i255 = getelementptr inbounds i8, ptr %i215, i64 4
  %i256 = load i8, ptr %i255, align 1, !tbaa !21
  %i257 = zext i8 %i256 to i64
  %i258 = sub nsw i64 0, %i257
  %i259 = getelementptr inbounds i8, ptr %i40, i64 %i258
  %i260 = load i8, ptr %i259, align 1, !tbaa !21
  %i261 = zext i8 %i260 to i32
  %i262 = add nuw nsw i32 %i252, %i261
  %i263 = icmp ult i32 %i262, %arg3
  br i1 %i263, label %bb264, label %bb254.bb367_crit_edge

bb254.bb367_crit_edge:                            ; preds = %bb254
  br label %bb367

bb264:                                            ; preds = %bb254
  %i265 = getelementptr inbounds i8, ptr %i215, i64 5
  %i266 = getelementptr inbounds i8, ptr %i215, i64 6
  %i267 = load i8, ptr %i265, align 1, !tbaa !21
  %i268 = zext i8 %i267 to i64
  %i269 = sub nsw i64 0, %i268
  %i270 = getelementptr inbounds i8, ptr %i40, i64 %i269
  %i271 = load i8, ptr %i270, align 1, !tbaa !21
  %i272 = zext i8 %i271 to i32
  %i273 = add nuw nsw i32 %i262, %i272
  %i274 = icmp ult i32 %i273, %arg3
  br i1 %i274, label %bb275, label %bb264.bb367_crit_edge

bb264.bb367_crit_edge:                            ; preds = %bb264
  br label %bb367

bb275:                                            ; preds = %bb264
  %i276 = load i8, ptr %i266, align 1, !tbaa !21
  %i277 = zext i8 %i276 to i64
  %i278 = sub nsw i64 0, %i277
  %i279 = getelementptr inbounds i8, ptr %i40, i64 %i278
  %i280 = load i8, ptr %i279, align 1, !tbaa !21
  %i281 = zext i8 %i280 to i32
  %i282 = add nuw nsw i32 %i273, %i281
  %i283 = icmp ult i32 %i282, %arg3
  br i1 %i283, label %bb284, label %bb275.bb367_crit_edge

bb275.bb367_crit_edge:                            ; preds = %bb275
  br label %bb367

bb284:                                            ; preds = %bb275
  %i285 = getelementptr inbounds i8, ptr %i266, i64 %i16
  %i286 = load i8, ptr %i285, align 1, !tbaa !21
  %i287 = zext i8 %i286 to i64
  %i288 = sub nsw i64 0, %i287
  %i289 = getelementptr inbounds i8, ptr %i40, i64 %i288
  %i290 = load i8, ptr %i289, align 1, !tbaa !21
  %i291 = zext i8 %i290 to i32
  %i292 = add nuw nsw i32 %i282, %i291
  %i293 = icmp ult i32 %i292, %arg3
  br i1 %i293, label %bb294, label %bb284.bb367_crit_edge

bb284.bb367_crit_edge:                            ; preds = %bb284
  br label %bb367

bb294:                                            ; preds = %bb284
  %i295 = getelementptr inbounds i8, ptr %i285, i64 1
  %i296 = load i8, ptr %i295, align 1, !tbaa !21
  %i297 = zext i8 %i296 to i64
  %i298 = sub nsw i64 0, %i297
  %i299 = getelementptr inbounds i8, ptr %i40, i64 %i298
  %i300 = load i8, ptr %i299, align 1, !tbaa !21
  %i301 = zext i8 %i300 to i32
  %i302 = add nuw nsw i32 %i292, %i301
  %i303 = icmp ult i32 %i302, %arg3
  br i1 %i303, label %bb304, label %bb294.bb367_crit_edge

bb294.bb367_crit_edge:                            ; preds = %bb294
  br label %bb367

bb304:                                            ; preds = %bb294
  %i305 = getelementptr inbounds i8, ptr %i285, i64 2
  %i306 = load i8, ptr %i305, align 1, !tbaa !21
  %i307 = zext i8 %i306 to i64
  %i308 = sub nsw i64 0, %i307
  %i309 = getelementptr inbounds i8, ptr %i40, i64 %i308
  %i310 = load i8, ptr %i309, align 1, !tbaa !21
  %i311 = zext i8 %i310 to i32
  %i312 = add nuw nsw i32 %i302, %i311
  %i313 = icmp ult i32 %i312, %arg3
  br i1 %i313, label %bb314, label %bb304.bb367_crit_edge

bb304.bb367_crit_edge:                            ; preds = %bb304
  br label %bb367

bb314:                                            ; preds = %bb304
  %i315 = getelementptr inbounds i8, ptr %i285, i64 3
  %i316 = getelementptr inbounds i8, ptr %i285, i64 4
  %i317 = load i8, ptr %i315, align 1, !tbaa !21
  %i318 = zext i8 %i317 to i64
  %i319 = sub nsw i64 0, %i318
  %i320 = getelementptr inbounds i8, ptr %i40, i64 %i319
  %i321 = load i8, ptr %i320, align 1, !tbaa !21
  %i322 = zext i8 %i321 to i32
  %i323 = add nuw nsw i32 %i312, %i322
  %i324 = icmp ult i32 %i323, %arg3
  br i1 %i324, label %bb325, label %bb314.bb367_crit_edge

bb314.bb367_crit_edge:                            ; preds = %bb314
  br label %bb367

bb325:                                            ; preds = %bb314
  %i326 = load i8, ptr %i316, align 1, !tbaa !21
  %i327 = zext i8 %i326 to i64
  %i328 = sub nsw i64 0, %i327
  %i329 = getelementptr inbounds i8, ptr %i40, i64 %i328
  %i330 = load i8, ptr %i329, align 1, !tbaa !21
  %i331 = zext i8 %i330 to i32
  %i332 = add nuw nsw i32 %i323, %i331
  %i333 = icmp ult i32 %i332, %arg3
  br i1 %i333, label %bb334, label %bb325.bb367_crit_edge

bb325.bb367_crit_edge:                            ; preds = %bb325
  br label %bb367

bb334:                                            ; preds = %bb325
  %i335 = getelementptr inbounds i8, ptr %i316, i64 %i14
  %i336 = load i8, ptr %i335, align 1, !tbaa !21
  %i337 = zext i8 %i336 to i64
  %i338 = sub nsw i64 0, %i337
  %i339 = getelementptr inbounds i8, ptr %i40, i64 %i338
  %i340 = load i8, ptr %i339, align 1, !tbaa !21
  %i341 = zext i8 %i340 to i32
  %i342 = add nuw nsw i32 %i332, %i341
  %i343 = icmp ult i32 %i342, %arg3
  br i1 %i343, label %bb344, label %bb334.bb367_crit_edge

bb334.bb367_crit_edge:                            ; preds = %bb334
  br label %bb367

bb344:                                            ; preds = %bb334
  %i345 = getelementptr inbounds i8, ptr %i335, i64 1
  %i346 = load i8, ptr %i345, align 1, !tbaa !21
  %i347 = zext i8 %i346 to i64
  %i348 = sub nsw i64 0, %i347
  %i349 = getelementptr inbounds i8, ptr %i40, i64 %i348
  %i350 = load i8, ptr %i349, align 1, !tbaa !21
  %i351 = zext i8 %i350 to i32
  %i352 = add nuw nsw i32 %i342, %i351
  %i353 = icmp ult i32 %i352, %arg3
  br i1 %i353, label %bb354, label %bb344.bb367_crit_edge

bb344.bb367_crit_edge:                            ; preds = %bb344
  br label %bb367

bb354:                                            ; preds = %bb344
  %i355 = getelementptr inbounds i8, ptr %i335, i64 2
  %i356 = load i8, ptr %i355, align 1, !tbaa !21
  %i357 = zext i8 %i356 to i64
  %i358 = sub nsw i64 0, %i357
  %i359 = getelementptr inbounds i8, ptr %i40, i64 %i358
  %i360 = load i8, ptr %i359, align 1, !tbaa !21
  %i361 = zext i8 %i360 to i32
  %i362 = add nuw nsw i32 %i352, %i361
  %i363 = icmp ult i32 %i362, %arg3
  br i1 %i363, label %bb364, label %bb354.bb367_crit_edge

bb354.bb367_crit_edge:                            ; preds = %bb354
  br label %bb367

bb364:                                            ; preds = %bb354
  %i365 = sub nsw i32 %arg3, %i362
  %i366 = getelementptr inbounds i32, ptr %arg1, i64 %i36
  store i32 %i365, ptr %i366, align 4, !tbaa !16
  br label %bb367

bb367:                                            ; preds = %bb364, %bb354.bb367_crit_edge, %bb344.bb367_crit_edge, %bb334.bb367_crit_edge, %bb325.bb367_crit_edge, %bb314.bb367_crit_edge, %bb304.bb367_crit_edge, %bb294.bb367_crit_edge, %bb284.bb367_crit_edge, %bb275.bb367_crit_edge, %bb264.bb367_crit_edge, %bb254.bb367_crit_edge, %bb244.bb367_crit_edge, %bb234.bb367_crit_edge, %bb224.bb367_crit_edge, %bb214.bb367_crit_edge, %bb205.bb367_crit_edge, %bb194.bb367_crit_edge, %bb184.bb367_crit_edge, %bb32.bb367_crit_edge
  %i368 = add nuw nsw i64 %i33, 1
  %i369 = icmp eq i64 %i368, %i23
  br i1 %i369, label %bb370, label %bb367.bb32_crit_edge, !llvm.loop !64

bb367.bb32_crit_edge:                             ; preds = %bb367
  br label %bb32

bb370:                                            ; preds = %bb367
  %i371 = add nuw nsw i64 %i25, 1
  %i372 = icmp eq i64 %i371, %i22
  br i1 %i372, label %bb373, label %bb370.bb24_crit_edge, !llvm.loop !65

bb370.bb24_crit_edge:                             ; preds = %bb370
  br label %bb24

bb373:                                            ; preds = %bb370
  br i1 %i10, label %bb374, label %bb373.bb838_crit_edge

bb373.bb838_crit_edge:                            ; preds = %bb373
  br label %bb838

bb374:                                            ; preds = %bb373
  %i375 = add nsw i32 %arg5, -7
  %i376 = zext nneg i32 %arg5 to i64
  %i377 = zext nneg i32 %i9 to i64
  %i378 = zext i32 %i375 to i64
  br label %bb379

bb379:                                            ; preds = %bb831.bb379_crit_edge, %bb374
  %i380 = phi i64 [ 7, %bb374 ], [ %i389, %bb831.bb379_crit_edge ]
  %i381 = phi i32 [ 0, %bb374 ], [ %i828, %bb831.bb379_crit_edge ]
  %i382 = mul nsw i64 %i380, %i376
  %i383 = add nsw i64 %i380, -3
  %i384 = mul nsw i64 %i383, %i376
  %i385 = add nsw i64 %i380, -2
  %i386 = mul nsw i64 %i385, %i376
  %i387 = add nsw i64 %i380, -1
  %i388 = mul nsw i64 %i387, %i376
  %i389 = add nuw nsw i64 %i380, 1
  %i390 = mul nsw i64 %i389, %i376
  %i391 = add nuw nsw i64 %i380, 2
  %i392 = mul nsw i64 %i391, %i376
  %i393 = add nuw nsw i64 %i380, 3
  %i394 = mul nsw i64 %i393, %i376
  %i395 = getelementptr i32, ptr %arg1, i64 %i384
  %i396 = getelementptr i32, ptr %arg1, i64 %i394
  %i397 = trunc i64 %i380 to i32
  br label %bb398

bb398:                                            ; preds = %bb827.bb398_crit_edge, %bb379
  %i399 = phi i64 [ 7, %bb379 ], [ %i829, %bb827.bb398_crit_edge ]
  %i400 = phi i32 [ %i381, %bb379 ], [ %i828, %bb827.bb398_crit_edge ]
  %i401 = add nuw nsw i64 %i399, %i382
  %i402 = getelementptr inbounds i32, ptr %arg1, i64 %i401
  %i403 = load i32, ptr %i402, align 4, !tbaa !16
  %i404 = icmp sgt i32 %i403, 0
  br i1 %i404, label %bb405, label %bb398.bb827_crit_edge

bb398.bb827_crit_edge:                            ; preds = %bb398
  br label %bb827

bb405:                                            ; preds = %bb398
  %i406 = getelementptr i32, ptr %i395, i64 %i399
  %i407 = getelementptr i32, ptr %i406, i64 -3
  %i408 = load i32, ptr %i407, align 4, !tbaa !16
  %i409 = icmp sgt i32 %i403, %i408
  br i1 %i409, label %bb410, label %bb405.bb827_crit_edge

bb405.bb827_crit_edge:                            ; preds = %bb405
  br label %bb827

bb410:                                            ; preds = %bb405
  %i411 = getelementptr i32, ptr %i406, i64 -2
  %i412 = load i32, ptr %i411, align 4, !tbaa !16
  %i413 = icmp sgt i32 %i403, %i412
  br i1 %i413, label %bb414, label %bb410.bb827_crit_edge

bb410.bb827_crit_edge:                            ; preds = %bb410
  br label %bb827

bb414:                                            ; preds = %bb410
  %i415 = getelementptr i32, ptr %i406, i64 -1
  %i416 = load i32, ptr %i415, align 4, !tbaa !16
  %i417 = icmp sgt i32 %i403, %i416
  br i1 %i417, label %bb418, label %bb414.bb827_crit_edge

bb414.bb827_crit_edge:                            ; preds = %bb414
  br label %bb827

bb418:                                            ; preds = %bb414
  %i419 = load i32, ptr %i406, align 4, !tbaa !16
  %i420 = icmp sgt i32 %i403, %i419
  br i1 %i420, label %bb421, label %bb418.bb827_crit_edge

bb418.bb827_crit_edge:                            ; preds = %bb418
  br label %bb827

bb421:                                            ; preds = %bb418
  %i422 = getelementptr i32, ptr %i406, i64 1
  %i423 = load i32, ptr %i422, align 4, !tbaa !16
  %i424 = icmp sgt i32 %i403, %i423
  br i1 %i424, label %bb425, label %bb421.bb827_crit_edge

bb421.bb827_crit_edge:                            ; preds = %bb421
  br label %bb827

bb425:                                            ; preds = %bb421
  %i426 = getelementptr i32, ptr %i406, i64 2
  %i427 = load i32, ptr %i426, align 4, !tbaa !16
  %i428 = icmp sgt i32 %i403, %i427
  br i1 %i428, label %bb429, label %bb425.bb827_crit_edge

bb425.bb827_crit_edge:                            ; preds = %bb425
  br label %bb827

bb429:                                            ; preds = %bb425
  %i430 = getelementptr i32, ptr %i406, i64 3
  %i431 = load i32, ptr %i430, align 4, !tbaa !16
  %i432 = icmp sgt i32 %i403, %i431
  br i1 %i432, label %bb433, label %bb429.bb827_crit_edge

bb429.bb827_crit_edge:                            ; preds = %bb429
  br label %bb827

bb433:                                            ; preds = %bb429
  %i434 = add nsw i64 %i399, %i386
  %i435 = getelementptr i32, ptr %arg1, i64 %i434
  %i436 = getelementptr i32, ptr %i435, i64 -3
  %i437 = load i32, ptr %i436, align 4, !tbaa !16
  %i438 = icmp sgt i32 %i403, %i437
  br i1 %i438, label %bb439, label %bb433.bb827_crit_edge

bb433.bb827_crit_edge:                            ; preds = %bb433
  br label %bb827

bb439:                                            ; preds = %bb433
  %i440 = add nsw i64 %i434, -2
  %i441 = getelementptr inbounds i32, ptr %arg1, i64 %i440
  %i442 = load i32, ptr %i441, align 4, !tbaa !16
  %i443 = icmp sgt i32 %i403, %i442
  br i1 %i443, label %bb444, label %bb439.bb827_crit_edge

bb439.bb827_crit_edge:                            ; preds = %bb439
  br label %bb827

bb444:                                            ; preds = %bb439
  %i445 = add nsw i64 %i434, -1
  %i446 = getelementptr inbounds i32, ptr %arg1, i64 %i445
  %i447 = load i32, ptr %i446, align 4, !tbaa !16
  %i448 = icmp sgt i32 %i403, %i447
  br i1 %i448, label %bb449, label %bb444.bb827_crit_edge

bb444.bb827_crit_edge:                            ; preds = %bb444
  br label %bb827

bb449:                                            ; preds = %bb444
  %i450 = load i32, ptr %i435, align 4, !tbaa !16
  %i451 = icmp sgt i32 %i403, %i450
  br i1 %i451, label %bb452, label %bb449.bb827_crit_edge

bb449.bb827_crit_edge:                            ; preds = %bb449
  br label %bb827

bb452:                                            ; preds = %bb449
  %i453 = add nsw i64 %i434, 1
  %i454 = getelementptr inbounds i32, ptr %arg1, i64 %i453
  %i455 = load i32, ptr %i454, align 4, !tbaa !16
  %i456 = icmp sgt i32 %i403, %i455
  br i1 %i456, label %bb457, label %bb452.bb827_crit_edge

bb452.bb827_crit_edge:                            ; preds = %bb452
  br label %bb827

bb457:                                            ; preds = %bb452
  %i458 = add nsw i64 %i434, 2
  %i459 = getelementptr inbounds i32, ptr %arg1, i64 %i458
  %i460 = load i32, ptr %i459, align 4, !tbaa !16
  %i461 = icmp sgt i32 %i403, %i460
  br i1 %i461, label %bb462, label %bb457.bb827_crit_edge

bb457.bb827_crit_edge:                            ; preds = %bb457
  br label %bb827

bb462:                                            ; preds = %bb457
  %i463 = getelementptr i32, ptr %i435, i64 3
  %i464 = load i32, ptr %i463, align 4, !tbaa !16
  %i465 = icmp sgt i32 %i403, %i464
  br i1 %i465, label %bb466, label %bb462.bb827_crit_edge

bb462.bb827_crit_edge:                            ; preds = %bb462
  br label %bb827

bb466:                                            ; preds = %bb462
  %i467 = add nsw i64 %i399, %i388
  %i468 = getelementptr i32, ptr %arg1, i64 %i467
  %i469 = getelementptr i32, ptr %i468, i64 -3
  %i470 = load i32, ptr %i469, align 4, !tbaa !16
  %i471 = icmp sgt i32 %i403, %i470
  br i1 %i471, label %bb472, label %bb466.bb827_crit_edge

bb466.bb827_crit_edge:                            ; preds = %bb466
  br label %bb827

bb472:                                            ; preds = %bb466
  %i473 = add nsw i64 %i467, -2
  %i474 = getelementptr inbounds i32, ptr %arg1, i64 %i473
  %i475 = load i32, ptr %i474, align 4, !tbaa !16
  %i476 = icmp sgt i32 %i403, %i475
  br i1 %i476, label %bb477, label %bb472.bb827_crit_edge

bb472.bb827_crit_edge:                            ; preds = %bb472
  br label %bb827

bb477:                                            ; preds = %bb472
  %i478 = add nsw i64 %i467, -1
  %i479 = getelementptr inbounds i32, ptr %arg1, i64 %i478
  %i480 = load i32, ptr %i479, align 4, !tbaa !16
  %i481 = icmp sgt i32 %i403, %i480
  br i1 %i481, label %bb482, label %bb477.bb827_crit_edge

bb477.bb827_crit_edge:                            ; preds = %bb477
  br label %bb827

bb482:                                            ; preds = %bb477
  %i483 = load i32, ptr %i468, align 4, !tbaa !16
  %i484 = icmp sgt i32 %i403, %i483
  br i1 %i484, label %bb485, label %bb482.bb827_crit_edge

bb482.bb827_crit_edge:                            ; preds = %bb482
  br label %bb827

bb485:                                            ; preds = %bb482
  %i486 = add nsw i64 %i467, 1
  %i487 = getelementptr inbounds i32, ptr %arg1, i64 %i486
  %i488 = load i32, ptr %i487, align 4, !tbaa !16
  %i489 = icmp sgt i32 %i403, %i488
  br i1 %i489, label %bb490, label %bb485.bb827_crit_edge

bb485.bb827_crit_edge:                            ; preds = %bb485
  br label %bb827

bb490:                                            ; preds = %bb485
  %i491 = add nsw i64 %i467, 2
  %i492 = getelementptr inbounds i32, ptr %arg1, i64 %i491
  %i493 = load i32, ptr %i492, align 4, !tbaa !16
  %i494 = icmp sgt i32 %i403, %i493
  br i1 %i494, label %bb495, label %bb490.bb827_crit_edge

bb490.bb827_crit_edge:                            ; preds = %bb490
  br label %bb827

bb495:                                            ; preds = %bb490
  %i496 = getelementptr i32, ptr %i468, i64 3
  %i497 = load i32, ptr %i496, align 4, !tbaa !16
  %i498 = icmp sgt i32 %i403, %i497
  br i1 %i498, label %bb499, label %bb495.bb827_crit_edge

bb495.bb827_crit_edge:                            ; preds = %bb495
  br label %bb827

bb499:                                            ; preds = %bb495
  %i500 = getelementptr i32, ptr %i402, i64 -3
  %i501 = load i32, ptr %i500, align 4, !tbaa !16
  %i502 = icmp sgt i32 %i403, %i501
  br i1 %i502, label %bb503, label %bb499.bb827_crit_edge

bb499.bb827_crit_edge:                            ; preds = %bb499
  br label %bb827

bb503:                                            ; preds = %bb499
  %i504 = add nsw i64 %i401, -2
  %i505 = getelementptr inbounds i32, ptr %arg1, i64 %i504
  %i506 = load i32, ptr %i505, align 4, !tbaa !16
  %i507 = icmp sgt i32 %i403, %i506
  br i1 %i507, label %bb508, label %bb503.bb827_crit_edge

bb503.bb827_crit_edge:                            ; preds = %bb503
  br label %bb827

bb508:                                            ; preds = %bb503
  %i509 = add nsw i64 %i401, -1
  %i510 = getelementptr inbounds i32, ptr %arg1, i64 %i509
  %i511 = load i32, ptr %i510, align 4, !tbaa !16
  %i512 = icmp sgt i32 %i403, %i511
  br i1 %i512, label %bb513, label %bb508.bb827_crit_edge

bb508.bb827_crit_edge:                            ; preds = %bb508
  br label %bb827

bb513:                                            ; preds = %bb508
  %i514 = add nuw nsw i64 %i401, 1
  %i515 = getelementptr inbounds i32, ptr %arg1, i64 %i514
  %i516 = load i32, ptr %i515, align 4, !tbaa !16
  %i517 = icmp slt i32 %i403, %i516
  br i1 %i517, label %bb513.bb827_crit_edge, label %bb518

bb513.bb827_crit_edge:                            ; preds = %bb513
  br label %bb827

bb518:                                            ; preds = %bb513
  %i519 = add nuw nsw i64 %i401, 2
  %i520 = getelementptr inbounds i32, ptr %arg1, i64 %i519
  %i521 = load i32, ptr %i520, align 4, !tbaa !16
  %i522 = icmp slt i32 %i403, %i521
  br i1 %i522, label %bb518.bb827_crit_edge, label %bb523

bb518.bb827_crit_edge:                            ; preds = %bb518
  br label %bb827

bb523:                                            ; preds = %bb518
  %i524 = getelementptr i32, ptr %i402, i64 3
  %i525 = load i32, ptr %i524, align 4, !tbaa !16
  %i526 = icmp slt i32 %i403, %i525
  br i1 %i526, label %bb523.bb827_crit_edge, label %bb527

bb523.bb827_crit_edge:                            ; preds = %bb523
  br label %bb827

bb527:                                            ; preds = %bb523
  %i528 = add nuw nsw i64 %i399, %i390
  %i529 = getelementptr i32, ptr %arg1, i64 %i528
  %i530 = getelementptr i32, ptr %i529, i64 -3
  %i531 = load i32, ptr %i530, align 4, !tbaa !16
  %i532 = icmp slt i32 %i403, %i531
  br i1 %i532, label %bb527.bb827_crit_edge, label %bb533

bb527.bb827_crit_edge:                            ; preds = %bb527
  br label %bb827

bb533:                                            ; preds = %bb527
  %i534 = add nsw i64 %i528, -2
  %i535 = getelementptr inbounds i32, ptr %arg1, i64 %i534
  %i536 = load i32, ptr %i535, align 4, !tbaa !16
  %i537 = icmp slt i32 %i403, %i536
  br i1 %i537, label %bb533.bb827_crit_edge, label %bb538

bb533.bb827_crit_edge:                            ; preds = %bb533
  br label %bb827

bb538:                                            ; preds = %bb533
  %i539 = add nsw i64 %i528, -1
  %i540 = getelementptr inbounds i32, ptr %arg1, i64 %i539
  %i541 = load i32, ptr %i540, align 4, !tbaa !16
  %i542 = icmp slt i32 %i403, %i541
  br i1 %i542, label %bb538.bb827_crit_edge, label %bb543

bb538.bb827_crit_edge:                            ; preds = %bb538
  br label %bb827

bb543:                                            ; preds = %bb538
  %i544 = load i32, ptr %i529, align 4, !tbaa !16
  %i545 = icmp slt i32 %i403, %i544
  br i1 %i545, label %bb543.bb827_crit_edge, label %bb546

bb543.bb827_crit_edge:                            ; preds = %bb543
  br label %bb827

bb546:                                            ; preds = %bb543
  %i547 = add nuw nsw i64 %i528, 1
  %i548 = getelementptr inbounds i32, ptr %arg1, i64 %i547
  %i549 = load i32, ptr %i548, align 4, !tbaa !16
  %i550 = icmp slt i32 %i403, %i549
  br i1 %i550, label %bb546.bb827_crit_edge, label %bb551

bb546.bb827_crit_edge:                            ; preds = %bb546
  br label %bb827

bb551:                                            ; preds = %bb546
  %i552 = add nuw nsw i64 %i528, 2
  %i553 = getelementptr inbounds i32, ptr %arg1, i64 %i552
  %i554 = load i32, ptr %i553, align 4, !tbaa !16
  %i555 = icmp slt i32 %i403, %i554
  br i1 %i555, label %bb551.bb827_crit_edge, label %bb556

bb551.bb827_crit_edge:                            ; preds = %bb551
  br label %bb827

bb556:                                            ; preds = %bb551
  %i557 = getelementptr i32, ptr %i529, i64 3
  %i558 = load i32, ptr %i557, align 4, !tbaa !16
  %i559 = icmp slt i32 %i403, %i558
  br i1 %i559, label %bb556.bb827_crit_edge, label %bb560

bb556.bb827_crit_edge:                            ; preds = %bb556
  br label %bb827

bb560:                                            ; preds = %bb556
  %i561 = add nuw nsw i64 %i399, %i392
  %i562 = getelementptr i32, ptr %arg1, i64 %i561
  %i563 = getelementptr i32, ptr %i562, i64 -3
  %i564 = load i32, ptr %i563, align 4, !tbaa !16
  %i565 = icmp slt i32 %i403, %i564
  br i1 %i565, label %bb560.bb827_crit_edge, label %bb566

bb560.bb827_crit_edge:                            ; preds = %bb560
  br label %bb827

bb566:                                            ; preds = %bb560
  %i567 = add nsw i64 %i561, -2
  %i568 = getelementptr inbounds i32, ptr %arg1, i64 %i567
  %i569 = load i32, ptr %i568, align 4, !tbaa !16
  %i570 = icmp slt i32 %i403, %i569
  br i1 %i570, label %bb566.bb827_crit_edge, label %bb571

bb566.bb827_crit_edge:                            ; preds = %bb566
  br label %bb827

bb571:                                            ; preds = %bb566
  %i572 = add nsw i64 %i561, -1
  %i573 = getelementptr inbounds i32, ptr %arg1, i64 %i572
  %i574 = load i32, ptr %i573, align 4, !tbaa !16
  %i575 = icmp slt i32 %i403, %i574
  br i1 %i575, label %bb571.bb827_crit_edge, label %bb576

bb571.bb827_crit_edge:                            ; preds = %bb571
  br label %bb827

bb576:                                            ; preds = %bb571
  %i577 = load i32, ptr %i562, align 4, !tbaa !16
  %i578 = icmp slt i32 %i403, %i577
  br i1 %i578, label %bb576.bb827_crit_edge, label %bb579

bb576.bb827_crit_edge:                            ; preds = %bb576
  br label %bb827

bb579:                                            ; preds = %bb576
  %i580 = add nuw nsw i64 %i561, 1
  %i581 = getelementptr inbounds i32, ptr %arg1, i64 %i580
  %i582 = load i32, ptr %i581, align 4, !tbaa !16
  %i583 = icmp slt i32 %i403, %i582
  br i1 %i583, label %bb579.bb827_crit_edge, label %bb584

bb579.bb827_crit_edge:                            ; preds = %bb579
  br label %bb827

bb584:                                            ; preds = %bb579
  %i585 = add nuw nsw i64 %i561, 2
  %i586 = getelementptr inbounds i32, ptr %arg1, i64 %i585
  %i587 = load i32, ptr %i586, align 4, !tbaa !16
  %i588 = icmp slt i32 %i403, %i587
  br i1 %i588, label %bb584.bb827_crit_edge, label %bb589

bb584.bb827_crit_edge:                            ; preds = %bb584
  br label %bb827

bb589:                                            ; preds = %bb584
  %i590 = getelementptr i32, ptr %i562, i64 3
  %i591 = load i32, ptr %i590, align 4, !tbaa !16
  %i592 = icmp slt i32 %i403, %i591
  br i1 %i592, label %bb589.bb827_crit_edge, label %bb593

bb589.bb827_crit_edge:                            ; preds = %bb589
  br label %bb827

bb593:                                            ; preds = %bb589
  %i594 = getelementptr i32, ptr %i396, i64 %i399
  %i595 = getelementptr i32, ptr %i594, i64 -3
  %i596 = load i32, ptr %i595, align 4, !tbaa !16
  %i597 = icmp slt i32 %i403, %i596
  br i1 %i597, label %bb593.bb827_crit_edge, label %bb598

bb593.bb827_crit_edge:                            ; preds = %bb593
  br label %bb827

bb598:                                            ; preds = %bb593
  %i599 = getelementptr i32, ptr %i594, i64 -2
  %i600 = load i32, ptr %i599, align 4, !tbaa !16
  %i601 = icmp slt i32 %i403, %i600
  br i1 %i601, label %bb598.bb827_crit_edge, label %bb602

bb598.bb827_crit_edge:                            ; preds = %bb598
  br label %bb827

bb602:                                            ; preds = %bb598
  %i603 = getelementptr i32, ptr %i594, i64 -1
  %i604 = load i32, ptr %i603, align 4, !tbaa !16
  %i605 = icmp slt i32 %i403, %i604
  br i1 %i605, label %bb602.bb827_crit_edge, label %bb606

bb602.bb827_crit_edge:                            ; preds = %bb602
  br label %bb827

bb606:                                            ; preds = %bb602
  %i607 = load i32, ptr %i594, align 4, !tbaa !16
  %i608 = icmp slt i32 %i403, %i607
  br i1 %i608, label %bb606.bb827_crit_edge, label %bb609

bb606.bb827_crit_edge:                            ; preds = %bb606
  br label %bb827

bb609:                                            ; preds = %bb606
  %i610 = getelementptr i32, ptr %i594, i64 1
  %i611 = load i32, ptr %i610, align 4, !tbaa !16
  %i612 = icmp slt i32 %i403, %i611
  br i1 %i612, label %bb609.bb827_crit_edge, label %bb613

bb609.bb827_crit_edge:                            ; preds = %bb609
  br label %bb827

bb613:                                            ; preds = %bb609
  %i614 = getelementptr i32, ptr %i594, i64 2
  %i615 = load i32, ptr %i614, align 4, !tbaa !16
  %i616 = icmp slt i32 %i403, %i615
  br i1 %i616, label %bb613.bb827_crit_edge, label %bb617

bb613.bb827_crit_edge:                            ; preds = %bb613
  br label %bb827

bb617:                                            ; preds = %bb613
  %i618 = getelementptr i32, ptr %i594, i64 3
  %i619 = load i32, ptr %i618, align 4, !tbaa !16
  %i620 = icmp slt i32 %i403, %i619
  br i1 %i620, label %bb617.bb827_crit_edge, label %bb621

bb617.bb827_crit_edge:                            ; preds = %bb617
  br label %bb827

bb621:                                            ; preds = %bb617
  %i622 = sext i32 %i400 to i64
  %i623 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i622
  %i624 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i622, i32 2
  store i32 0, ptr %i624, align 4, !tbaa !52
  %i625 = trunc i64 %i399 to i32
  store i32 %i625, ptr %i623, align 4, !tbaa !55
  %i626 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i622, i32 1
  store i32 %i397, ptr %i626, align 4, !tbaa !54
  %i627 = getelementptr inbounds i8, ptr %arg, i64 %i440
  %i628 = load i8, ptr %i627, align 1, !tbaa !21
  %i629 = zext i8 %i628 to i16
  %i630 = getelementptr inbounds i8, ptr %arg, i64 %i445
  %i631 = load i8, ptr %i630, align 1, !tbaa !21
  %i632 = zext i8 %i631 to i16
  %i633 = add nuw nsw i16 %i632, %i629
  %i634 = getelementptr inbounds i8, ptr %arg, i64 %i434
  %i635 = load i8, ptr %i634, align 1, !tbaa !21
  %i636 = zext i8 %i635 to i16
  %i637 = add nuw nsw i16 %i633, %i636
  %i638 = getelementptr inbounds i8, ptr %arg, i64 %i453
  %i639 = load i8, ptr %i638, align 1, !tbaa !21
  %i640 = zext i8 %i639 to i16
  %i641 = add nuw nsw i16 %i637, %i640
  %i642 = getelementptr inbounds i8, ptr %arg, i64 %i458
  %i643 = load i8, ptr %i642, align 1, !tbaa !21
  %i644 = zext i8 %i643 to i16
  %i645 = add nuw nsw i16 %i641, %i644
  %i646 = getelementptr inbounds i8, ptr %arg, i64 %i473
  %i647 = load i8, ptr %i646, align 1, !tbaa !21
  %i648 = zext i8 %i647 to i16
  %i649 = add nuw nsw i16 %i645, %i648
  %i650 = getelementptr inbounds i8, ptr %arg, i64 %i478
  %i651 = load i8, ptr %i650, align 1, !tbaa !21
  %i652 = zext i8 %i651 to i16
  %i653 = add nuw nsw i16 %i649, %i652
  %i654 = getelementptr inbounds i8, ptr %arg, i64 %i467
  %i655 = load i8, ptr %i654, align 1, !tbaa !21
  %i656 = zext i8 %i655 to i16
  %i657 = add nuw nsw i16 %i653, %i656
  %i658 = getelementptr inbounds i8, ptr %arg, i64 %i486
  %i659 = load i8, ptr %i658, align 1, !tbaa !21
  %i660 = zext i8 %i659 to i16
  %i661 = add nuw nsw i16 %i657, %i660
  %i662 = getelementptr inbounds i8, ptr %arg, i64 %i491
  %i663 = load i8, ptr %i662, align 1, !tbaa !21
  %i664 = zext i8 %i663 to i16
  %i665 = add nuw nsw i16 %i661, %i664
  %i666 = getelementptr inbounds i8, ptr %arg, i64 %i504
  %i667 = load i8, ptr %i666, align 1, !tbaa !21
  %i668 = zext i8 %i667 to i16
  %i669 = add nuw nsw i16 %i665, %i668
  %i670 = getelementptr inbounds i8, ptr %arg, i64 %i509
  %i671 = load i8, ptr %i670, align 1, !tbaa !21
  %i672 = zext i8 %i671 to i16
  %i673 = add nuw nsw i16 %i669, %i672
  %i674 = getelementptr inbounds i8, ptr %arg, i64 %i401
  %i675 = load i8, ptr %i674, align 1, !tbaa !21
  %i676 = zext i8 %i675 to i16
  %i677 = add nuw nsw i16 %i673, %i676
  %i678 = getelementptr inbounds i8, ptr %arg, i64 %i514
  %i679 = load i8, ptr %i678, align 1, !tbaa !21
  %i680 = zext i8 %i679 to i16
  %i681 = add nuw nsw i16 %i677, %i680
  %i682 = getelementptr inbounds i8, ptr %arg, i64 %i519
  %i683 = load i8, ptr %i682, align 1, !tbaa !21
  %i684 = zext i8 %i683 to i16
  %i685 = add nuw nsw i16 %i681, %i684
  %i686 = getelementptr inbounds i8, ptr %arg, i64 %i534
  %i687 = load i8, ptr %i686, align 1, !tbaa !21
  %i688 = zext i8 %i687 to i16
  %i689 = add nuw nsw i16 %i685, %i688
  %i690 = getelementptr inbounds i8, ptr %arg, i64 %i539
  %i691 = load i8, ptr %i690, align 1, !tbaa !21
  %i692 = zext i8 %i691 to i16
  %i693 = add nuw nsw i16 %i689, %i692
  %i694 = getelementptr inbounds i8, ptr %arg, i64 %i528
  %i695 = load i8, ptr %i694, align 1, !tbaa !21
  %i696 = zext i8 %i695 to i16
  %i697 = add nuw nsw i16 %i693, %i696
  %i698 = getelementptr inbounds i8, ptr %arg, i64 %i547
  %i699 = load i8, ptr %i698, align 1, !tbaa !21
  %i700 = zext i8 %i699 to i16
  %i701 = add nuw nsw i16 %i697, %i700
  %i702 = getelementptr inbounds i8, ptr %arg, i64 %i552
  %i703 = load i8, ptr %i702, align 1, !tbaa !21
  %i704 = zext i8 %i703 to i16
  %i705 = add nuw nsw i16 %i701, %i704
  %i706 = getelementptr inbounds i8, ptr %arg, i64 %i567
  %i707 = load i8, ptr %i706, align 1, !tbaa !21
  %i708 = zext i8 %i707 to i16
  %i709 = add nuw nsw i16 %i705, %i708
  %i710 = getelementptr inbounds i8, ptr %arg, i64 %i572
  %i711 = load i8, ptr %i710, align 1, !tbaa !21
  %i712 = zext i8 %i711 to i16
  %i713 = add nuw nsw i16 %i709, %i712
  %i714 = getelementptr inbounds i8, ptr %arg, i64 %i561
  %i715 = load i8, ptr %i714, align 1, !tbaa !21
  %i716 = zext i8 %i715 to i16
  %i717 = add nuw nsw i16 %i713, %i716
  %i718 = getelementptr inbounds i8, ptr %arg, i64 %i580
  %i719 = load i8, ptr %i718, align 1, !tbaa !21
  %i720 = zext i8 %i719 to i16
  %i721 = add nuw nsw i16 %i717, %i720
  %i722 = getelementptr inbounds i8, ptr %arg, i64 %i585
  %i723 = load i8, ptr %i722, align 1, !tbaa !21
  %i724 = zext i8 %i723 to i16
  %i725 = add nuw nsw i16 %i721, %i724
  %i726 = udiv i16 %i725, 25
  %i727 = zext nneg i16 %i726 to i32
  %i728 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i622, i32 5
  store i32 %i727, ptr %i728, align 4, !tbaa !61
  %i729 = load i8, ptr %i642, align 1, !tbaa !21
  %i730 = zext i8 %i729 to i32
  %i731 = load i8, ptr %i662, align 1, !tbaa !21
  %i732 = zext i8 %i731 to i32
  %i733 = load i8, ptr %i682, align 1, !tbaa !21
  %i734 = zext i8 %i733 to i32
  %i735 = load i8, ptr %i702, align 1, !tbaa !21
  %i736 = zext i8 %i735 to i32
  %i737 = load i8, ptr %i722, align 1, !tbaa !21
  %i738 = zext i8 %i737 to i32
  %i739 = load i8, ptr %i627, align 1, !tbaa !21
  %i740 = zext i8 %i739 to i32
  %i741 = load i8, ptr %i646, align 1, !tbaa !21
  %i742 = zext i8 %i741 to i32
  %i743 = load i8, ptr %i666, align 1, !tbaa !21
  %i744 = zext i8 %i743 to i32
  %i745 = load i8, ptr %i686, align 1, !tbaa !21
  %i746 = zext i8 %i745 to i32
  %i747 = load i8, ptr %i706, align 1, !tbaa !21
  %i748 = zext i8 %i747 to i32
  %i749 = add nuw nsw i32 %i732, %i730
  %i750 = add nuw nsw i32 %i749, %i734
  %i751 = add nuw nsw i32 %i750, %i736
  %i752 = add nuw nsw i32 %i751, %i738
  %i753 = add nuw nsw i32 %i740, %i742
  %i754 = add nuw nsw i32 %i753, %i744
  %i755 = add nuw nsw i32 %i754, %i746
  %i756 = add nuw nsw i32 %i755, %i748
  %i757 = sub nsw i32 %i752, %i756
  %i758 = load i8, ptr %i638, align 1, !tbaa !21
  %i759 = zext i8 %i758 to i32
  %i760 = load i8, ptr %i658, align 1, !tbaa !21
  %i761 = zext i8 %i760 to i32
  %i762 = load i8, ptr %i678, align 1, !tbaa !21
  %i763 = zext i8 %i762 to i32
  %i764 = load i8, ptr %i698, align 1, !tbaa !21
  %i765 = zext i8 %i764 to i32
  %i766 = load i8, ptr %i718, align 1, !tbaa !21
  %i767 = zext i8 %i766 to i32
  %i768 = load i8, ptr %i630, align 1, !tbaa !21
  %i769 = zext i8 %i768 to i32
  %i770 = load i8, ptr %i650, align 1, !tbaa !21
  %i771 = zext i8 %i770 to i32
  %i772 = load i8, ptr %i670, align 1, !tbaa !21
  %i773 = zext i8 %i772 to i32
  %i774 = load i8, ptr %i690, align 1, !tbaa !21
  %i775 = zext i8 %i774 to i32
  %i776 = load i8, ptr %i710, align 1, !tbaa !21
  %i777 = zext i8 %i776 to i32
  %i778 = shl nsw i32 %i757, 1
  %i779 = add nuw nsw i32 %i761, %i759
  %i780 = add i32 %i779, %i778
  %i781 = add i32 %i780, %i763
  %i782 = add i32 %i781, %i765
  %i783 = add i32 %i782, %i767
  %i784 = add nuw nsw i32 %i769, %i771
  %i785 = add nuw nsw i32 %i784, %i773
  %i786 = add nuw nsw i32 %i785, %i775
  %i787 = add nuw nsw i32 %i786, %i777
  %i788 = sub i32 %i783, %i787
  %i789 = load i8, ptr %i714, align 1, !tbaa !21
  %i790 = zext i8 %i789 to i32
  %i791 = load i8, ptr %i634, align 1, !tbaa !21
  %i792 = zext i8 %i791 to i32
  %i793 = add nuw nsw i32 %i730, %i740
  %i794 = add nuw nsw i32 %i738, %i748
  %i795 = add nuw nsw i32 %i793, %i759
  %i796 = add nuw nsw i32 %i794, %i767
  %i797 = add nuw nsw i32 %i795, %i769
  %i798 = sub nsw i32 %i796, %i797
  %i799 = add nsw i32 %i798, %i777
  %i800 = add nsw i32 %i799, %i790
  %i801 = sub nsw i32 %i800, %i792
  %i802 = load i8, ptr %i694, align 1, !tbaa !21
  %i803 = zext i8 %i802 to i32
  %i804 = load i8, ptr %i654, align 1, !tbaa !21
  %i805 = zext i8 %i804 to i32
  %i806 = shl nsw i32 %i801, 1
  %i807 = add nuw nsw i32 %i732, %i742
  %i808 = add nuw nsw i32 %i736, %i746
  %i809 = add nuw nsw i32 %i807, %i761
  %i810 = add nuw nsw i32 %i808, %i765
  %i811 = add nuw nsw i32 %i809, %i771
  %i812 = sub nsw i32 %i810, %i811
  %i813 = add nsw i32 %i812, %i775
  %i814 = add nsw i32 %i813, %i803
  %i815 = sub nsw i32 %i814, %i805
  %i816 = add i32 %i815, %i806
  %i817 = trunc i32 %i788 to i16
  %i818 = sdiv i16 %i817, 15
  %i819 = sext i16 %i818 to i32
  %i820 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i622, i32 3
  store i32 %i819, ptr %i820, align 4, !tbaa !59
  %i821 = trunc i32 %i816 to i16
  %i822 = sdiv i16 %i821, 15
  %i823 = sext i16 %i822 to i32
  %i824 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i622, i32 4
  store i32 %i823, ptr %i824, align 4, !tbaa !60
  %i825 = add nsw i32 %i400, 1
  %i826 = icmp eq i32 %i825, 15000
  br i1 %i826, label %bb833, label %bb621.bb827_crit_edge

bb621.bb827_crit_edge:                            ; preds = %bb621
  br label %bb827

bb827:                                            ; preds = %bb621.bb827_crit_edge, %bb617.bb827_crit_edge, %bb613.bb827_crit_edge, %bb609.bb827_crit_edge, %bb606.bb827_crit_edge, %bb602.bb827_crit_edge, %bb598.bb827_crit_edge, %bb593.bb827_crit_edge, %bb589.bb827_crit_edge, %bb584.bb827_crit_edge, %bb579.bb827_crit_edge, %bb576.bb827_crit_edge, %bb571.bb827_crit_edge, %bb566.bb827_crit_edge, %bb560.bb827_crit_edge, %bb556.bb827_crit_edge, %bb551.bb827_crit_edge, %bb546.bb827_crit_edge, %bb543.bb827_crit_edge, %bb538.bb827_crit_edge, %bb533.bb827_crit_edge, %bb527.bb827_crit_edge, %bb523.bb827_crit_edge, %bb518.bb827_crit_edge, %bb513.bb827_crit_edge, %bb508.bb827_crit_edge, %bb503.bb827_crit_edge, %bb499.bb827_crit_edge, %bb495.bb827_crit_edge, %bb490.bb827_crit_edge, %bb485.bb827_crit_edge, %bb482.bb827_crit_edge, %bb477.bb827_crit_edge, %bb472.bb827_crit_edge, %bb466.bb827_crit_edge, %bb462.bb827_crit_edge, %bb457.bb827_crit_edge, %bb452.bb827_crit_edge, %bb449.bb827_crit_edge, %bb444.bb827_crit_edge, %bb439.bb827_crit_edge, %bb433.bb827_crit_edge, %bb429.bb827_crit_edge, %bb425.bb827_crit_edge, %bb421.bb827_crit_edge, %bb418.bb827_crit_edge, %bb414.bb827_crit_edge, %bb410.bb827_crit_edge, %bb405.bb827_crit_edge, %bb398.bb827_crit_edge
  %i828 = phi i32 [ %i825, %bb621.bb827_crit_edge ], [ %i400, %bb617.bb827_crit_edge ], [ %i400, %bb613.bb827_crit_edge ], [ %i400, %bb609.bb827_crit_edge ], [ %i400, %bb606.bb827_crit_edge ], [ %i400, %bb602.bb827_crit_edge ], [ %i400, %bb598.bb827_crit_edge ], [ %i400, %bb593.bb827_crit_edge ], [ %i400, %bb589.bb827_crit_edge ], [ %i400, %bb584.bb827_crit_edge ], [ %i400, %bb579.bb827_crit_edge ], [ %i400, %bb576.bb827_crit_edge ], [ %i400, %bb571.bb827_crit_edge ], [ %i400, %bb566.bb827_crit_edge ], [ %i400, %bb560.bb827_crit_edge ], [ %i400, %bb556.bb827_crit_edge ], [ %i400, %bb551.bb827_crit_edge ], [ %i400, %bb546.bb827_crit_edge ], [ %i400, %bb543.bb827_crit_edge ], [ %i400, %bb538.bb827_crit_edge ], [ %i400, %bb533.bb827_crit_edge ], [ %i400, %bb527.bb827_crit_edge ], [ %i400, %bb523.bb827_crit_edge ], [ %i400, %bb518.bb827_crit_edge ], [ %i400, %bb513.bb827_crit_edge ], [ %i400, %bb508.bb827_crit_edge ], [ %i400, %bb503.bb827_crit_edge ], [ %i400, %bb499.bb827_crit_edge ], [ %i400, %bb495.bb827_crit_edge ], [ %i400, %bb490.bb827_crit_edge ], [ %i400, %bb485.bb827_crit_edge ], [ %i400, %bb482.bb827_crit_edge ], [ %i400, %bb477.bb827_crit_edge ], [ %i400, %bb472.bb827_crit_edge ], [ %i400, %bb466.bb827_crit_edge ], [ %i400, %bb462.bb827_crit_edge ], [ %i400, %bb457.bb827_crit_edge ], [ %i400, %bb452.bb827_crit_edge ], [ %i400, %bb449.bb827_crit_edge ], [ %i400, %bb444.bb827_crit_edge ], [ %i400, %bb439.bb827_crit_edge ], [ %i400, %bb433.bb827_crit_edge ], [ %i400, %bb429.bb827_crit_edge ], [ %i400, %bb425.bb827_crit_edge ], [ %i400, %bb421.bb827_crit_edge ], [ %i400, %bb418.bb827_crit_edge ], [ %i400, %bb414.bb827_crit_edge ], [ %i400, %bb410.bb827_crit_edge ], [ %i400, %bb405.bb827_crit_edge ], [ %i400, %bb398.bb827_crit_edge ]
  %i829 = add nuw nsw i64 %i399, 1
  %i830 = icmp eq i64 %i829, %i378
  br i1 %i830, label %bb831, label %bb827.bb398_crit_edge, !llvm.loop !66

bb827.bb398_crit_edge:                            ; preds = %bb827
  br label %bb398

bb831:                                            ; preds = %bb827
  %i832 = icmp eq i64 %i389, %i377
  br i1 %i832, label %bb836, label %bb831.bb379_crit_edge, !llvm.loop !67

bb831.bb379_crit_edge:                            ; preds = %bb831
  br label %bb379

bb833:                                            ; preds = %bb621
  %i834 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i835 = tail call i64 @fwrite(ptr nonnull @.str.29, i64 18, i64 1, ptr %i834) #22
  tail call void @exit(i32 noundef 1) #23
  unreachable

bb836:                                            ; preds = %bb831
  %i837 = sext i32 %i828 to i64
  br label %bb838

bb838:                                            ; preds = %bb836, %bb373.bb838_crit_edge, %bb11.bb838_crit_edge, %bb.bb838_crit_edge
  %i839 = phi i64 [ 0, %bb373.bb838_crit_edge ], [ %i837, %bb836 ], [ 0, %bb.bb838_crit_edge ], [ 0, %bb11.bb838_crit_edge ]
  %i840 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i839, i32 2
  store i32 7, ptr %i840, align 4, !tbaa !52
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
  %i24 = load i8, ptr %i23, align 1, !tbaa !21
  %i25 = icmp eq i8 %i24, 45
  br i1 %i25, label %bb26, label %bb61

bb26:                                             ; preds = %bb11
  %i27 = getelementptr inbounds i8, ptr %i23, i64 1
  %i28 = load i8, ptr %i27, align 1, !tbaa !21
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

bb62:                                             ; preds = %bb55, %bb49, %bb42.bb62_crit_edge, %bb36, %bb35, %bb34, %bb33, %bb32, %bb31, %bb30, %bb29, %bb26.bb62_crit_edge
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
  br i1 %i73, label %bb62.bb11_crit_edge, label %bb74.loopexit, !llvm.loop !68

bb62.bb11_crit_edge:                              ; preds = %bb62
  br label %bb11

bb74.loopexit:                                    ; preds = %bb62
  br label %bb74

bb74:                                             ; preds = %bb74.loopexit, %bb7.bb74_crit_edge
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
  switch i32 %i86, label %bb597 [
    i32 0, label %bb87
    i32 1, label %bb109
    i32 2, label %bb418
  ]

bb87:                                             ; preds = %bb74
  %i88 = tail call noalias dereferenceable_or_null(516) ptr @malloc(i64 noundef 516) #24
  %i89 = getelementptr inbounds i8, ptr %i88, i64 258
  %i90 = sitofp i32 %i75 to float
  br label %bb91

bb91:                                             ; preds = %bb91.bb91_crit_edge, %bb87
  %i92 = phi i64 [ %i103, %bb91.bb91_crit_edge ], [ -256, %bb87 ]
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
  store i8 %i101, ptr %i102, align 1, !tbaa !21
  %i103 = add nsw i64 %i92, 1
  %i104 = icmp eq i64 %i103, 257
  br i1 %i104, label %bb105, label %bb91.bb91_crit_edge, !llvm.loop !23

bb91.bb91_crit_edge:                              ; preds = %bb91
  br label %bb91

bb105:                                            ; preds = %bb91
  %i106 = load ptr, ptr %i, align 8, !tbaa !8
  %i107 = load i32, ptr %i2, align 4, !tbaa !16
  %i108 = load i32, ptr %i3, align 4, !tbaa !16
  tail call void @susan_smoothing(i32 noundef %i78, ptr noundef %i106, float noundef %i81, i32 noundef %i107, i32 noundef %i108, ptr noundef nonnull %i89)
  tail call void @free(ptr noundef nonnull %i88) #21
  br label %bb598

bb109:                                            ; preds = %bb74
  %i110 = load i32, ptr %i2, align 4, !tbaa !16
  %i111 = load i32, ptr %i3, align 4, !tbaa !16
  %i112 = mul nsw i32 %i111, %i110
  %i113 = sext i32 %i112 to i64
  %i114 = shl nsw i64 %i113, 2
  %i115 = tail call noalias ptr @malloc(i64 noundef %i114) #24
  %i116 = tail call noalias dereferenceable_or_null(516) ptr @malloc(i64 noundef 516) #24
  %i117 = getelementptr inbounds i8, ptr %i116, i64 258
  %i118 = sitofp i32 %i75 to float
  br label %bb119

bb119:                                            ; preds = %bb119.bb119_crit_edge, %bb109
  %i120 = phi i64 [ %i133, %bb119.bb119_crit_edge ], [ -256, %bb109 ]
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
  store i8 %i131, ptr %i132, align 1, !tbaa !21
  %i133 = add nsw i64 %i120, 1
  %i134 = icmp eq i64 %i133, 257
  br i1 %i134, label %bb135, label %bb119.bb119_crit_edge, !llvm.loop !23

bb119.bb119_crit_edge:                            ; preds = %bb119
  br label %bb119

bb135:                                            ; preds = %bb119
  %i136 = icmp eq i32 %i76, 0
  br i1 %i136, label %bb326, label %bb137

bb137:                                            ; preds = %bb135
  %i138 = icmp eq i32 %i78, 0
  %i139 = load ptr, ptr %i, align 8, !tbaa !8
  br i1 %i138, label %bb241, label %bb140

bb140:                                            ; preds = %bb137
  tail call void @llvm.memset.p0.i64(ptr align 4 %i115, i8 0, i64 %i114, i1 false)
  %i141 = add i32 %i111, -1
  %i142 = icmp sgt i32 %i111, 2
  br i1 %i142, label %bb143, label %bb140.bb242_crit_edge

bb140.bb242_crit_edge:                            ; preds = %bb140
  br label %bb242

bb143:                                            ; preds = %bb140
  %i144 = icmp sgt i32 %i110, 2
  %i145 = add nsw i32 %i110, -2
  %i146 = sext i32 %i145 to i64
  br i1 %i144, label %bb147, label %bb143.bb242_crit_edge

bb143.bb242_crit_edge:                            ; preds = %bb143
  br label %bb242

bb147:                                            ; preds = %bb143
  %i148 = add nsw i32 %i110, -1
  %i149 = zext nneg i32 %i110 to i64
  %i150 = zext nneg i32 %i141 to i64
  %i151 = zext nneg i32 %i148 to i64
  br label %bb152

bb152:                                            ; preds = %bb238.bb152_crit_edge, %bb147
  %i153 = phi i64 [ 1, %bb147 ], [ %i239, %bb238.bb152_crit_edge ]
  %i154 = add nsw i64 %i153, -1
  %i155 = mul nuw nsw i64 %i154, %i149
  %i156 = getelementptr inbounds i8, ptr %i139, i64 %i155
  %i157 = trunc i64 %i153 to i32
  %i158 = mul i32 %i110, %i157
  %i159 = zext i32 %i158 to i64
  br label %bb160

bb160:                                            ; preds = %bb235.bb160_crit_edge, %bb152
  %i161 = phi i64 [ 1, %bb152 ], [ %i236, %bb235.bb160_crit_edge ]
  %i162 = getelementptr inbounds i8, ptr %i156, i64 %i161
  %i163 = getelementptr inbounds i8, ptr %i162, i64 -1
  %i164 = add nuw nsw i64 %i161, %i159
  %i165 = getelementptr inbounds i8, ptr %i139, i64 %i164
  %i166 = load i8, ptr %i165, align 1, !tbaa !21
  %i167 = zext i8 %i166 to i64
  %i168 = getelementptr inbounds i8, ptr %i117, i64 %i167
  %i169 = load i8, ptr %i163, align 1, !tbaa !21
  %i170 = zext i8 %i169 to i64
  %i171 = sub nsw i64 0, %i170
  %i172 = getelementptr inbounds i8, ptr %i168, i64 %i171
  %i173 = load i8, ptr %i172, align 1, !tbaa !21
  %i174 = zext i8 %i173 to i32
  %i175 = add nuw nsw i32 %i174, 100
  %i176 = getelementptr inbounds i8, ptr %i162, i64 1
  %i177 = load i8, ptr %i162, align 1, !tbaa !21
  %i178 = zext i8 %i177 to i64
  %i179 = sub nsw i64 0, %i178
  %i180 = getelementptr inbounds i8, ptr %i168, i64 %i179
  %i181 = load i8, ptr %i180, align 1, !tbaa !21
  %i182 = zext i8 %i181 to i32
  %i183 = add nuw nsw i32 %i175, %i182
  %i184 = load i8, ptr %i176, align 1, !tbaa !21
  %i185 = zext i8 %i184 to i64
  %i186 = sub nsw i64 0, %i185
  %i187 = getelementptr inbounds i8, ptr %i168, i64 %i186
  %i188 = load i8, ptr %i187, align 1, !tbaa !21
  %i189 = zext i8 %i188 to i32
  %i190 = add nuw nsw i32 %i183, %i189
  %i191 = getelementptr inbounds i8, ptr %i176, i64 %i146
  %i192 = load i8, ptr %i191, align 1, !tbaa !21
  %i193 = zext i8 %i192 to i64
  %i194 = sub nsw i64 0, %i193
  %i195 = getelementptr inbounds i8, ptr %i168, i64 %i194
  %i196 = load i8, ptr %i195, align 1, !tbaa !21
  %i197 = zext i8 %i196 to i32
  %i198 = add nuw nsw i32 %i190, %i197
  %i199 = getelementptr inbounds i8, ptr %i191, i64 2
  %i200 = load i8, ptr %i199, align 1, !tbaa !21
  %i201 = zext i8 %i200 to i64
  %i202 = sub nsw i64 0, %i201
  %i203 = getelementptr inbounds i8, ptr %i168, i64 %i202
  %i204 = load i8, ptr %i203, align 1, !tbaa !21
  %i205 = zext i8 %i204 to i32
  %i206 = add nuw nsw i32 %i198, %i205
  %i207 = getelementptr inbounds i8, ptr %i199, i64 %i146
  %i208 = getelementptr inbounds i8, ptr %i207, i64 1
  %i209 = load i8, ptr %i207, align 1, !tbaa !21
  %i210 = zext i8 %i209 to i64
  %i211 = sub nsw i64 0, %i210
  %i212 = getelementptr inbounds i8, ptr %i168, i64 %i211
  %i213 = load i8, ptr %i212, align 1, !tbaa !21
  %i214 = zext i8 %i213 to i32
  %i215 = add nuw nsw i32 %i206, %i214
  %i216 = getelementptr inbounds i8, ptr %i207, i64 2
  %i217 = load i8, ptr %i208, align 1, !tbaa !21
  %i218 = zext i8 %i217 to i64
  %i219 = sub nsw i64 0, %i218
  %i220 = getelementptr inbounds i8, ptr %i168, i64 %i219
  %i221 = load i8, ptr %i220, align 1, !tbaa !21
  %i222 = zext i8 %i221 to i32
  %i223 = add nuw nsw i32 %i215, %i222
  %i224 = load i8, ptr %i216, align 1, !tbaa !21
  %i225 = zext i8 %i224 to i64
  %i226 = sub nsw i64 0, %i225
  %i227 = getelementptr inbounds i8, ptr %i168, i64 %i226
  %i228 = load i8, ptr %i227, align 1, !tbaa !21
  %i229 = zext i8 %i228 to i32
  %i230 = add nuw nsw i32 %i223, %i229
  %i231 = icmp ult i32 %i230, 731
  br i1 %i231, label %bb232, label %bb160.bb235_crit_edge

bb160.bb235_crit_edge:                            ; preds = %bb160
  br label %bb235

bb232:                                            ; preds = %bb160
  %i233 = sub nuw nsw i32 730, %i230
  %i234 = getelementptr inbounds i32, ptr %i115, i64 %i164
  store i32 %i233, ptr %i234, align 4, !tbaa !16
  br label %bb235

bb235:                                            ; preds = %bb232, %bb160.bb235_crit_edge
  %i236 = add nuw nsw i64 %i161, 1
  %i237 = icmp eq i64 %i236, %i151
  br i1 %i237, label %bb238, label %bb235.bb160_crit_edge, !llvm.loop !26

bb235.bb160_crit_edge:                            ; preds = %bb235
  br label %bb160

bb238:                                            ; preds = %bb235
  %i239 = add nuw nsw i64 %i153, 1
  %i240 = icmp eq i64 %i239, %i150
  br i1 %i240, label %bb242.loopexit, label %bb238.bb152_crit_edge, !llvm.loop !27

bb238.bb152_crit_edge:                            ; preds = %bb238
  br label %bb152

bb241:                                            ; preds = %bb137
  tail call void @susan_principle(ptr noundef %i139, ptr noundef %i115, ptr noundef nonnull %i117, i32 noundef 2650, i32 noundef %i110, i32 noundef %i111)
  br label %bb242

bb242.loopexit:                                   ; preds = %bb238
  br label %bb242

bb242:                                            ; preds = %bb242.loopexit, %bb241, %bb143.bb242_crit_edge, %bb140.bb242_crit_edge
  %i243 = icmp sgt i32 %i112, 0
  br i1 %i243, label %bb244, label %bb242.bb417_crit_edge

bb242.bb417_crit_edge:                            ; preds = %bb242
  br label %bb417

bb244:                                            ; preds = %bb242
  %i245 = load i32, ptr %i115, align 4, !tbaa !16
  %i246 = zext nneg i32 %i112 to i64
  %i247 = and i64 %i246, 3
  %i248 = icmp ult i32 %i112, 4
  br i1 %i248, label %bb244.bb278_crit_edge, label %bb249

bb244.bb278_crit_edge:                            ; preds = %bb244
  br label %bb278

bb249:                                            ; preds = %bb244
  %i250 = and i64 %i246, 2147483644
  br label %bb251

bb251:                                            ; preds = %bb251.bb251_crit_edge, %bb249
  %i252 = phi i64 [ 0, %bb249 ], [ %i275, %bb251.bb251_crit_edge ]
  %i253 = phi i32 [ %i245, %bb249 ], [ %i274, %bb251.bb251_crit_edge ]
  %i254 = phi i32 [ %i245, %bb249 ], [ %i273, %bb251.bb251_crit_edge ]
  %i255 = phi i64 [ 0, %bb249 ], [ %i276, %bb251.bb251_crit_edge ]
  %i256 = getelementptr inbounds i32, ptr %i115, i64 %i252
  %i257 = load i32, ptr %i256, align 4, !tbaa !16
  %i258 = tail call i32 @llvm.smax.i32(i32 %i257, i32 %i254)
  %i259 = tail call i32 @llvm.smin.i32(i32 %i257, i32 %i253)
  %i260 = or disjoint i64 %i252, 1
  %i261 = getelementptr inbounds i32, ptr %i115, i64 %i260
  %i262 = load i32, ptr %i261, align 4, !tbaa !16
  %i263 = tail call i32 @llvm.smax.i32(i32 %i262, i32 %i258)
  %i264 = tail call i32 @llvm.smin.i32(i32 %i262, i32 %i259)
  %i265 = or disjoint i64 %i252, 2
  %i266 = getelementptr inbounds i32, ptr %i115, i64 %i265
  %i267 = load i32, ptr %i266, align 4, !tbaa !16
  %i268 = tail call i32 @llvm.smax.i32(i32 %i267, i32 %i263)
  %i269 = tail call i32 @llvm.smin.i32(i32 %i267, i32 %i264)
  %i270 = or disjoint i64 %i252, 3
  %i271 = getelementptr inbounds i32, ptr %i115, i64 %i270
  %i272 = load i32, ptr %i271, align 4, !tbaa !16
  %i273 = tail call i32 @llvm.smax.i32(i32 %i272, i32 %i268)
  %i274 = tail call i32 @llvm.smin.i32(i32 %i272, i32 %i269)
  %i275 = add nuw nsw i64 %i252, 4
  %i276 = add i64 %i255, 4
  %i277 = icmp eq i64 %i276, %i250
  br i1 %i277, label %bb278.loopexit, label %bb251.bb251_crit_edge, !llvm.loop !18

bb251.bb251_crit_edge:                            ; preds = %bb251
  br label %bb251

bb278.loopexit:                                   ; preds = %bb251
  br label %bb278

bb278:                                            ; preds = %bb278.loopexit, %bb244.bb278_crit_edge
  %i279 = phi i32 [ undef, %bb244.bb278_crit_edge ], [ %i273, %bb278.loopexit ]
  %i280 = phi i32 [ undef, %bb244.bb278_crit_edge ], [ %i274, %bb278.loopexit ]
  %i281 = phi i64 [ 0, %bb244.bb278_crit_edge ], [ %i275, %bb278.loopexit ]
  %i282 = phi i32 [ %i245, %bb244.bb278_crit_edge ], [ %i274, %bb278.loopexit ]
  %i283 = phi i32 [ %i245, %bb244.bb278_crit_edge ], [ %i273, %bb278.loopexit ]
  %i284 = icmp eq i64 %i247, 0
  br i1 %i284, label %bb278.bb297_crit_edge, label %bb285.preheader

bb278.bb297_crit_edge:                            ; preds = %bb278
  br label %bb297

bb285.preheader:                                  ; preds = %bb278
  br label %bb285

bb285:                                            ; preds = %bb285.bb285_crit_edge, %bb285.preheader
  %i286 = phi i64 [ %i294, %bb285.bb285_crit_edge ], [ %i281, %bb285.preheader ]
  %i287 = phi i32 [ %i293, %bb285.bb285_crit_edge ], [ %i282, %bb285.preheader ]
  %i288 = phi i32 [ %i292, %bb285.bb285_crit_edge ], [ %i283, %bb285.preheader ]
  %i289 = phi i64 [ %i295, %bb285.bb285_crit_edge ], [ 0, %bb285.preheader ]
  %i290 = getelementptr inbounds i32, ptr %i115, i64 %i286
  %i291 = load i32, ptr %i290, align 4, !tbaa !16
  %i292 = tail call i32 @llvm.smax.i32(i32 %i291, i32 %i288)
  %i293 = tail call i32 @llvm.smin.i32(i32 %i291, i32 %i287)
  %i294 = add nuw nsw i64 %i286, 1
  %i295 = add i64 %i289, 1
  %i296 = icmp eq i64 %i295, %i247
  br i1 %i296, label %bb297.loopexit, label %bb285.bb285_crit_edge, !llvm.loop !69

bb285.bb285_crit_edge:                            ; preds = %bb285
  br label %bb285

bb297.loopexit:                                   ; preds = %bb285
  br label %bb297

bb297:                                            ; preds = %bb297.loopexit, %bb278.bb297_crit_edge
  %i298 = phi i32 [ %i279, %bb278.bb297_crit_edge ], [ %i292, %bb297.loopexit ]
  %i299 = phi i32 [ %i280, %bb278.bb297_crit_edge ], [ %i293, %bb297.loopexit ]
  %i300 = sub nsw i32 %i298, %i299
  %i301 = and i64 %i246, 1
  %i302 = icmp eq i32 %i112, 1
  br i1 %i302, label %bb297.bb406_crit_edge, label %bb303

bb297.bb406_crit_edge:                            ; preds = %bb297
  br label %bb406

bb303:                                            ; preds = %bb297
  %i304 = and i64 %i246, 2147483646
  br label %bb305

bb305:                                            ; preds = %bb305.bb305_crit_edge, %bb303
  %i306 = phi i64 [ 0, %bb303 ], [ %i323, %bb305.bb305_crit_edge ]
  %i307 = phi i64 [ 0, %bb303 ], [ %i324, %bb305.bb305_crit_edge ]
  %i308 = getelementptr inbounds i32, ptr %i115, i64 %i306
  %i309 = load i32, ptr %i308, align 4, !tbaa !16
  %i310 = sub nsw i32 %i309, %i299
  %i311 = mul nsw i32 %i310, 255
  %i312 = sdiv i32 %i311, %i300
  %i313 = trunc i32 %i312 to i8
  %i314 = getelementptr inbounds i8, ptr %i139, i64 %i306
  store i8 %i313, ptr %i314, align 1, !tbaa !21
  %i315 = or disjoint i64 %i306, 1
  %i316 = getelementptr inbounds i32, ptr %i115, i64 %i315
  %i317 = load i32, ptr %i316, align 4, !tbaa !16
  %i318 = sub nsw i32 %i317, %i299
  %i319 = mul nsw i32 %i318, 255
  %i320 = sdiv i32 %i319, %i300
  %i321 = trunc i32 %i320 to i8
  %i322 = getelementptr inbounds i8, ptr %i139, i64 %i315
  store i8 %i321, ptr %i322, align 1, !tbaa !21
  %i323 = add nuw nsw i64 %i306, 2
  %i324 = add i64 %i307, 2
  %i325 = icmp eq i64 %i324, %i304
  br i1 %i325, label %bb406.loopexit, label %bb305.bb305_crit_edge, !llvm.loop !22

bb305.bb305_crit_edge:                            ; preds = %bb305
  br label %bb305

bb326:                                            ; preds = %bb135
  %i327 = tail call noalias ptr @malloc(i64 noundef %i113) #24
  tail call void @llvm.memset.p0.i64(ptr align 1 %i327, i8 100, i64 %i113, i1 false)
  %i328 = icmp eq i32 %i78, 0
  %i329 = load ptr, ptr %i, align 8, !tbaa !8
  br i1 %i328, label %bb331, label %bb330

bb330:                                            ; preds = %bb326
  tail call void @susan_edges_small(ptr noundef %i329, ptr noundef %i115, ptr noundef %i327, ptr noundef nonnull %i117, i32 poison, i32 noundef %i110, i32 noundef %i111)
  br label %bb332

bb331:                                            ; preds = %bb326
  tail call void @susan_edges(ptr noundef %i329, ptr noundef %i115, ptr noundef %i327, ptr noundef nonnull %i117, i32 noundef 2650, i32 noundef %i110, i32 noundef %i111)
  br label %bb332

bb332:                                            ; preds = %bb331, %bb330
  %i333 = icmp eq i32 %i77, 0
  br i1 %i333, label %bb332.bb335_crit_edge, label %bb334

bb332.bb335_crit_edge:                            ; preds = %bb332
  br label %bb335

bb334:                                            ; preds = %bb332
  tail call void @susan_thin(ptr noundef %i115, ptr noundef %i327, i32 noundef %i110, i32 noundef %i111)
  br label %bb335

bb335:                                            ; preds = %bb334, %bb332.bb335_crit_edge
  %i336 = icmp eq i32 %i79, 0
  br i1 %i336, label %bb337, label %bb335.bb366_crit_edge

bb335.bb366_crit_edge:                            ; preds = %bb335
  br label %bb366

bb337:                                            ; preds = %bb335
  %i338 = icmp sgt i32 %i112, 0
  br i1 %i338, label %bb339, label %bb337.bb405_crit_edge

bb337.bb405_crit_edge:                            ; preds = %bb337
  br label %bb405

bb339:                                            ; preds = %bb337
  %i340 = ptrtoint ptr %i327 to i64
  %i341 = sext i32 %i110 to i64
  %i342 = sub nsw i64 0, %i341
  %i343 = getelementptr i8, ptr %i329, i64 %i342
  %i344 = add nsw i32 %i110, -2
  %i345 = sext i32 %i344 to i64
  br label %bb346

bb346:                                            ; preds = %bb362.bb346_crit_edge, %bb339
  %i347 = phi ptr [ %i327, %bb339 ], [ %i363, %bb362.bb346_crit_edge ]
  %i348 = phi i32 [ 0, %bb339 ], [ %i364, %bb362.bb346_crit_edge ]
  %i349 = load i8, ptr %i347, align 1, !tbaa !21
  %i350 = icmp ult i8 %i349, 8
  br i1 %i350, label %bb351, label %bb346.bb362_crit_edge

bb346.bb362_crit_edge:                            ; preds = %bb346
  br label %bb362

bb351:                                            ; preds = %bb346
  %i352 = ptrtoint ptr %i347 to i64
  %i353 = sub i64 %i352, %i340
  %i354 = getelementptr i8, ptr %i343, i64 %i353
  %i355 = getelementptr inbounds i8, ptr %i354, i64 -1
  store i8 -1, ptr %i355, align 1, !tbaa !21
  %i356 = getelementptr inbounds i8, ptr %i354, i64 1
  store i8 -1, ptr %i354, align 1, !tbaa !21
  store i8 -1, ptr %i356, align 1, !tbaa !21
  %i357 = getelementptr inbounds i8, ptr %i356, i64 %i345
  store i8 -1, ptr %i357, align 1, !tbaa !21
  %i358 = getelementptr inbounds i8, ptr %i357, i64 2
  store i8 -1, ptr %i358, align 1, !tbaa !21
  %i359 = getelementptr inbounds i8, ptr %i358, i64 %i345
  %i360 = getelementptr inbounds i8, ptr %i359, i64 1
  store i8 -1, ptr %i359, align 1, !tbaa !21
  %i361 = getelementptr inbounds i8, ptr %i359, i64 2
  store i8 -1, ptr %i360, align 1, !tbaa !21
  store i8 -1, ptr %i361, align 1, !tbaa !21
  br label %bb362

bb362:                                            ; preds = %bb351, %bb346.bb362_crit_edge
  %i363 = getelementptr inbounds i8, ptr %i347, i64 1
  %i364 = add nuw nsw i32 %i348, 1
  %i365 = icmp eq i32 %i364, %i112
  br i1 %i365, label %bb366.loopexit, label %bb362.bb346_crit_edge, !llvm.loop !41

bb362.bb346_crit_edge:                            ; preds = %bb362
  br label %bb346

bb366.loopexit:                                   ; preds = %bb362
  br label %bb366

bb366:                                            ; preds = %bb366.loopexit, %bb335.bb366_crit_edge
  %i367 = icmp sgt i32 %i112, 0
  br i1 %i367, label %bb368, label %bb366.bb405_crit_edge

bb366.bb405_crit_edge:                            ; preds = %bb366
  br label %bb405

bb368:                                            ; preds = %bb366
  %i369 = ptrtoint ptr %i327 to i64
  %i370 = and i32 %i112, 1
  %i371 = icmp eq i32 %i112, 1
  br i1 %i371, label %bb368.bb395_crit_edge, label %bb372

bb368.bb395_crit_edge:                            ; preds = %bb368
  br label %bb395

bb372:                                            ; preds = %bb368
  %i373 = and i32 %i112, 2147483646
  br label %bb374

bb374:                                            ; preds = %bb391.bb374_crit_edge, %bb372
  %i375 = phi ptr [ %i327, %bb372 ], [ %i392, %bb391.bb374_crit_edge ]
  %i376 = phi i32 [ 0, %bb372 ], [ %i393, %bb391.bb374_crit_edge ]
  %i377 = load i8, ptr %i375, align 1, !tbaa !21
  %i378 = icmp ult i8 %i377, 8
  br i1 %i378, label %bb379, label %bb374.bb383_crit_edge

bb374.bb383_crit_edge:                            ; preds = %bb374
  br label %bb383

bb379:                                            ; preds = %bb374
  %i380 = ptrtoint ptr %i375 to i64
  %i381 = sub i64 %i380, %i369
  %i382 = getelementptr inbounds i8, ptr %i329, i64 %i381
  store i8 0, ptr %i382, align 1, !tbaa !21
  br label %bb383

bb383:                                            ; preds = %bb379, %bb374.bb383_crit_edge
  %i384 = getelementptr inbounds i8, ptr %i375, i64 1
  %i385 = load i8, ptr %i384, align 1, !tbaa !21
  %i386 = icmp ult i8 %i385, 8
  br i1 %i386, label %bb387, label %bb383.bb391_crit_edge

bb383.bb391_crit_edge:                            ; preds = %bb383
  br label %bb391

bb387:                                            ; preds = %bb383
  %i388 = ptrtoint ptr %i384 to i64
  %i389 = sub i64 %i388, %i369
  %i390 = getelementptr inbounds i8, ptr %i329, i64 %i389
  store i8 0, ptr %i390, align 1, !tbaa !21
  br label %bb391

bb391:                                            ; preds = %bb387, %bb383.bb391_crit_edge
  %i392 = getelementptr inbounds i8, ptr %i375, i64 2
  %i393 = add i32 %i376, 2
  %i394 = icmp eq i32 %i393, %i373
  br i1 %i394, label %bb395.loopexit, label %bb391.bb374_crit_edge, !llvm.loop !42

bb391.bb374_crit_edge:                            ; preds = %bb391
  br label %bb374

bb395.loopexit:                                   ; preds = %bb391
  br label %bb395

bb395:                                            ; preds = %bb395.loopexit, %bb368.bb395_crit_edge
  %i396 = phi ptr [ %i327, %bb368.bb395_crit_edge ], [ %i392, %bb395.loopexit ]
  %i397 = icmp eq i32 %i370, 0
  br i1 %i397, label %bb395.bb405_crit_edge, label %bb398

bb395.bb405_crit_edge:                            ; preds = %bb395
  br label %bb405

bb398:                                            ; preds = %bb395
  %i399 = load i8, ptr %i396, align 1, !tbaa !21
  %i400 = icmp ult i8 %i399, 8
  br i1 %i400, label %bb401, label %bb398.bb405_crit_edge

bb398.bb405_crit_edge:                            ; preds = %bb398
  br label %bb405

bb401:                                            ; preds = %bb398
  %i402 = ptrtoint ptr %i396 to i64
  %i403 = sub i64 %i402, %i369
  %i404 = getelementptr inbounds i8, ptr %i329, i64 %i403
  store i8 0, ptr %i404, align 1, !tbaa !21
  br label %bb405

bb405:                                            ; preds = %bb401, %bb398.bb405_crit_edge, %bb395.bb405_crit_edge, %bb366.bb405_crit_edge, %bb337.bb405_crit_edge
  tail call void @free(ptr noundef %i327) #21
  br label %bb417

bb406.loopexit:                                   ; preds = %bb305
  br label %bb406

bb406:                                            ; preds = %bb406.loopexit, %bb297.bb406_crit_edge
  %i407 = phi i64 [ 0, %bb297.bb406_crit_edge ], [ %i323, %bb406.loopexit ]
  %i408 = icmp eq i64 %i301, 0
  br i1 %i408, label %bb406.bb417_crit_edge, label %bb409

bb406.bb417_crit_edge:                            ; preds = %bb406
  br label %bb417

bb409:                                            ; preds = %bb406
  %i410 = getelementptr inbounds i32, ptr %i115, i64 %i407
  %i411 = load i32, ptr %i410, align 4, !tbaa !16
  %i412 = sub nsw i32 %i411, %i299
  %i413 = mul nsw i32 %i412, 255
  %i414 = sdiv i32 %i413, %i300
  %i415 = trunc i32 %i414 to i8
  %i416 = getelementptr inbounds i8, ptr %i139, i64 %i407
  store i8 %i415, ptr %i416, align 1, !tbaa !21
  br label %bb417

bb417:                                            ; preds = %bb409, %bb406.bb417_crit_edge, %bb405, %bb242.bb417_crit_edge
  tail call void @free(ptr noundef nonnull %i116) #21
  tail call void @free(ptr noundef %i115) #21
  br label %bb598

bb418:                                            ; preds = %bb74
  %i419 = load i32, ptr %i2, align 4, !tbaa !16
  %i420 = load i32, ptr %i3, align 4, !tbaa !16
  %i421 = mul nsw i32 %i420, %i419
  %i422 = sext i32 %i421 to i64
  %i423 = shl nsw i64 %i422, 2
  %i424 = tail call noalias ptr @malloc(i64 noundef %i423) #24
  %i425 = tail call noalias dereferenceable_or_null(516) ptr @malloc(i64 noundef 516) #24
  %i426 = getelementptr inbounds i8, ptr %i425, i64 258
  %i427 = sitofp i32 %i75 to float
  br label %bb428

bb428:                                            ; preds = %bb428.bb428_crit_edge, %bb418
  %i429 = phi i64 [ %i442, %bb428.bb428_crit_edge ], [ -256, %bb418 ]
  %i430 = trunc i64 %i429 to i32
  %i431 = sitofp i32 %i430 to float
  %i432 = fdiv float %i431, %i427
  %i433 = fpext float %i432 to double
  %i434 = fmul double %i433, %i433
  %i435 = fmul double %i434, %i434
  %i436 = fneg double %i434
  %i437 = fmul double %i435, %i436
  %i438 = tail call double @exp(double noundef %i437) #21
  %i439 = fmul double %i438, 1.000000e+02
  %i440 = fptoui double %i439 to i8
  %i441 = getelementptr inbounds i8, ptr %i426, i64 %i429
  store i8 %i440, ptr %i441, align 1, !tbaa !21
  %i442 = add nsw i64 %i429, 1
  %i443 = icmp eq i64 %i442, 257
  br i1 %i443, label %bb444, label %bb428.bb428_crit_edge, !llvm.loop !23

bb428.bb428_crit_edge:                            ; preds = %bb428
  br label %bb428

bb444:                                            ; preds = %bb428
  %i445 = icmp eq i32 %i76, 0
  br i1 %i445, label %bb531, label %bb446

bb446:                                            ; preds = %bb444
  %i447 = load ptr, ptr %i, align 8, !tbaa !8
  tail call void @susan_principle(ptr noundef %i447, ptr noundef %i424, ptr noundef nonnull %i426, i32 noundef 1850, i32 noundef %i419, i32 noundef %i420)
  %i448 = icmp sgt i32 %i421, 0
  br i1 %i448, label %bb449, label %bb446.bb596_crit_edge

bb446.bb596_crit_edge:                            ; preds = %bb446
  br label %bb596

bb449:                                            ; preds = %bb446
  %i450 = load i32, ptr %i424, align 4, !tbaa !16
  %i451 = zext nneg i32 %i421 to i64
  %i452 = and i64 %i451, 3
  %i453 = icmp ult i32 %i421, 4
  br i1 %i453, label %bb449.bb483_crit_edge, label %bb454

bb449.bb483_crit_edge:                            ; preds = %bb449
  br label %bb483

bb454:                                            ; preds = %bb449
  %i455 = and i64 %i451, 2147483644
  br label %bb456

bb456:                                            ; preds = %bb456.bb456_crit_edge, %bb454
  %i457 = phi i64 [ 0, %bb454 ], [ %i480, %bb456.bb456_crit_edge ]
  %i458 = phi i32 [ %i450, %bb454 ], [ %i479, %bb456.bb456_crit_edge ]
  %i459 = phi i32 [ %i450, %bb454 ], [ %i478, %bb456.bb456_crit_edge ]
  %i460 = phi i64 [ 0, %bb454 ], [ %i481, %bb456.bb456_crit_edge ]
  %i461 = getelementptr inbounds i32, ptr %i424, i64 %i457
  %i462 = load i32, ptr %i461, align 4, !tbaa !16
  %i463 = tail call i32 @llvm.smax.i32(i32 %i462, i32 %i459)
  %i464 = tail call i32 @llvm.smin.i32(i32 %i462, i32 %i458)
  %i465 = or disjoint i64 %i457, 1
  %i466 = getelementptr inbounds i32, ptr %i424, i64 %i465
  %i467 = load i32, ptr %i466, align 4, !tbaa !16
  %i468 = tail call i32 @llvm.smax.i32(i32 %i467, i32 %i463)
  %i469 = tail call i32 @llvm.smin.i32(i32 %i467, i32 %i464)
  %i470 = or disjoint i64 %i457, 2
  %i471 = getelementptr inbounds i32, ptr %i424, i64 %i470
  %i472 = load i32, ptr %i471, align 4, !tbaa !16
  %i473 = tail call i32 @llvm.smax.i32(i32 %i472, i32 %i468)
  %i474 = tail call i32 @llvm.smin.i32(i32 %i472, i32 %i469)
  %i475 = or disjoint i64 %i457, 3
  %i476 = getelementptr inbounds i32, ptr %i424, i64 %i475
  %i477 = load i32, ptr %i476, align 4, !tbaa !16
  %i478 = tail call i32 @llvm.smax.i32(i32 %i477, i32 %i473)
  %i479 = tail call i32 @llvm.smin.i32(i32 %i477, i32 %i474)
  %i480 = add nuw nsw i64 %i457, 4
  %i481 = add i64 %i460, 4
  %i482 = icmp eq i64 %i481, %i455
  br i1 %i482, label %bb483.loopexit, label %bb456.bb456_crit_edge, !llvm.loop !18

bb456.bb456_crit_edge:                            ; preds = %bb456
  br label %bb456

bb483.loopexit:                                   ; preds = %bb456
  br label %bb483

bb483:                                            ; preds = %bb483.loopexit, %bb449.bb483_crit_edge
  %i484 = phi i32 [ undef, %bb449.bb483_crit_edge ], [ %i478, %bb483.loopexit ]
  %i485 = phi i32 [ undef, %bb449.bb483_crit_edge ], [ %i479, %bb483.loopexit ]
  %i486 = phi i64 [ 0, %bb449.bb483_crit_edge ], [ %i480, %bb483.loopexit ]
  %i487 = phi i32 [ %i450, %bb449.bb483_crit_edge ], [ %i479, %bb483.loopexit ]
  %i488 = phi i32 [ %i450, %bb449.bb483_crit_edge ], [ %i478, %bb483.loopexit ]
  %i489 = icmp eq i64 %i452, 0
  br i1 %i489, label %bb483.bb502_crit_edge, label %bb490.preheader

bb483.bb502_crit_edge:                            ; preds = %bb483
  br label %bb502

bb490.preheader:                                  ; preds = %bb483
  br label %bb490

bb490:                                            ; preds = %bb490.bb490_crit_edge, %bb490.preheader
  %i491 = phi i64 [ %i499, %bb490.bb490_crit_edge ], [ %i486, %bb490.preheader ]
  %i492 = phi i32 [ %i498, %bb490.bb490_crit_edge ], [ %i487, %bb490.preheader ]
  %i493 = phi i32 [ %i497, %bb490.bb490_crit_edge ], [ %i488, %bb490.preheader ]
  %i494 = phi i64 [ %i500, %bb490.bb490_crit_edge ], [ 0, %bb490.preheader ]
  %i495 = getelementptr inbounds i32, ptr %i424, i64 %i491
  %i496 = load i32, ptr %i495, align 4, !tbaa !16
  %i497 = tail call i32 @llvm.smax.i32(i32 %i496, i32 %i493)
  %i498 = tail call i32 @llvm.smin.i32(i32 %i496, i32 %i492)
  %i499 = add nuw nsw i64 %i491, 1
  %i500 = add i64 %i494, 1
  %i501 = icmp eq i64 %i500, %i452
  br i1 %i501, label %bb502.loopexit, label %bb490.bb490_crit_edge, !llvm.loop !70

bb490.bb490_crit_edge:                            ; preds = %bb490
  br label %bb490

bb502.loopexit:                                   ; preds = %bb490
  br label %bb502

bb502:                                            ; preds = %bb502.loopexit, %bb483.bb502_crit_edge
  %i503 = phi i32 [ %i484, %bb483.bb502_crit_edge ], [ %i497, %bb502.loopexit ]
  %i504 = phi i32 [ %i485, %bb483.bb502_crit_edge ], [ %i498, %bb502.loopexit ]
  %i505 = sub nsw i32 %i503, %i504
  %i506 = and i64 %i451, 1
  %i507 = icmp eq i32 %i421, 1
  br i1 %i507, label %bb502.bb585_crit_edge, label %bb508

bb502.bb585_crit_edge:                            ; preds = %bb502
  br label %bb585

bb508:                                            ; preds = %bb502
  %i509 = and i64 %i451, 2147483646
  br label %bb510

bb510:                                            ; preds = %bb510.bb510_crit_edge, %bb508
  %i511 = phi i64 [ 0, %bb508 ], [ %i528, %bb510.bb510_crit_edge ]
  %i512 = phi i64 [ 0, %bb508 ], [ %i529, %bb510.bb510_crit_edge ]
  %i513 = getelementptr inbounds i32, ptr %i424, i64 %i511
  %i514 = load i32, ptr %i513, align 4, !tbaa !16
  %i515 = sub nsw i32 %i514, %i504
  %i516 = mul nsw i32 %i515, 255
  %i517 = sdiv i32 %i516, %i505
  %i518 = trunc i32 %i517 to i8
  %i519 = getelementptr inbounds i8, ptr %i447, i64 %i511
  store i8 %i518, ptr %i519, align 1, !tbaa !21
  %i520 = or disjoint i64 %i511, 1
  %i521 = getelementptr inbounds i32, ptr %i424, i64 %i520
  %i522 = load i32, ptr %i521, align 4, !tbaa !16
  %i523 = sub nsw i32 %i522, %i504
  %i524 = mul nsw i32 %i523, 255
  %i525 = sdiv i32 %i524, %i505
  %i526 = trunc i32 %i525 to i8
  %i527 = getelementptr inbounds i8, ptr %i447, i64 %i520
  store i8 %i526, ptr %i527, align 1, !tbaa !21
  %i528 = add nuw nsw i64 %i511, 2
  %i529 = add i64 %i512, 2
  %i530 = icmp eq i64 %i529, %i509
  br i1 %i530, label %bb585.loopexit, label %bb510.bb510_crit_edge, !llvm.loop !22

bb510.bb510_crit_edge:                            ; preds = %bb510
  br label %bb510

bb531:                                            ; preds = %bb444
  %i532 = icmp eq i32 %i80, 0
  %i533 = load ptr, ptr %i, align 8, !tbaa !8
  br i1 %i532, label %bb535, label %bb534

bb534:                                            ; preds = %bb531
  call void @susan_corners_quick(ptr noundef %i533, ptr noundef %i424, ptr noundef nonnull %i426, i32 noundef 1850, ptr noundef nonnull %i4, i32 noundef %i419, i32 noundef %i420)
  br label %bb536

bb535:                                            ; preds = %bb531
  call void @susan_corners(ptr noundef %i533, ptr noundef %i424, ptr noundef nonnull %i426, i32 noundef 1850, ptr noundef nonnull %i4, i32 noundef %i419, i32 noundef %i420)
  br label %bb536

bb536:                                            ; preds = %bb535, %bb534
  %i537 = getelementptr inbounds %struct.anon, ptr %i4, i64 0, i32 2
  %i538 = load i32, ptr %i537, align 8, !tbaa !52
  %i539 = icmp eq i32 %i538, 7
  br i1 %i539, label %bb536.bb596_crit_edge, label %bb540

bb536.bb596_crit_edge:                            ; preds = %bb536
  br label %bb596

bb540:                                            ; preds = %bb536
  %i541 = icmp eq i32 %i79, 0
  %i542 = add nsw i32 %i419, -2
  %i543 = sext i32 %i542 to i64
  br i1 %i541, label %bb544.preheader, label %bb569.preheader

bb569.preheader:                                  ; preds = %bb540
  br label %bb569

bb544.preheader:                                  ; preds = %bb540
  br label %bb544

bb544:                                            ; preds = %bb544.bb544_crit_edge, %bb544.preheader
  %i545 = phi i64 [ %i564, %bb544.bb544_crit_edge ], [ 0, %bb544.preheader ]
  %i546 = phi ptr [ %i565, %bb544.bb544_crit_edge ], [ %i4, %bb544.preheader ]
  %i547 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i545, i32 1
  %i548 = load i32, ptr %i547, align 4, !tbaa !54
  %i549 = add nsw i32 %i548, -1
  %i550 = mul nsw i32 %i549, %i419
  %i551 = sext i32 %i550 to i64
  %i552 = getelementptr inbounds i8, ptr %i533, i64 %i551
  %i553 = load i32, ptr %i546, align 4, !tbaa !55
  %i554 = sext i32 %i553 to i64
  %i555 = getelementptr inbounds i8, ptr %i552, i64 %i554
  %i556 = getelementptr inbounds i8, ptr %i555, i64 -1
  store i8 -1, ptr %i556, align 1, !tbaa !21
  %i557 = getelementptr inbounds i8, ptr %i555, i64 1
  store i8 -1, ptr %i555, align 1, !tbaa !21
  store i8 -1, ptr %i557, align 1, !tbaa !21
  %i558 = getelementptr inbounds i8, ptr %i557, i64 %i543
  %i559 = getelementptr inbounds i8, ptr %i558, i64 1
  store i8 -1, ptr %i558, align 1, !tbaa !21
  %i560 = getelementptr inbounds i8, ptr %i558, i64 2
  store i8 0, ptr %i559, align 1, !tbaa !21
  store i8 -1, ptr %i560, align 1, !tbaa !21
  %i561 = getelementptr inbounds i8, ptr %i560, i64 %i543
  %i562 = getelementptr inbounds i8, ptr %i561, i64 1
  store i8 -1, ptr %i561, align 1, !tbaa !21
  %i563 = getelementptr inbounds i8, ptr %i561, i64 2
  store i8 -1, ptr %i562, align 1, !tbaa !21
  store i8 -1, ptr %i563, align 1, !tbaa !21
  %i564 = add nuw nsw i64 %i545, 1
  %i565 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i564
  %i566 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i564, i32 2
  %i567 = load i32, ptr %i566, align 8, !tbaa !52
  %i568 = icmp eq i32 %i567, 7
  br i1 %i568, label %bb596.loopexit, label %bb544.bb544_crit_edge, !llvm.loop !56

bb544.bb544_crit_edge:                            ; preds = %bb544
  br label %bb544

bb569:                                            ; preds = %bb569.bb569_crit_edge, %bb569.preheader
  %i570 = phi i64 [ %i580, %bb569.bb569_crit_edge ], [ 0, %bb569.preheader ]
  %i571 = phi ptr [ %i581, %bb569.bb569_crit_edge ], [ %i4, %bb569.preheader ]
  %i572 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i570, i32 1
  %i573 = load i32, ptr %i572, align 4, !tbaa !54
  %i574 = mul nsw i32 %i573, %i419
  %i575 = sext i32 %i574 to i64
  %i576 = getelementptr inbounds i8, ptr %i533, i64 %i575
  %i577 = load i32, ptr %i571, align 4, !tbaa !55
  %i578 = sext i32 %i577 to i64
  %i579 = getelementptr inbounds i8, ptr %i576, i64 %i578
  store i8 0, ptr %i579, align 1, !tbaa !21
  %i580 = add nuw nsw i64 %i570, 1
  %i581 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i580
  %i582 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i580, i32 2
  %i583 = load i32, ptr %i582, align 8, !tbaa !52
  %i584 = icmp eq i32 %i583, 7
  br i1 %i584, label %bb596.loopexit1, label %bb569.bb569_crit_edge, !llvm.loop !56

bb569.bb569_crit_edge:                            ; preds = %bb569
  br label %bb569

bb585.loopexit:                                   ; preds = %bb510
  br label %bb585

bb585:                                            ; preds = %bb585.loopexit, %bb502.bb585_crit_edge
  %i586 = phi i64 [ 0, %bb502.bb585_crit_edge ], [ %i528, %bb585.loopexit ]
  %i587 = icmp eq i64 %i506, 0
  br i1 %i587, label %bb585.bb596_crit_edge, label %bb588

bb585.bb596_crit_edge:                            ; preds = %bb585
  br label %bb596

bb588:                                            ; preds = %bb585
  %i589 = getelementptr inbounds i32, ptr %i424, i64 %i586
  %i590 = load i32, ptr %i589, align 4, !tbaa !16
  %i591 = sub nsw i32 %i590, %i504
  %i592 = mul nsw i32 %i591, 255
  %i593 = sdiv i32 %i592, %i505
  %i594 = trunc i32 %i593 to i8
  %i595 = getelementptr inbounds i8, ptr %i447, i64 %i586
  store i8 %i594, ptr %i595, align 1, !tbaa !21
  br label %bb596

bb596.loopexit:                                   ; preds = %bb544
  br label %bb596

bb596.loopexit1:                                  ; preds = %bb569
  br label %bb596

bb596:                                            ; preds = %bb596.loopexit1, %bb596.loopexit, %bb588, %bb585.bb596_crit_edge, %bb536.bb596_crit_edge, %bb446.bb596_crit_edge
  tail call void @free(ptr noundef nonnull %i425) #21
  tail call void @free(ptr noundef %i424) #21
  br label %bb598

bb597:                                            ; preds = %bb74
  unreachable

bb598:                                            ; preds = %bb596, %bb417, %bb105
  %i599 = getelementptr inbounds ptr, ptr %arg1, i64 2
  %i600 = load ptr, ptr %i599, align 8, !tbaa !8
  %i601 = load ptr, ptr %i, align 8, !tbaa !8
  %i602 = load i32, ptr %i2, align 4, !tbaa !16
  %i603 = load i32, ptr %i3, align 4, !tbaa !16
  tail call void @put_image(ptr noundef %i600, ptr noundef %i601, i32 noundef %i602, i32 noundef %i603)
  tail call void @free(ptr noundef %i601) #21
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
attributes #16 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !10, i64 0}
!18 = distinct !{!18, !15}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = !{!10, !10, i64 0}
!22 = distinct !{!22, !15}
!23 = distinct !{!23, !15}
!24 = distinct !{!24, !15}
!25 = distinct !{!25, !15}
!26 = distinct !{!26, !15}
!27 = distinct !{!27, !15}
!28 = distinct !{!28, !15}
!29 = distinct !{!29, !15}
!30 = distinct !{!30, !15}
!31 = distinct !{!31, !15}
!32 = distinct !{!32, !15}
!33 = distinct !{!33, !15}
!34 = distinct !{!34, !15}
!35 = distinct !{!35, !15}
!36 = distinct !{!36, !15}
!37 = distinct !{!37, !15}
!38 = distinct !{!38, !15}
!39 = distinct !{!39, !15, !40}
!40 = !{!"llvm.loop.unswitch.partial.disable"}
!41 = distinct !{!41, !15}
!42 = distinct !{!42, !15}
!43 = distinct !{!43, !15}
!44 = distinct !{!44, !15}
!45 = distinct !{!45, !15}
!46 = distinct !{!46, !15}
!47 = distinct !{!47, !15}
!48 = distinct !{!48, !15}
!49 = distinct !{!49, !15}
!50 = distinct !{!50, !15}
!51 = distinct !{!51, !15}
!52 = !{!53, !17, i64 8}
!53 = !{!"", !17, i64 0, !17, i64 4, !17, i64 8, !17, i64 12, !17, i64 16, !17, i64 20}
!54 = !{!53, !17, i64 4}
!55 = !{!53, !17, i64 0}
!56 = distinct !{!56, !15}
!57 = distinct !{!57, !15}
!58 = distinct !{!58, !15}
!59 = !{!53, !17, i64 12}
!60 = !{!53, !17, i64 16}
!61 = !{!53, !17, i64 20}
!62 = distinct !{!62, !15}
!63 = distinct !{!63, !15}
!64 = distinct !{!64, !15}
!65 = distinct !{!65, !15}
!66 = distinct !{!66, !15}
!67 = distinct !{!67, !15}
!68 = distinct !{!68, !15}
!69 = distinct !{!69, !20}
!70 = distinct !{!70, !20}
