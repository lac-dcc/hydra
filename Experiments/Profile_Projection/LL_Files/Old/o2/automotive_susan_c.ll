; ModuleID = 'automotive_susan_c.ll'
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
  store i8 %i19, ptr %i21, align 1, !tbaa !21
  %i22 = add nsw i64 %i7, 1
  %i23 = icmp eq i64 %i22, 257
  br i1 %i23, label %bb24, label %bb6.bb6_crit_edge, !llvm.loop !23

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
  %i19 = zext nneg i32 %i10 to i64
  %i20 = zext nneg i32 %i11 to i64
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
  %i331 = icmp eq i64 %i330, %i20
  br i1 %i331, label %bb332.loopexit, label %bb329.bb30_crit_edge, !llvm.loop !24

bb329.bb30_crit_edge:                             ; preds = %bb329
  br label %bb30

bb332.loopexit:                                   ; preds = %bb329
  br label %bb332

bb332:                                            ; preds = %bb332.loopexit, %bb21.bb332_crit_edge
  %i333 = add nuw nsw i64 %i22, 1
  %i334 = icmp eq i64 %i333, %i19
  br i1 %i334, label %bb335.loopexit, label %bb332.bb21_crit_edge, !llvm.loop !25

bb332.bb21_crit_edge:                             ; preds = %bb332
  br label %bb21

bb335.loopexit:                                   ; preds = %bb332
  br label %bb335

bb335:                                            ; preds = %bb335.loopexit, %bb.bb335_crit_edge
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
  %i16 = zext nneg i32 %i10 to i64
  %i17 = zext nneg i32 %i11 to i64
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
  %i58 = getelementptr inbounds i8, ptr %i43, i64 %i14
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
  %i74 = getelementptr inbounds i8, ptr %i66, i64 %i14
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
  %i104 = icmp eq i64 %i103, %i17
  br i1 %i104, label %bb105.loopexit, label %bb102.bb27_crit_edge, !llvm.loop !26

bb102.bb27_crit_edge:                             ; preds = %bb102
  br label %bb27

bb105.loopexit:                                   ; preds = %bb102
  br label %bb105

bb105:                                            ; preds = %bb105.loopexit, %bb18.bb105_crit_edge
  %i106 = add nuw nsw i64 %i19, 1
  %i107 = icmp eq i64 %i106, %i16
  br i1 %i107, label %bb108.loopexit, label %bb105.bb18_crit_edge, !llvm.loop !27

bb105.bb18_crit_edge:                             ; preds = %bb105
  br label %bb18

bb108.loopexit:                                   ; preds = %bb105
  br label %bb108

bb108:                                            ; preds = %bb108.loopexit, %bb.bb108_crit_edge
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
  br i1 %i8, label %bb38, label %bb33

bb33:                                             ; preds = %bb27
  %i34 = load i32, ptr %i7, align 4, !tbaa !16
  %i35 = icmp sgt i32 %i34, 2
  br i1 %i35, label %bb36, label %bb33.bb532_crit_edge

bb33.bb532_crit_edge:                             ; preds = %bb33
  br label %bb532

bb36:                                             ; preds = %bb33
  %i37 = load i32, ptr %i6, align 4, !tbaa !16
  br label %bb304

bb38:                                             ; preds = %bb27
  %i39 = load i32, ptr %i6, align 4, !tbaa !16
  %i40 = sub nsw i32 %i39, %i21
  %i41 = mul nsw i32 %i21, %i21
  %i42 = zext nneg i32 %i41 to i64
  %i43 = tail call noalias ptr @malloc(i64 noundef %i42) #24
  %i44 = fneg float %arg2
  %i45 = fmul float %i44, %arg2
  %i46 = xor i32 %i11, -1
  %i47 = icmp slt i32 %i12, %i46
  br i1 %i47, label %bb38.bb52_crit_edge, label %bb48.preheader

bb38.bb52_crit_edge:                              ; preds = %bb38
  br label %bb52

bb48.preheader:                                   ; preds = %bb38
  br label %bb48

bb48:                                             ; preds = %bb86.bb48_crit_edge, %bb48.preheader
  %i49 = phi ptr [ %i83, %bb86.bb48_crit_edge ], [ %i43, %bb48.preheader ]
  %i50 = phi i32 [ %i87, %bb86.bb48_crit_edge ], [ %i46, %bb48.preheader ]
  %i51 = mul nsw i32 %i50, %i50
  br label %bb71

bb52.loopexit:                                    ; preds = %bb86
  br label %bb52

bb52:                                             ; preds = %bb52.loopexit, %bb38.bb52_crit_edge
  %i53 = load i32, ptr %i7, align 4, !tbaa !16
  %i54 = sub nsw i32 %i53, %i13
  %i55 = icmp slt i32 %i13, %i54
  br i1 %i55, label %bb56, label %bb52.bb303_crit_edge

bb52.bb303_crit_edge:                             ; preds = %bb52
  br label %bb303

bb56:                                             ; preds = %bb52
  %i57 = sub nsw i32 0, %i13
  %i58 = sext i32 %i57 to i64
  %i59 = sext i32 %i40 to i64
  %i60 = add i32 %i13, %i11
  %i61 = add i32 %i60, 1
  %i62 = zext i32 %i61 to i64
  %i63 = add nuw nsw i64 %i62, 1
  %i64 = sext i32 %i13 to i64
  %i65 = load i32, ptr %i6, align 4, !tbaa !16
  %i66 = add i32 %i13, %i11
  %i67 = and i32 %i60, 1
  %i68 = icmp eq i32 %i67, 0
  %i69 = sub i32 0, %i11
  %i70 = icmp eq i32 %i66, -1
  br label %bb89

bb71:                                             ; preds = %bb71.bb71_crit_edge, %bb48
  %i72 = phi ptr [ %i49, %bb48 ], [ %i83, %bb71.bb71_crit_edge ]
  %i73 = phi i32 [ %i46, %bb48 ], [ %i84, %bb71.bb71_crit_edge ]
  %i74 = mul nsw i32 %i73, %i73
  %i75 = add nuw nsw i32 %i74, %i51
  %i76 = sitofp i32 %i75 to float
  %i77 = fdiv float %i76, %i45
  %i78 = fpext float %i77 to double
  %i79 = tail call double @exp(double noundef %i78) #21
  %i80 = fmul double %i79, 1.000000e+02
  %i81 = fptosi double %i80 to i32
  %i82 = trunc i32 %i81 to i8
  %i83 = getelementptr inbounds i8, ptr %i72, i64 1
  store i8 %i82, ptr %i72, align 1, !tbaa !21
  %i84 = add i32 %i73, 1
  %i85 = icmp eq i32 %i73, %i13
  br i1 %i85, label %bb86, label %bb71.bb71_crit_edge, !llvm.loop !32

bb71.bb71_crit_edge:                              ; preds = %bb71
  br label %bb71

bb86:                                             ; preds = %bb71
  %i87 = add i32 %i50, 1
  %i88 = icmp eq i32 %i50, %i13
  br i1 %i88, label %bb52.loopexit, label %bb86.bb48_crit_edge, !llvm.loop !33

bb86.bb48_crit_edge:                              ; preds = %bb86
  br label %bb48

bb89:                                             ; preds = %bb296.bb89_crit_edge, %bb56
  %i90 = phi i32 [ %i53, %bb56 ], [ %i298, %bb296.bb89_crit_edge ]
  %i91 = phi i32 [ %i65, %bb56 ], [ %i299, %bb296.bb89_crit_edge ]
  %i92 = phi ptr [ %arg1, %bb56 ], [ %i300, %bb296.bb89_crit_edge ]
  %i93 = phi i32 [ %i13, %bb56 ], [ %i297, %bb296.bb89_crit_edge ]
  %i94 = sub nsw i32 %i91, %i13
  %i95 = icmp slt i32 %i13, %i94
  br i1 %i95, label %bb98, label %bb96

bb96:                                             ; preds = %bb89
  %i97 = add nsw i32 %i93, 1
  br label %bb296

bb98:                                             ; preds = %bb89
  %i99 = sub nsw i32 %i93, %i13
  %i100 = add nsw i32 %i93, -1
  %i101 = add nsw i32 %i93, 1
  br label %bb102

bb102:                                            ; preds = %bb285.bb102_crit_edge, %bb98
  %i103 = phi i64 [ %i64, %bb98 ], [ %i289, %bb285.bb102_crit_edge ]
  %i104 = phi i32 [ %i91, %bb98 ], [ %i290, %bb285.bb102_crit_edge ]
  %i105 = phi ptr [ %i92, %bb98 ], [ %i288, %bb285.bb102_crit_edge ]
  %i106 = load ptr, ptr %i, align 8, !tbaa !8
  %i107 = mul nsw i32 %i104, %i93
  %i108 = sext i32 %i107 to i64
  %i109 = getelementptr i8, ptr %i106, i64 %i103
  %i110 = getelementptr i8, ptr %i109, i64 %i108
  %i111 = load i8, ptr %i110, align 1, !tbaa !21
  %i112 = zext i8 %i111 to i32
  %i113 = zext i8 %i111 to i64
  %i114 = getelementptr inbounds i8, ptr %arg5, i64 %i113
  br i1 %i47, label %bb102.bb279_crit_edge, label %bb115

bb102.bb279_crit_edge:                            ; preds = %bb102
  br label %bb279

bb115:                                            ; preds = %bb102
  %i116 = mul nsw i32 %i104, %i99
  %i117 = sext i32 %i116 to i64
  %i118 = getelementptr inbounds i8, ptr %i106, i64 %i117
  %i119 = getelementptr inbounds i8, ptr %i118, i64 %i103
  %i120 = getelementptr inbounds i8, ptr %i119, i64 %i58
  br label %bb121

bb121:                                            ; preds = %bb191.bb121_crit_edge, %bb115
  %i122 = phi i32 [ %i193, %bb191.bb121_crit_edge ], [ 0, %bb115 ]
  %i123 = phi ptr [ %i194, %bb191.bb121_crit_edge ], [ %i43, %bb115 ]
  %i124 = phi ptr [ %i195, %bb191.bb121_crit_edge ], [ %i120, %bb115 ]
  %i125 = phi i32 [ %i192, %bb191.bb121_crit_edge ], [ 0, %bb115 ]
  %i126 = phi i32 [ %i196, %bb191.bb121_crit_edge ], [ %i46, %bb115 ]
  %i127 = getelementptr i8, ptr %i124, i64 %i63
  br i1 %i68, label %bb121.bb144_crit_edge, label %bb128

bb121.bb144_crit_edge:                            ; preds = %bb121
  br label %bb144

bb128:                                            ; preds = %bb121
  %i129 = getelementptr inbounds i8, ptr %i124, i64 1
  %i130 = load i8, ptr %i124, align 1, !tbaa !21
  %i131 = zext i8 %i130 to i32
  %i132 = getelementptr inbounds i8, ptr %i123, i64 1
  %i133 = load i8, ptr %i123, align 1, !tbaa !21
  %i134 = zext i8 %i133 to i32
  %i135 = zext i8 %i130 to i64
  %i136 = sub nsw i64 0, %i135
  %i137 = getelementptr inbounds i8, ptr %i114, i64 %i136
  %i138 = load i8, ptr %i137, align 1, !tbaa !21
  %i139 = zext i8 %i138 to i32
  %i140 = mul nuw nsw i32 %i139, %i134
  %i141 = add nsw i32 %i140, %i125
  %i142 = mul nuw nsw i32 %i140, %i131
  %i143 = add nsw i32 %i142, %i122
  br label %bb144

bb144:                                            ; preds = %bb128, %bb121.bb144_crit_edge
  %i145 = phi i32 [ undef, %bb121.bb144_crit_edge ], [ %i141, %bb128 ]
  %i146 = phi i32 [ undef, %bb121.bb144_crit_edge ], [ %i143, %bb128 ]
  %i147 = phi i32 [ %i122, %bb121.bb144_crit_edge ], [ %i143, %bb128 ]
  %i148 = phi ptr [ %i123, %bb121.bb144_crit_edge ], [ %i132, %bb128 ]
  %i149 = phi ptr [ %i124, %bb121.bb144_crit_edge ], [ %i129, %bb128 ]
  %i150 = phi i32 [ %i125, %bb121.bb144_crit_edge ], [ %i141, %bb128 ]
  %i151 = phi i32 [ %i46, %bb121.bb144_crit_edge ], [ %i69, %bb128 ]
  br i1 %i70, label %bb144.bb191_crit_edge, label %bb152.preheader

bb144.bb191_crit_edge:                            ; preds = %bb144
  br label %bb191

bb152.preheader:                                  ; preds = %bb144
  br label %bb152

bb152:                                            ; preds = %bb152.bb152_crit_edge, %bb152.preheader
  %i153 = phi i32 [ %i188, %bb152.bb152_crit_edge ], [ %i147, %bb152.preheader ]
  %i154 = phi ptr [ %i177, %bb152.bb152_crit_edge ], [ %i148, %bb152.preheader ]
  %i155 = phi ptr [ %i174, %bb152.bb152_crit_edge ], [ %i149, %bb152.preheader ]
  %i156 = phi i32 [ %i186, %bb152.bb152_crit_edge ], [ %i150, %bb152.preheader ]
  %i157 = phi i32 [ %i189, %bb152.bb152_crit_edge ], [ %i151, %bb152.preheader ]
  %i158 = getelementptr inbounds i8, ptr %i155, i64 1
  %i159 = load i8, ptr %i155, align 1, !tbaa !21
  %i160 = zext i8 %i159 to i32
  %i161 = getelementptr inbounds i8, ptr %i154, i64 1
  %i162 = load i8, ptr %i154, align 1, !tbaa !21
  %i163 = zext i8 %i162 to i32
  %i164 = zext i8 %i159 to i64
  %i165 = sub nsw i64 0, %i164
  %i166 = getelementptr inbounds i8, ptr %i114, i64 %i165
  %i167 = load i8, ptr %i166, align 1, !tbaa !21
  %i168 = zext i8 %i167 to i32
  %i169 = mul nuw nsw i32 %i168, %i163
  %i170 = add nsw i32 %i169, %i156
  %i171 = mul nuw nsw i32 %i169, %i160
  %i172 = add nsw i32 %i171, %i153
  %i173 = add i32 %i157, 1
  %i174 = getelementptr inbounds i8, ptr %i155, i64 2
  %i175 = load i8, ptr %i158, align 1, !tbaa !21
  %i176 = zext i8 %i175 to i32
  %i177 = getelementptr inbounds i8, ptr %i154, i64 2
  %i178 = load i8, ptr %i161, align 1, !tbaa !21
  %i179 = zext i8 %i178 to i32
  %i180 = zext i8 %i175 to i64
  %i181 = sub nsw i64 0, %i180
  %i182 = getelementptr inbounds i8, ptr %i114, i64 %i181
  %i183 = load i8, ptr %i182, align 1, !tbaa !21
  %i184 = zext i8 %i183 to i32
  %i185 = mul nuw nsw i32 %i184, %i179
  %i186 = add nsw i32 %i185, %i170
  %i187 = mul nuw nsw i32 %i185, %i176
  %i188 = add nsw i32 %i187, %i172
  %i189 = add i32 %i157, 2
  %i190 = icmp eq i32 %i173, %i13
  br i1 %i190, label %bb191.loopexit, label %bb152.bb152_crit_edge, !llvm.loop !34

bb152.bb152_crit_edge:                            ; preds = %bb152
  br label %bb152

bb191.loopexit:                                   ; preds = %bb152
  br label %bb191

bb191:                                            ; preds = %bb191.loopexit, %bb144.bb191_crit_edge
  %i192 = phi i32 [ %i145, %bb144.bb191_crit_edge ], [ %i186, %bb191.loopexit ]
  %i193 = phi i32 [ %i146, %bb144.bb191_crit_edge ], [ %i188, %bb191.loopexit ]
  %i194 = getelementptr i8, ptr %i123, i64 %i63
  %i195 = getelementptr inbounds i8, ptr %i127, i64 %i59
  %i196 = add i32 %i126, 1
  %i197 = icmp eq i32 %i126, %i13
  br i1 %i197, label %bb198, label %bb191.bb121_crit_edge, !llvm.loop !35

bb191.bb121_crit_edge:                            ; preds = %bb191
  br label %bb121

bb198:                                            ; preds = %bb191
  %i199 = add nsw i32 %i192, -10000
  %i200 = icmp eq i32 %i199, 0
  br i1 %i200, label %bb201, label %bb198.bb279_crit_edge

bb198.bb279_crit_edge:                            ; preds = %bb198
  br label %bb279

bb201:                                            ; preds = %bb198
  %i202 = mul nsw i32 %i104, %i100
  %i203 = sext i32 %i202 to i64
  %i204 = getelementptr i8, ptr %i106, i64 %i103
  %i205 = getelementptr i8, ptr %i204, i64 %i203
  %i206 = getelementptr i8, ptr %i205, i64 -1
  %i207 = load i8, ptr %i206, align 1, !tbaa !21
  %i208 = load i8, ptr %i205, align 1, !tbaa !21
  %i209 = getelementptr i8, ptr %i205, i64 1
  %i210 = load i8, ptr %i209, align 1, !tbaa !21
  %i211 = getelementptr i8, ptr %i110, i64 -1
  %i212 = load i8, ptr %i211, align 1, !tbaa !21
  %i213 = getelementptr i8, ptr %i110, i64 1
  %i214 = load i8, ptr %i213, align 1, !tbaa !21
  %i215 = mul nsw i32 %i104, %i101
  %i216 = sext i32 %i215 to i64
  %i217 = getelementptr i8, ptr %i106, i64 %i103
  %i218 = getelementptr i8, ptr %i217, i64 %i216
  %i219 = getelementptr i8, ptr %i218, i64 -1
  %i220 = load i8, ptr %i219, align 1, !tbaa !21
  %i221 = load i8, ptr %i218, align 1, !tbaa !21
  %i222 = getelementptr i8, ptr %i218, i64 1
  %i223 = load i8, ptr %i222, align 1, !tbaa !21
  %i224 = tail call i8 @llvm.umax.i8(i8 %i207, i8 %i208)
  %i225 = tail call i8 @llvm.umin.i8(i8 %i207, i8 %i208)
  %i226 = zext i8 %i225 to i32
  %i227 = tail call i8 @llvm.umax.i8(i8 %i224, i8 %i210)
  %i228 = tail call i8 @llvm.umin.i8(i8 %i224, i8 %i210)
  %i229 = zext i8 %i228 to i32
  %i230 = tail call i8 @llvm.umax.i8(i8 %i227, i8 %i212)
  %i231 = tail call i8 @llvm.umin.i8(i8 %i227, i8 %i212)
  %i232 = zext i8 %i231 to i32
  %i233 = tail call i8 @llvm.umax.i8(i8 %i230, i8 %i214)
  %i234 = tail call i8 @llvm.umin.i8(i8 %i230, i8 %i214)
  %i235 = zext i8 %i234 to i32
  %i236 = tail call i8 @llvm.umax.i8(i8 %i233, i8 %i220)
  %i237 = tail call i8 @llvm.umin.i8(i8 %i233, i8 %i220)
  %i238 = zext i8 %i237 to i32
  %i239 = tail call i8 @llvm.umax.i8(i8 %i236, i8 %i221)
  %i240 = tail call i8 @llvm.umin.i8(i8 %i236, i8 %i221)
  %i241 = zext i8 %i240 to i32
  %i242 = tail call i8 @llvm.umin.i8(i8 %i239, i8 %i223)
  %i243 = zext i8 %i242 to i32
  %i244 = icmp ult i8 %i210, %i225
  %i245 = select i1 %i244, i32 %i226, i32 %i229
  %i246 = select i1 %i244, i32 %i229, i32 %i226
  %i247 = tail call i32 @llvm.umax.i32(i32 %i245, i32 %i232)
  %i248 = tail call i32 @llvm.umin.i32(i32 %i245, i32 %i232)
  %i249 = tail call i32 @llvm.umax.i32(i32 %i247, i32 %i235)
  %i250 = tail call i32 @llvm.umin.i32(i32 %i247, i32 %i235)
  %i251 = tail call i32 @llvm.umax.i32(i32 %i249, i32 %i238)
  %i252 = tail call i32 @llvm.umin.i32(i32 %i249, i32 %i238)
  %i253 = tail call i32 @llvm.umax.i32(i32 %i251, i32 %i241)
  %i254 = tail call i32 @llvm.umin.i32(i32 %i251, i32 %i241)
  %i255 = tail call i32 @llvm.umin.i32(i32 %i253, i32 %i243)
  %i256 = tail call i32 @llvm.umax.i32(i32 %i246, i32 %i248)
  %i257 = tail call i32 @llvm.umin.i32(i32 %i246, i32 %i248)
  %i258 = tail call i32 @llvm.umax.i32(i32 %i256, i32 %i250)
  %i259 = tail call i32 @llvm.umin.i32(i32 %i256, i32 %i250)
  %i260 = tail call i32 @llvm.umax.i32(i32 %i258, i32 %i252)
  %i261 = tail call i32 @llvm.umin.i32(i32 %i258, i32 %i252)
  %i262 = tail call i32 @llvm.umax.i32(i32 %i260, i32 %i254)
  %i263 = tail call i32 @llvm.umin.i32(i32 %i260, i32 %i254)
  %i264 = tail call i32 @llvm.umin.i32(i32 %i262, i32 %i255)
  %i265 = icmp ult i32 %i250, %i257
  %i266 = select i1 %i265, i32 %i257, i32 %i259
  %i267 = select i1 %i265, i32 %i259, i32 %i257
  %i268 = tail call i32 @llvm.umax.i32(i32 %i266, i32 %i261)
  %i269 = tail call i32 @llvm.umin.i32(i32 %i266, i32 %i261)
  %i270 = tail call i32 @llvm.umax.i32(i32 %i268, i32 %i263)
  %i271 = tail call i32 @llvm.umin.i32(i32 %i268, i32 %i263)
  %i272 = tail call i32 @llvm.umax.i32(i32 %i270, i32 %i264)
  %i273 = tail call i32 @llvm.umin.i32(i32 %i270, i32 %i264)
  %i274 = tail call i32 @llvm.umax.i32(i32 %i267, i32 %i269)
  %i275 = tail call i32 @llvm.umax.i32(i32 %i274, i32 %i271)
  %i276 = tail call i32 @llvm.umax.i32(i32 %i275, i32 %i273)
  %i277 = add nuw nsw i32 %i276, %i272
  %i278 = lshr i32 %i277, 1
  br label %bb285

bb279:                                            ; preds = %bb198.bb279_crit_edge, %bb102.bb279_crit_edge
  %i280 = phi i32 [ %i199, %bb198.bb279_crit_edge ], [ -10000, %bb102.bb279_crit_edge ]
  %i281 = phi i32 [ %i193, %bb198.bb279_crit_edge ], [ 0, %bb102.bb279_crit_edge ]
  %i282 = mul nsw i32 %i112, -10000
  %i283 = add i32 %i281, %i282
  %i284 = sdiv i32 %i283, %i280
  br label %bb285

bb285:                                            ; preds = %bb279, %bb201
  %i286 = phi i32 [ %i284, %bb279 ], [ %i278, %bb201 ]
  %i287 = trunc i32 %i286 to i8
  %i288 = getelementptr inbounds i8, ptr %i105, i64 1
  store i8 %i287, ptr %i105, align 1, !tbaa !21
  %i289 = add nsw i64 %i103, 1
  %i290 = load i32, ptr %i6, align 4, !tbaa !16
  %i291 = sub nsw i32 %i290, %i13
  %i292 = sext i32 %i291 to i64
  %i293 = icmp slt i64 %i289, %i292
  br i1 %i293, label %bb285.bb102_crit_edge, label %bb294, !llvm.loop !36

bb285.bb102_crit_edge:                            ; preds = %bb285
  br label %bb102

bb294:                                            ; preds = %bb285
  %i295 = load i32, ptr %i7, align 4, !tbaa !16
  br label %bb296

bb296:                                            ; preds = %bb294, %bb96
  %i297 = phi i32 [ %i97, %bb96 ], [ %i101, %bb294 ]
  %i298 = phi i32 [ %i90, %bb96 ], [ %i295, %bb294 ]
  %i299 = phi i32 [ %i91, %bb96 ], [ %i290, %bb294 ]
  %i300 = phi ptr [ %i92, %bb96 ], [ %i288, %bb294 ]
  %i301 = sub nsw i32 %i298, %i13
  %i302 = icmp slt i32 %i297, %i301
  br i1 %i302, label %bb296.bb89_crit_edge, label %bb303.loopexit, !llvm.loop !37

bb296.bb89_crit_edge:                             ; preds = %bb296
  br label %bb89

bb303.loopexit:                                   ; preds = %bb296
  br label %bb303

bb303:                                            ; preds = %bb303.loopexit, %bb52.bb303_crit_edge
  tail call void @free(ptr noundef %i43) #21
  br label %bb532

bb304:                                            ; preds = %bb525.bb304_crit_edge, %bb36
  %i305 = phi i32 [ %i527, %bb525.bb304_crit_edge ], [ %i34, %bb36 ]
  %i306 = phi i32 [ %i528, %bb525.bb304_crit_edge ], [ %i37, %bb36 ]
  %i307 = phi ptr [ %i529, %bb525.bb304_crit_edge ], [ %arg1, %bb36 ]
  %i308 = phi i32 [ %i526, %bb525.bb304_crit_edge ], [ 1, %bb36 ]
  %i309 = icmp sgt i32 %i306, 2
  br i1 %i309, label %bb312, label %bb310

bb310:                                            ; preds = %bb304
  %i311 = add nuw nsw i32 %i308, 1
  br label %bb525

bb312:                                            ; preds = %bb304
  %i313 = add nsw i32 %i308, -1
  %i314 = add nuw nsw i32 %i308, 1
  br label %bb315

bb315:                                            ; preds = %bb514.bb315_crit_edge, %bb312
  %i316 = phi i64 [ 1, %bb312 ], [ %i518, %bb514.bb315_crit_edge ]
  %i317 = phi i32 [ %i306, %bb312 ], [ %i519, %bb514.bb315_crit_edge ]
  %i318 = phi ptr [ %i307, %bb312 ], [ %i517, %bb514.bb315_crit_edge ]
  %i319 = load ptr, ptr %i, align 8, !tbaa !8
  %i320 = mul nsw i32 %i317, %i313
  %i321 = sext i32 %i320 to i64
  %i322 = getelementptr inbounds i8, ptr %i319, i64 %i321
  %i323 = getelementptr inbounds i8, ptr %i322, i64 %i316
  %i324 = getelementptr inbounds i8, ptr %i323, i64 -1
  %i325 = mul nsw i32 %i317, %i308
  %i326 = trunc i64 %i316 to i32
  %i327 = add nsw i32 %i325, %i326
  %i328 = sext i32 %i327 to i64
  %i329 = getelementptr inbounds i8, ptr %i319, i64 %i328
  %i330 = load i8, ptr %i329, align 1, !tbaa !21
  %i331 = zext i8 %i330 to i64
  %i332 = getelementptr inbounds i8, ptr %arg5, i64 %i331
  %i333 = load i8, ptr %i324, align 1, !tbaa !21
  %i334 = zext i8 %i333 to i64
  %i335 = sub nsw i64 0, %i334
  %i336 = getelementptr inbounds i8, ptr %i332, i64 %i335
  %i337 = load i8, ptr %i336, align 1, !tbaa !21
  %i338 = zext i8 %i337 to i32
  %i339 = getelementptr inbounds i8, ptr %i323, i64 1
  %i340 = load i8, ptr %i323, align 1, !tbaa !21
  %i341 = zext i8 %i340 to i64
  %i342 = sub nsw i64 0, %i341
  %i343 = getelementptr inbounds i8, ptr %i332, i64 %i342
  %i344 = load i8, ptr %i343, align 1, !tbaa !21
  %i345 = zext i8 %i344 to i32
  %i346 = load i8, ptr %i339, align 1, !tbaa !21
  %i347 = zext i8 %i346 to i64
  %i348 = sub nsw i64 0, %i347
  %i349 = getelementptr inbounds i8, ptr %i332, i64 %i348
  %i350 = load i8, ptr %i349, align 1, !tbaa !21
  %i351 = zext i8 %i350 to i32
  %i352 = add nsw i32 %i317, -2
  %i353 = sext i32 %i352 to i64
  %i354 = getelementptr inbounds i8, ptr %i339, i64 %i353
  %i355 = getelementptr inbounds i8, ptr %i354, i64 1
  %i356 = load i8, ptr %i354, align 1, !tbaa !21
  %i357 = zext i8 %i356 to i64
  %i358 = sub nsw i64 0, %i357
  %i359 = getelementptr inbounds i8, ptr %i332, i64 %i358
  %i360 = load i8, ptr %i359, align 1, !tbaa !21
  %i361 = zext i8 %i360 to i32
  %i362 = getelementptr inbounds i8, ptr %i354, i64 2
  %i363 = load i8, ptr %i355, align 1, !tbaa !21
  %i364 = zext i8 %i363 to i64
  %i365 = sub nsw i64 0, %i364
  %i366 = getelementptr inbounds i8, ptr %i332, i64 %i365
  %i367 = load i8, ptr %i366, align 1, !tbaa !21
  %i368 = zext i8 %i367 to i32
  %i369 = load i8, ptr %i362, align 1, !tbaa !21
  %i370 = zext i8 %i369 to i64
  %i371 = sub nsw i64 0, %i370
  %i372 = getelementptr inbounds i8, ptr %i332, i64 %i371
  %i373 = load i8, ptr %i372, align 1, !tbaa !21
  %i374 = zext i8 %i373 to i32
  %i375 = getelementptr inbounds i8, ptr %i362, i64 %i353
  %i376 = getelementptr inbounds i8, ptr %i375, i64 1
  %i377 = load i8, ptr %i375, align 1, !tbaa !21
  %i378 = zext i8 %i377 to i64
  %i379 = sub nsw i64 0, %i378
  %i380 = getelementptr inbounds i8, ptr %i332, i64 %i379
  %i381 = load i8, ptr %i380, align 1, !tbaa !21
  %i382 = zext i8 %i381 to i32
  %i383 = getelementptr inbounds i8, ptr %i375, i64 2
  %i384 = load i8, ptr %i376, align 1, !tbaa !21
  %i385 = zext i8 %i384 to i64
  %i386 = sub nsw i64 0, %i385
  %i387 = getelementptr inbounds i8, ptr %i332, i64 %i386
  %i388 = load i8, ptr %i387, align 1, !tbaa !21
  %i389 = zext i8 %i388 to i32
  %i390 = load i8, ptr %i383, align 1, !tbaa !21
  %i391 = zext i8 %i390 to i64
  %i392 = sub nsw i64 0, %i391
  %i393 = getelementptr inbounds i8, ptr %i332, i64 %i392
  %i394 = load i8, ptr %i393, align 1, !tbaa !21
  %i395 = zext i8 %i394 to i32
  %i396 = add nsw i32 %i338, -100
  %i397 = add nsw i32 %i396, %i345
  %i398 = add nsw i32 %i397, %i351
  %i399 = add nsw i32 %i398, %i361
  %i400 = add nsw i32 %i399, %i368
  %i401 = add nsw i32 %i400, %i374
  %i402 = add nsw i32 %i401, %i382
  %i403 = add nsw i32 %i402, %i389
  %i404 = add nsw i32 %i403, %i395
  %i405 = icmp eq i32 %i404, 0
  br i1 %i405, label %bb406, label %bb483

bb406:                                            ; preds = %bb315
  %i407 = add nsw i32 %i320, %i326
  %i408 = sext i32 %i407 to i64
  %i409 = getelementptr i8, ptr %i319, i64 %i408
  %i410 = getelementptr i8, ptr %i409, i64 -1
  %i411 = load i8, ptr %i410, align 1, !tbaa !21
  %i412 = load i8, ptr %i409, align 1, !tbaa !21
  %i413 = getelementptr i8, ptr %i409, i64 1
  %i414 = load i8, ptr %i413, align 1, !tbaa !21
  %i415 = getelementptr i8, ptr %i329, i64 -1
  %i416 = load i8, ptr %i415, align 1, !tbaa !21
  %i417 = getelementptr i8, ptr %i329, i64 1
  %i418 = load i8, ptr %i417, align 1, !tbaa !21
  %i419 = mul nsw i32 %i317, %i314
  %i420 = add nsw i32 %i419, %i326
  %i421 = sext i32 %i420 to i64
  %i422 = getelementptr i8, ptr %i319, i64 %i421
  %i423 = getelementptr i8, ptr %i422, i64 -1
  %i424 = load i8, ptr %i423, align 1, !tbaa !21
  %i425 = load i8, ptr %i422, align 1, !tbaa !21
  %i426 = getelementptr i8, ptr %i422, i64 1
  %i427 = load i8, ptr %i426, align 1, !tbaa !21
  %i428 = tail call i8 @llvm.umax.i8(i8 %i411, i8 %i412)
  %i429 = tail call i8 @llvm.umin.i8(i8 %i411, i8 %i412)
  %i430 = zext i8 %i429 to i32
  %i431 = tail call i8 @llvm.umax.i8(i8 %i428, i8 %i414)
  %i432 = tail call i8 @llvm.umin.i8(i8 %i428, i8 %i414)
  %i433 = zext i8 %i432 to i32
  %i434 = tail call i8 @llvm.umax.i8(i8 %i431, i8 %i416)
  %i435 = tail call i8 @llvm.umin.i8(i8 %i431, i8 %i416)
  %i436 = zext i8 %i435 to i32
  %i437 = tail call i8 @llvm.umax.i8(i8 %i434, i8 %i418)
  %i438 = tail call i8 @llvm.umin.i8(i8 %i434, i8 %i418)
  %i439 = zext i8 %i438 to i32
  %i440 = tail call i8 @llvm.umax.i8(i8 %i437, i8 %i424)
  %i441 = tail call i8 @llvm.umin.i8(i8 %i437, i8 %i424)
  %i442 = zext i8 %i441 to i32
  %i443 = tail call i8 @llvm.umax.i8(i8 %i440, i8 %i425)
  %i444 = tail call i8 @llvm.umin.i8(i8 %i440, i8 %i425)
  %i445 = zext i8 %i444 to i32
  %i446 = tail call i8 @llvm.umin.i8(i8 %i443, i8 %i427)
  %i447 = zext i8 %i446 to i32
  %i448 = icmp ult i8 %i414, %i429
  %i449 = select i1 %i448, i32 %i430, i32 %i433
  %i450 = select i1 %i448, i32 %i433, i32 %i430
  %i451 = tail call i32 @llvm.umax.i32(i32 %i449, i32 %i436)
  %i452 = tail call i32 @llvm.umin.i32(i32 %i449, i32 %i436)
  %i453 = tail call i32 @llvm.umax.i32(i32 %i451, i32 %i439)
  %i454 = tail call i32 @llvm.umin.i32(i32 %i451, i32 %i439)
  %i455 = tail call i32 @llvm.umax.i32(i32 %i453, i32 %i442)
  %i456 = tail call i32 @llvm.umin.i32(i32 %i453, i32 %i442)
  %i457 = tail call i32 @llvm.umax.i32(i32 %i455, i32 %i445)
  %i458 = tail call i32 @llvm.umin.i32(i32 %i455, i32 %i445)
  %i459 = tail call i32 @llvm.umin.i32(i32 %i457, i32 %i447)
  %i460 = tail call i32 @llvm.umax.i32(i32 %i450, i32 %i452)
  %i461 = tail call i32 @llvm.umin.i32(i32 %i450, i32 %i452)
  %i462 = tail call i32 @llvm.umax.i32(i32 %i460, i32 %i454)
  %i463 = tail call i32 @llvm.umin.i32(i32 %i460, i32 %i454)
  %i464 = tail call i32 @llvm.umax.i32(i32 %i462, i32 %i456)
  %i465 = tail call i32 @llvm.umin.i32(i32 %i462, i32 %i456)
  %i466 = tail call i32 @llvm.umax.i32(i32 %i464, i32 %i458)
  %i467 = tail call i32 @llvm.umin.i32(i32 %i464, i32 %i458)
  %i468 = tail call i32 @llvm.umin.i32(i32 %i466, i32 %i459)
  %i469 = icmp ult i32 %i454, %i461
  %i470 = select i1 %i469, i32 %i461, i32 %i463
  %i471 = select i1 %i469, i32 %i463, i32 %i461
  %i472 = tail call i32 @llvm.umax.i32(i32 %i470, i32 %i465)
  %i473 = tail call i32 @llvm.umin.i32(i32 %i470, i32 %i465)
  %i474 = tail call i32 @llvm.umax.i32(i32 %i472, i32 %i467)
  %i475 = tail call i32 @llvm.umin.i32(i32 %i472, i32 %i467)
  %i476 = tail call i32 @llvm.umax.i32(i32 %i474, i32 %i468)
  %i477 = tail call i32 @llvm.umin.i32(i32 %i474, i32 %i468)
  %i478 = tail call i32 @llvm.umax.i32(i32 %i471, i32 %i473)
  %i479 = tail call i32 @llvm.umax.i32(i32 %i478, i32 %i475)
  %i480 = tail call i32 @llvm.umax.i32(i32 %i479, i32 %i477)
  %i481 = add nuw nsw i32 %i480, %i476
  %i482 = lshr i32 %i481, 1
  br label %bb514

bb483:                                            ; preds = %bb315
  %i484 = zext i8 %i333 to i32
  %i485 = mul nuw nsw i32 %i338, %i484
  %i486 = zext i8 %i340 to i32
  %i487 = mul nuw nsw i32 %i345, %i486
  %i488 = zext i8 %i346 to i32
  %i489 = mul nuw nsw i32 %i351, %i488
  %i490 = zext i8 %i356 to i32
  %i491 = mul nuw nsw i32 %i361, %i490
  %i492 = zext i8 %i363 to i32
  %i493 = mul nuw nsw i32 %i368, %i492
  %i494 = zext i8 %i369 to i32
  %i495 = mul nuw nsw i32 %i374, %i494
  %i496 = zext i8 %i377 to i32
  %i497 = mul nuw nsw i32 %i382, %i496
  %i498 = zext i8 %i384 to i32
  %i499 = mul nuw nsw i32 %i389, %i498
  %i500 = zext i8 %i390 to i32
  %i501 = mul nuw nsw i32 %i395, %i500
  %i502 = zext i8 %i330 to i32
  %i503 = mul nsw i32 %i502, -100
  %i504 = add nsw i32 %i485, %i503
  %i505 = add nsw i32 %i504, %i487
  %i506 = add nsw i32 %i505, %i489
  %i507 = add nsw i32 %i506, %i491
  %i508 = add nsw i32 %i507, %i493
  %i509 = add nsw i32 %i508, %i495
  %i510 = add nsw i32 %i509, %i497
  %i511 = add nsw i32 %i510, %i499
  %i512 = add nsw i32 %i511, %i501
  %i513 = sdiv i32 %i512, %i404
  br label %bb514

bb514:                                            ; preds = %bb483, %bb406
  %i515 = phi i32 [ %i513, %bb483 ], [ %i482, %bb406 ]
  %i516 = trunc i32 %i515 to i8
  %i517 = getelementptr inbounds i8, ptr %i318, i64 1
  store i8 %i516, ptr %i318, align 1, !tbaa !21
  %i518 = add nuw nsw i64 %i316, 1
  %i519 = load i32, ptr %i6, align 4, !tbaa !16
  %i520 = add nsw i32 %i519, -1
  %i521 = sext i32 %i520 to i64
  %i522 = icmp slt i64 %i518, %i521
  br i1 %i522, label %bb514.bb315_crit_edge, label %bb523, !llvm.loop !38

bb514.bb315_crit_edge:                            ; preds = %bb514
  br label %bb315

bb523:                                            ; preds = %bb514
  %i524 = load i32, ptr %i7, align 4, !tbaa !16
  br label %bb525

bb525:                                            ; preds = %bb523, %bb310
  %i526 = phi i32 [ %i311, %bb310 ], [ %i314, %bb523 ]
  %i527 = phi i32 [ %i305, %bb310 ], [ %i524, %bb523 ]
  %i528 = phi i32 [ %i306, %bb310 ], [ %i519, %bb523 ]
  %i529 = phi ptr [ %i307, %bb310 ], [ %i517, %bb523 ]
  %i530 = add nsw i32 %i527, -1
  %i531 = icmp slt i32 %i526, %i530
  br i1 %i531, label %bb525.bb304_crit_edge, label %bb532.loopexit, !llvm.loop !39

bb525.bb304_crit_edge:                            ; preds = %bb525
  br label %bb304

bb532.loopexit:                                   ; preds = %bb525
  br label %bb532

bb532:                                            ; preds = %bb532.loopexit, %bb303, %bb33.bb532_crit_edge
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
  br i1 %i34, label %bb35.loopexit, label %bb31.bb15_crit_edge, !llvm.loop !40

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
  br i1 %i63, label %bb64.loopexit, label %bb60.bb43_crit_edge, !llvm.loop !41

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
  br i1 %i4, label %bb5, label %bb.bb521_crit_edge

bb.bb521_crit_edge:                               ; preds = %bb
  br label %bb521

bb5:                                              ; preds = %bb
  %i6 = add nsw i32 %arg2, -4
  %i7 = getelementptr i8, ptr %arg1, i64 -1
  %i8 = icmp sgt i32 %arg2, 8
  %i9 = sext i32 %arg2 to i64
  br label %bb10

bb10:                                             ; preds = %bb515.bb10_crit_edge, %bb5
  %i11 = phi i32 [ 4, %bb5 ], [ %i519, %bb515.bb10_crit_edge ]
  %i12 = phi i32 [ 0, %bb5 ], [ %i517, %bb515.bb10_crit_edge ]
  %i13 = phi i32 [ 0, %bb5 ], [ %i516, %bb515.bb10_crit_edge ]
  br i1 %i8, label %bb14.preheader, label %bb10.bb515_crit_edge

bb10.bb515_crit_edge:                             ; preds = %bb10
  br label %bb515

bb14.preheader:                                   ; preds = %bb10
  br label %bb14

bb14:                                             ; preds = %bb508.bb14_crit_edge, %bb14.preheader
  %i15 = phi i32 [ %i513, %bb508.bb14_crit_edge ], [ 4, %bb14.preheader ]
  %i16 = phi i32 [ %i511, %bb508.bb14_crit_edge ], [ %i11, %bb14.preheader ]
  %i17 = phi i32 [ %i510, %bb508.bb14_crit_edge ], [ %i12, %bb14.preheader ]
  %i18 = phi i32 [ %i509, %bb508.bb14_crit_edge ], [ %i13, %bb14.preheader ]
  %i19 = mul nsw i32 %i16, %arg2
  %i20 = add nsw i32 %i19, %i15
  %i21 = sext i32 %i20 to i64
  %i22 = getelementptr inbounds i8, ptr %arg1, i64 %i21
  %i23 = load i8, ptr %i22, align 1, !tbaa !21
  %i24 = icmp ult i8 %i23, 8
  br i1 %i24, label %bb25, label %bb14.bb508_crit_edge

bb14.bb508_crit_edge:                             ; preds = %bb14
  br label %bb508

bb25:                                             ; preds = %bb14
  %i26 = getelementptr inbounds i32, ptr %arg, i64 %i21
  %i27 = load i32, ptr %i26, align 4, !tbaa !16
  %i28 = add i32 %i16, -1
  %i29 = mul nsw i32 %i28, %arg2
  %i30 = sext i32 %i29 to i64
  %i31 = getelementptr inbounds i8, ptr %arg1, i64 %i30
  %i32 = sext i32 %i15 to i64
  %i33 = getelementptr inbounds i8, ptr %i31, i64 %i32
  %i34 = getelementptr inbounds i8, ptr %i33, i64 -1
  %i35 = load i8, ptr %i34, align 1, !tbaa !21
  %i36 = icmp ult i8 %i35, 8
  %i37 = zext i1 %i36 to i32
  %i38 = load i8, ptr %i33, align 1, !tbaa !21
  %i39 = icmp ult i8 %i38, 8
  %i40 = zext i1 %i39 to i32
  %i41 = add nuw nsw i32 %i40, %i37
  %i42 = getelementptr inbounds i8, ptr %i33, i64 1
  %i43 = load i8, ptr %i42, align 1, !tbaa !21
  %i44 = icmp ult i8 %i43, 8
  %i45 = zext i1 %i44 to i32
  %i46 = add nuw nsw i32 %i41, %i45
  %i47 = getelementptr inbounds i8, ptr %i34, i64 %i9
  %i48 = load i8, ptr %i47, align 1, !tbaa !21
  %i49 = icmp ult i8 %i48, 8
  %i50 = zext i1 %i49 to i32
  %i51 = add nuw nsw i32 %i46, %i50
  %i52 = getelementptr inbounds i8, ptr %i47, i64 2
  %i53 = load i8, ptr %i52, align 1, !tbaa !21
  %i54 = icmp ult i8 %i53, 8
  %i55 = zext i1 %i54 to i32
  %i56 = add nuw nsw i32 %i51, %i55
  %i57 = getelementptr inbounds i8, ptr %i47, i64 %i9
  %i58 = load i8, ptr %i57, align 1, !tbaa !21
  %i59 = icmp ult i8 %i58, 8
  %i60 = zext i1 %i59 to i32
  %i61 = add nuw nsw i32 %i56, %i60
  %i62 = getelementptr inbounds i8, ptr %i57, i64 1
  %i63 = load i8, ptr %i62, align 1, !tbaa !21
  %i64 = icmp ult i8 %i63, 8
  %i65 = zext i1 %i64 to i32
  %i66 = add nuw nsw i32 %i61, %i65
  %i67 = getelementptr inbounds i8, ptr %i57, i64 2
  %i68 = load i8, ptr %i67, align 1, !tbaa !21
  %i69 = icmp ult i8 %i68, 8
  %i70 = zext i1 %i69 to i32
  %i71 = add nuw nsw i32 %i66, %i70
  switch i32 %i71, label %bb437 [
    i32 0, label %bb72
    i32 1, label %bb73
    i32 2, label %bb250
  ]

bb72:                                             ; preds = %bb25
  store i8 100, ptr %i22, align 1, !tbaa !21
  br label %bb508

bb73:                                             ; preds = %bb25
  %i74 = icmp ult i8 %i23, 6
  br i1 %i74, label %bb75, label %bb73.bb508_crit_edge

bb73.bb508_crit_edge:                             ; preds = %bb73
  br label %bb508

bb75:                                             ; preds = %bb73
  %i76 = add nsw i32 %i29, %i15
  %i77 = add nsw i32 %i76, -1
  %i78 = sext i32 %i77 to i64
  %i79 = getelementptr inbounds i32, ptr %arg, i64 %i78
  %i80 = load i32, ptr %i79, align 4, !tbaa !16
  %i81 = sext i32 %i76 to i64
  %i82 = getelementptr inbounds i32, ptr %arg, i64 %i81
  %i83 = load i32, ptr %i82, align 4, !tbaa !16
  %i84 = add nsw i32 %i76, 1
  %i85 = sext i32 %i84 to i64
  %i86 = getelementptr inbounds i32, ptr %arg, i64 %i85
  %i87 = load i32, ptr %i86, align 4, !tbaa !16
  %i88 = add nsw i32 %i20, -1
  %i89 = sext i32 %i88 to i64
  %i90 = getelementptr inbounds i32, ptr %arg, i64 %i89
  %i91 = load i32, ptr %i90, align 4, !tbaa !16
  %i92 = add nsw i32 %i20, 1
  %i93 = sext i32 %i92 to i64
  %i94 = getelementptr inbounds i32, ptr %arg, i64 %i93
  %i95 = load i32, ptr %i94, align 4, !tbaa !16
  %i96 = add nsw i32 %i16, 1
  %i97 = mul nsw i32 %i96, %arg2
  %i98 = add nsw i32 %i97, %i15
  %i99 = add nsw i32 %i98, -1
  %i100 = sext i32 %i99 to i64
  %i101 = getelementptr inbounds i32, ptr %arg, i64 %i100
  %i102 = load i32, ptr %i101, align 4, !tbaa !16
  %i103 = sext i32 %i98 to i64
  %i104 = getelementptr inbounds i32, ptr %arg, i64 %i103
  %i105 = load i32, ptr %i104, align 4, !tbaa !16
  %i106 = add nsw i32 %i98, 1
  %i107 = sext i32 %i106 to i64
  %i108 = getelementptr inbounds i32, ptr %arg, i64 %i107
  %i109 = load i32, ptr %i108, align 4, !tbaa !16
  %i110 = getelementptr inbounds i8, ptr %arg1, i64 %i78
  %i111 = load i8, ptr %i110, align 1, !tbaa !21
  %i112 = icmp ult i8 %i111, 8
  br i1 %i112, label %bb113, label %bb119

bb113:                                            ; preds = %bb75
  %i114 = shl nsw i32 %i87, 1
  %i115 = shl nsw i32 %i102, 1
  %i116 = mul nsw i32 %i95, 3
  %i117 = mul nsw i32 %i105, 3
  %i118 = shl nsw i32 %i109, 2
  br label %bb189

bb119:                                            ; preds = %bb75
  %i120 = getelementptr inbounds i8, ptr %arg1, i64 %i81
  %i121 = load i8, ptr %i120, align 1, !tbaa !21
  %i122 = icmp ult i8 %i121, 8
  br i1 %i122, label %bb123, label %bb129

bb123:                                            ; preds = %bb119
  %i124 = shl nsw i32 %i91, 1
  %i125 = shl nsw i32 %i95, 1
  %i126 = mul nsw i32 %i102, 3
  %i127 = mul nsw i32 %i109, 3
  %i128 = shl nsw i32 %i105, 2
  br label %bb189

bb129:                                            ; preds = %bb119
  %i130 = getelementptr inbounds i8, ptr %arg1, i64 %i85
  %i131 = load i8, ptr %i130, align 1, !tbaa !21
  %i132 = icmp ult i8 %i131, 8
  br i1 %i132, label %bb133, label %bb139

bb133:                                            ; preds = %bb129
  %i134 = shl nsw i32 %i80, 1
  %i135 = shl nsw i32 %i109, 1
  %i136 = mul nsw i32 %i91, 3
  %i137 = mul nsw i32 %i105, 3
  %i138 = shl nsw i32 %i102, 2
  br label %bb189

bb139:                                            ; preds = %bb129
  %i140 = getelementptr inbounds i8, ptr %arg1, i64 %i89
  %i141 = load i8, ptr %i140, align 1, !tbaa !21
  %i142 = icmp ult i8 %i141, 8
  br i1 %i142, label %bb143, label %bb149

bb143:                                            ; preds = %bb139
  %i144 = shl nsw i32 %i83, 1
  %i145 = shl nsw i32 %i105, 1
  %i146 = mul nsw i32 %i87, 3
  %i147 = mul nsw i32 %i109, 3
  %i148 = shl nsw i32 %i95, 2
  br label %bb189

bb149:                                            ; preds = %bb139
  %i150 = getelementptr inbounds i8, ptr %arg1, i64 %i93
  %i151 = load i8, ptr %i150, align 1, !tbaa !21
  %i152 = icmp ult i8 %i151, 8
  br i1 %i152, label %bb153, label %bb159

bb153:                                            ; preds = %bb149
  %i154 = shl nsw i32 %i83, 1
  %i155 = shl nsw i32 %i105, 1
  %i156 = mul nsw i32 %i80, 3
  %i157 = mul nsw i32 %i102, 3
  %i158 = shl nsw i32 %i91, 2
  br label %bb189

bb159:                                            ; preds = %bb149
  %i160 = getelementptr inbounds i8, ptr %arg1, i64 %i100
  %i161 = load i8, ptr %i160, align 1, !tbaa !21
  %i162 = icmp ult i8 %i161, 8
  br i1 %i162, label %bb163, label %bb169

bb163:                                            ; preds = %bb159
  %i164 = shl nsw i32 %i80, 1
  %i165 = shl nsw i32 %i109, 1
  %i166 = mul nsw i32 %i83, 3
  %i167 = mul nsw i32 %i95, 3
  %i168 = shl nsw i32 %i87, 2
  br label %bb189

bb169:                                            ; preds = %bb159
  %i170 = getelementptr inbounds i8, ptr %arg1, i64 %i103
  %i171 = load i8, ptr %i170, align 1, !tbaa !21
  %i172 = icmp ult i8 %i171, 8
  br i1 %i172, label %bb173, label %bb179

bb173:                                            ; preds = %bb169
  %i174 = shl nsw i32 %i91, 1
  %i175 = shl nsw i32 %i95, 1
  %i176 = mul nsw i32 %i80, 3
  %i177 = mul nsw i32 %i87, 3
  %i178 = shl nsw i32 %i83, 2
  br label %bb189

bb179:                                            ; preds = %bb169
  %i180 = getelementptr inbounds i8, ptr %arg1, i64 %i107
  %i181 = load i8, ptr %i180, align 1, !tbaa !21
  %i182 = icmp ult i8 %i181, 8
  br i1 %i182, label %bb183, label %bb179.bb189_crit_edge

bb179.bb189_crit_edge:                            ; preds = %bb179
  br label %bb189

bb183:                                            ; preds = %bb179
  %i184 = shl nsw i32 %i102, 1
  %i185 = shl nsw i32 %i87, 1
  %i186 = mul nsw i32 %i83, 3
  %i187 = mul nsw i32 %i91, 3
  %i188 = shl nsw i32 %i80, 2
  br label %bb189

bb189:                                            ; preds = %bb183, %bb179.bb189_crit_edge, %bb173, %bb163, %bb153, %bb143, %bb133, %bb123, %bb113
  %i190 = phi i32 [ %i117, %bb113 ], [ %i128, %bb123 ], [ %i137, %bb133 ], [ %i145, %bb143 ], [ %i155, %bb153 ], [ 0, %bb163 ], [ 0, %bb173 ], [ 0, %bb183 ], [ %i105, %bb179.bb189_crit_edge ]
  %i191 = phi i32 [ %i115, %bb113 ], [ %i126, %bb123 ], [ %i138, %bb133 ], [ 0, %bb143 ], [ %i157, %bb153 ], [ 0, %bb163 ], [ 0, %bb173 ], [ %i184, %bb183 ], [ %i102, %bb179.bb189_crit_edge ]
  %i192 = phi i32 [ %i116, %bb113 ], [ %i125, %bb123 ], [ 0, %bb133 ], [ %i148, %bb143 ], [ 0, %bb153 ], [ %i167, %bb163 ], [ %i175, %bb173 ], [ 0, %bb183 ], [ %i95, %bb179.bb189_crit_edge ]
  %i193 = phi i32 [ %i118, %bb113 ], [ %i127, %bb123 ], [ %i135, %bb133 ], [ %i147, %bb143 ], [ 0, %bb153 ], [ %i165, %bb163 ], [ 0, %bb173 ], [ 0, %bb183 ], [ %i109, %bb179.bb189_crit_edge ]
  %i194 = phi i32 [ 0, %bb113 ], [ %i124, %bb123 ], [ %i136, %bb133 ], [ 0, %bb143 ], [ %i158, %bb153 ], [ 0, %bb163 ], [ %i174, %bb173 ], [ %i187, %bb183 ], [ %i91, %bb179.bb189_crit_edge ]
  %i195 = phi i32 [ %i114, %bb113 ], [ 0, %bb123 ], [ 0, %bb133 ], [ %i146, %bb143 ], [ 0, %bb153 ], [ %i168, %bb163 ], [ %i177, %bb173 ], [ %i185, %bb183 ], [ %i87, %bb179.bb189_crit_edge ]
  %i196 = phi i32 [ 0, %bb113 ], [ 0, %bb123 ], [ 0, %bb133 ], [ %i144, %bb143 ], [ %i154, %bb153 ], [ %i166, %bb163 ], [ %i178, %bb173 ], [ %i186, %bb183 ], [ %i83, %bb179.bb189_crit_edge ]
  %i197 = phi i32 [ 0, %bb113 ], [ 0, %bb123 ], [ %i134, %bb133 ], [ 0, %bb143 ], [ %i156, %bb153 ], [ %i164, %bb163 ], [ %i176, %bb173 ], [ %i188, %bb183 ], [ %i80, %bb179.bb189_crit_edge ]
  %i198 = icmp sgt i32 %i197, 0
  %i199 = tail call i32 @llvm.smax.i32(i32 %i197, i32 0)
  %i200 = select i1 %i198, i32 0, i32 %i17
  %i201 = icmp sgt i32 %i196, %i199
  %i202 = tail call i32 @llvm.smax.i32(i32 %i196, i32 %i199)
  %i203 = select i1 %i201, i32 1, i32 %i200
  %i204 = icmp sgt i32 %i195, %i202
  %i205 = tail call i32 @llvm.smax.i32(i32 %i195, i32 %i202)
  %i206 = select i1 %i204, i1 true, i1 %i201
  %i207 = select i1 %i206, i1 true, i1 %i198
  %i208 = select i1 %i207, i32 0, i32 %i18
  %i209 = select i1 %i204, i32 2, i32 %i203
  %i210 = icmp sgt i32 %i194, %i205
  %i211 = tail call i32 @llvm.smax.i32(i32 %i194, i32 %i205)
  %i212 = select i1 %i210, i32 0, i32 %i209
  %i213 = icmp sgt i32 %i192, %i211
  %i214 = tail call i32 @llvm.smax.i32(i32 %i192, i32 %i211)
  %i215 = select i1 %i213, i1 true, i1 %i210
  %i216 = select i1 %i215, i32 1, i32 %i208
  %i217 = select i1 %i213, i32 2, i32 %i212
  %i218 = icmp sgt i32 %i191, %i214
  %i219 = tail call i32 @llvm.smax.i32(i32 %i191, i32 %i214)
  %i220 = select i1 %i218, i32 0, i32 %i217
  %i221 = icmp sgt i32 %i190, %i219
  %i222 = tail call i32 @llvm.smax.i32(i32 %i190, i32 %i219)
  %i223 = select i1 %i221, i32 1, i32 %i220
  %i224 = icmp sgt i32 %i193, %i222
  %i225 = tail call i32 @llvm.smax.i32(i32 %i193, i32 %i222)
  %i226 = select i1 %i224, i1 true, i1 %i221
  %i227 = select i1 %i226, i1 true, i1 %i218
  %i228 = select i1 %i227, i32 2, i32 %i216
  %i229 = select i1 %i224, i32 2, i32 %i223
  %i230 = icmp eq i32 %i225, 0
  br i1 %i230, label %bb189.bb508_crit_edge, label %bb231

bb189.bb508_crit_edge:                            ; preds = %bb189
  br label %bb508

bb231:                                            ; preds = %bb189
  %i232 = icmp ult i8 %i23, 4
  %i233 = add nuw nsw i8 %i23, 1
  %i234 = select i1 %i232, i8 4, i8 %i233
  %i235 = add i32 %i28, %i228
  %i236 = mul nsw i32 %i235, %arg2
  %i237 = add i32 %i229, %i15
  %i238 = add i32 %i237, %i236
  %i239 = sext i32 %i238 to i64
  %i240 = getelementptr i8, ptr %i7, i64 %i239
  store i8 %i234, ptr %i240, align 1, !tbaa !21
  %i241 = shl nuw nsw i32 %i228, 1
  %i242 = add nuw nsw i32 %i241, %i229
  %i243 = icmp slt i32 %i242, 3
  br i1 %i243, label %bb244, label %bb231.bb508_crit_edge

bb231.bb508_crit_edge:                            ; preds = %bb231
  br label %bb508

bb244:                                            ; preds = %bb231
  %i245 = add i32 %i28, %i228
  %i246 = add i32 %i15, -2
  %i247 = add i32 %i246, %i229
  %i248 = tail call i32 @llvm.smax.i32(i32 %i245, i32 4)
  %i249 = tail call i32 @llvm.smax.i32(i32 %i247, i32 4)
  br label %bb508

bb250:                                            ; preds = %bb25
  %i251 = add nsw i32 %i16, -1
  %i252 = mul nsw i32 %i251, %arg2
  %i253 = add nsw i32 %i252, %i15
  %i254 = sext i32 %i253 to i64
  %i255 = getelementptr i8, ptr %arg1, i64 %i254
  %i256 = getelementptr i8, ptr %i255, i64 -1
  %i257 = load i8, ptr %i256, align 1, !tbaa !21
  %i258 = icmp ult i8 %i257, 8
  %i259 = zext i1 %i258 to i32
  %i260 = getelementptr i8, ptr %i255, i64 1
  %i261 = load i8, ptr %i260, align 1, !tbaa !21
  %i262 = icmp ult i8 %i261, 8
  %i263 = zext i1 %i262 to i32
  %i264 = add nsw i32 %i16, 1
  %i265 = mul nsw i32 %i264, %arg2
  %i266 = add nsw i32 %i265, %i15
  %i267 = sext i32 %i266 to i64
  %i268 = getelementptr i8, ptr %arg1, i64 %i267
  %i269 = getelementptr i8, ptr %i268, i64 -1
  %i270 = load i8, ptr %i269, align 1, !tbaa !21
  %i271 = icmp ult i8 %i270, 8
  %i272 = zext i1 %i271 to i32
  %i273 = getelementptr i8, ptr %i268, i64 1
  %i274 = load i8, ptr %i273, align 1, !tbaa !21
  %i275 = icmp ult i8 %i274, 8
  %i276 = zext i1 %i275 to i32
  %i277 = add nuw nsw i32 %i263, %i259
  %i278 = add nuw nsw i32 %i277, %i272
  %i279 = add nuw nsw i32 %i278, %i276
  %i280 = icmp eq i32 %i279, 2
  br i1 %i280, label %bb281, label %bb250.bb358_crit_edge

bb250.bb358_crit_edge:                            ; preds = %bb250
  br label %bb358

bb281:                                            ; preds = %bb250
  %i282 = or i32 %i276, %i259
  %i283 = or i32 %i272, %i263
  %i284 = and i32 %i282, %i283
  %i285 = icmp eq i32 %i284, 0
  br i1 %i285, label %bb281.bb358_crit_edge, label %bb286

bb281.bb358_crit_edge:                            ; preds = %bb281
  br label %bb358

bb286:                                            ; preds = %bb281
  %i287 = xor i1 %i262, true
  br i1 %i258, label %bb288, label %bb291

bb288:                                            ; preds = %bb286
  %i289 = sext i1 %i287 to i32
  %i290 = sext i1 %i262 to i32
  br label %bb293

bb291:                                            ; preds = %bb286
  %i292 = zext i1 %i287 to i32
  br label %bb293

bb293:                                            ; preds = %bb291, %bb288
  %i294 = phi i1 [ %i262, %bb288 ], [ %i287, %bb291 ]
  %i295 = phi i32 [ %i289, %bb288 ], [ %i263, %bb291 ]
  %i296 = phi i1 [ %i287, %bb288 ], [ %i262, %bb291 ]
  %i297 = phi i32 [ %i290, %bb288 ], [ %i292, %bb291 ]
  %i298 = add nsw i32 %i297, %i16
  %i299 = mul nsw i32 %i298, %arg2
  %i300 = add i32 %i295, %i15
  %i301 = add i32 %i300, %i299
  %i302 = sext i32 %i301 to i64
  %i303 = getelementptr inbounds i32, ptr %arg, i64 %i302
  %i304 = load i32, ptr %i303, align 4, !tbaa !16
  %i305 = sitofp i32 %i304 to float
  %i306 = sitofp i32 %i27 to float
  %i307 = fdiv float %i305, %i306
  %i308 = fpext float %i307 to double
  %i309 = fcmp ogt double %i308, 0x3FE6666666666666
  br i1 %i309, label %bb310, label %bb293.bb508_crit_edge

bb293.bb508_crit_edge:                            ; preds = %bb293
  br label %bb508

bb310:                                            ; preds = %bb293
  br i1 %i294, label %bb311, label %bb310.bb331_crit_edge

bb310.bb331_crit_edge:                            ; preds = %bb310
  br label %bb331

bb311:                                            ; preds = %bb310
  %i312 = shl nsw i32 %i297, 1
  %i313 = add nsw i32 %i312, %i16
  %i314 = mul nsw i32 %i313, %arg2
  %i315 = add nsw i32 %i314, %i15
  %i316 = sext i32 %i315 to i64
  %i317 = getelementptr inbounds i8, ptr %arg1, i64 %i316
  %i318 = load i8, ptr %i317, align 1, !tbaa !21
  %i319 = icmp ugt i8 %i318, 7
  br i1 %i319, label %bb320, label %bb311.bb331_crit_edge

bb311.bb331_crit_edge:                            ; preds = %bb311
  br label %bb331

bb320:                                            ; preds = %bb311
  %i321 = getelementptr i8, ptr %i317, i64 -1
  %i322 = load i8, ptr %i321, align 1, !tbaa !21
  %i323 = icmp ugt i8 %i322, 7
  br i1 %i323, label %bb324, label %bb320.bb331_crit_edge

bb320.bb331_crit_edge:                            ; preds = %bb320
  br label %bb331

bb324:                                            ; preds = %bb320
  %i325 = getelementptr i8, ptr %i317, i64 1
  %i326 = load i8, ptr %i325, align 1, !tbaa !21
  %i327 = icmp ugt i8 %i326, 7
  br i1 %i327, label %bb328, label %bb324.bb331_crit_edge

bb324.bb331_crit_edge:                            ; preds = %bb324
  br label %bb331

bb328:                                            ; preds = %bb324
  %i329 = mul nsw i32 %i16, %arg2
  %i330 = add nsw i32 %i329, %i15
  br label %bb353

bb331:                                            ; preds = %bb324.bb331_crit_edge, %bb320.bb331_crit_edge, %bb311.bb331_crit_edge, %bb310.bb331_crit_edge
  br i1 %i296, label %bb332, label %bb331.bb508_crit_edge

bb331.bb508_crit_edge:                            ; preds = %bb331
  br label %bb508

bb332:                                            ; preds = %bb331
  %i333 = mul nsw i32 %i16, %arg2
  %i334 = add nsw i32 %i333, %i15
  %i335 = shl nsw i32 %i295, 1
  %i336 = add nsw i32 %i334, %i335
  %i337 = sext i32 %i336 to i64
  %i338 = getelementptr inbounds i8, ptr %arg1, i64 %i337
  %i339 = load i8, ptr %i338, align 1, !tbaa !21
  %i340 = icmp ugt i8 %i339, 7
  br i1 %i340, label %bb341, label %bb332.bb508_crit_edge

bb332.bb508_crit_edge:                            ; preds = %bb332
  br label %bb508

bb341:                                            ; preds = %bb332
  %i342 = add nsw i32 %i335, %i266
  %i343 = sext i32 %i342 to i64
  %i344 = getelementptr inbounds i8, ptr %arg1, i64 %i343
  %i345 = load i8, ptr %i344, align 1, !tbaa !21
  %i346 = icmp ugt i8 %i345, 7
  br i1 %i346, label %bb347, label %bb341.bb508_crit_edge

bb341.bb508_crit_edge:                            ; preds = %bb341
  br label %bb508

bb347:                                            ; preds = %bb341
  %i348 = add nsw i32 %i335, %i253
  %i349 = sext i32 %i348 to i64
  %i350 = getelementptr inbounds i8, ptr %arg1, i64 %i349
  %i351 = load i8, ptr %i350, align 1, !tbaa !21
  %i352 = icmp ugt i8 %i351, 7
  br i1 %i352, label %bb347.bb353_crit_edge, label %bb347.bb508_crit_edge

bb347.bb508_crit_edge:                            ; preds = %bb347
  br label %bb508

bb347.bb353_crit_edge:                            ; preds = %bb347
  br label %bb353

bb353:                                            ; preds = %bb347.bb353_crit_edge, %bb328
  %i354 = phi i32 [ %i330, %bb328 ], [ %i334, %bb347.bb353_crit_edge ]
  %i355 = sext i32 %i354 to i64
  %i356 = getelementptr inbounds i8, ptr %arg1, i64 %i355
  store i8 100, ptr %i356, align 1, !tbaa !21
  %i357 = getelementptr inbounds i8, ptr %arg1, i64 %i302
  store i8 3, ptr %i357, align 1, !tbaa !21
  br label %bb508

bb358:                                            ; preds = %bb281.bb358_crit_edge, %bb250.bb358_crit_edge
  %i359 = load i8, ptr %i255, align 1, !tbaa !21
  %i360 = icmp ult i8 %i359, 8
  %i361 = zext i1 %i360 to i32
  %i362 = mul nsw i32 %i16, %arg2
  %i363 = add nsw i32 %i362, %i15
  %i364 = sext i32 %i363 to i64
  %i365 = getelementptr i8, ptr %arg1, i64 %i364
  %i366 = getelementptr i8, ptr %i365, i64 1
  %i367 = load i8, ptr %i366, align 1, !tbaa !21
  %i368 = icmp ult i8 %i367, 8
  %i369 = zext i1 %i368 to i32
  %i370 = load i8, ptr %i268, align 1, !tbaa !21
  %i371 = icmp ult i8 %i370, 8
  %i372 = zext i1 %i371 to i32
  %i373 = getelementptr i8, ptr %i365, i64 -1
  %i374 = load i8, ptr %i373, align 1, !tbaa !21
  %i375 = icmp ult i8 %i374, 8
  %i376 = zext i1 %i375 to i32
  %i377 = add nuw nsw i32 %i369, %i361
  %i378 = add nuw nsw i32 %i377, %i372
  %i379 = add nuw nsw i32 %i378, %i376
  %i380 = icmp eq i32 %i379, 2
  br i1 %i380, label %bb381, label %bb358.bb508_crit_edge

bb358.bb508_crit_edge:                            ; preds = %bb358
  br label %bb508

bb381:                                            ; preds = %bb358
  %i382 = or i32 %i376, %i369
  %i383 = or i32 %i372, %i361
  %i384 = and i32 %i382, %i383
  %i385 = icmp eq i32 %i384, 0
  br i1 %i385, label %bb381.bb508_crit_edge, label %bb386

bb381.bb508_crit_edge:                            ; preds = %bb381
  br label %bb508

bb386:                                            ; preds = %bb381
  %i387 = add nsw i32 %i16, -2
  %i388 = mul nsw i32 %i387, %arg2
  %i389 = add nsw i32 %i388, %i15
  %i390 = sext i32 %i389 to i64
  %i391 = getelementptr i8, ptr %arg1, i64 %i390
  %i392 = getelementptr i8, ptr %i391, i64 -1
  %i393 = load i8, ptr %i392, align 1, !tbaa !21
  %i394 = icmp ult i8 %i393, 8
  %i395 = getelementptr i8, ptr %i391, i64 1
  %i396 = load i8, ptr %i395, align 1, !tbaa !21
  %i397 = icmp ult i8 %i396, 8
  %i398 = or i1 %i394, %i397
  %i399 = and i1 %i360, %i398
  %i400 = getelementptr i8, ptr %i255, i64 -2
  %i401 = load i8, ptr %i400, align 1, !tbaa !21
  %i402 = icmp ult i8 %i401, 8
  %i403 = getelementptr i8, ptr %i268, i64 -2
  %i404 = load i8, ptr %i403, align 1, !tbaa !21
  %i405 = icmp ult i8 %i404, 8
  %i406 = or i1 %i402, %i405
  %i407 = and i1 %i375, %i406
  %i408 = or i1 %i399, %i407
  %i409 = getelementptr i8, ptr %i255, i64 2
  %i410 = load i8, ptr %i409, align 1, !tbaa !21
  %i411 = icmp ult i8 %i410, 8
  %i412 = getelementptr i8, ptr %i268, i64 2
  %i413 = load i8, ptr %i412, align 1, !tbaa !21
  %i414 = icmp ult i8 %i413, 8
  %i415 = or i1 %i411, %i414
  %i416 = and i1 %i368, %i415
  %i417 = or i1 %i408, %i416
  %i418 = add nsw i32 %i16, 2
  %i419 = mul nsw i32 %i418, %arg2
  %i420 = add nsw i32 %i419, %i15
  %i421 = sext i32 %i420 to i64
  %i422 = getelementptr i8, ptr %arg1, i64 %i421
  %i423 = getelementptr i8, ptr %i422, i64 -1
  %i424 = load i8, ptr %i423, align 1, !tbaa !21
  %i425 = icmp ult i8 %i424, 8
  %i426 = getelementptr i8, ptr %i422, i64 1
  %i427 = load i8, ptr %i426, align 1, !tbaa !21
  %i428 = icmp ult i8 %i427, 8
  %i429 = or i1 %i425, %i428
  %i430 = and i1 %i371, %i429
  %i431 = or i1 %i417, %i430
  br i1 %i431, label %bb432, label %bb386.bb508_crit_edge

bb386.bb508_crit_edge:                            ; preds = %bb386
  br label %bb508

bb432:                                            ; preds = %bb386
  store i8 100, ptr %i365, align 1, !tbaa !21
  %i433 = tail call i32 @llvm.smax.i32(i32 %i16, i32 5)
  %i434 = add nsw i32 %i433, -1
  %i435 = tail call i32 @llvm.smax.i32(i32 %i15, i32 6)
  %i436 = add nsw i32 %i435, -2
  br label %bb508

bb437:                                            ; preds = %bb25
  %i438 = add nsw i32 %i16, -1
  %i439 = mul nsw i32 %i438, %arg2
  %i440 = add nsw i32 %i439, %i15
  %i441 = sext i32 %i440 to i64
  %i442 = getelementptr inbounds i8, ptr %arg1, i64 %i441
  %i443 = load i8, ptr %i442, align 1, !tbaa !21
  %i444 = icmp ult i8 %i443, 8
  %i445 = zext i1 %i444 to i32
  %i446 = mul nsw i32 %i16, %arg2
  %i447 = add nsw i32 %i446, %i15
  %i448 = sext i32 %i447 to i64
  %i449 = getelementptr i8, ptr %arg1, i64 %i448
  %i450 = getelementptr i8, ptr %i449, i64 1
  %i451 = load i8, ptr %i450, align 1, !tbaa !21
  %i452 = icmp ult i8 %i451, 8
  %i453 = zext i1 %i452 to i32
  %i454 = add nsw i32 %i16, 1
  %i455 = mul nsw i32 %i454, %arg2
  %i456 = add nsw i32 %i455, %i15
  %i457 = sext i32 %i456 to i64
  %i458 = getelementptr inbounds i8, ptr %arg1, i64 %i457
  %i459 = load i8, ptr %i458, align 1, !tbaa !21
  %i460 = icmp ult i8 %i459, 8
  %i461 = zext i1 %i460 to i32
  %i462 = getelementptr i8, ptr %i449, i64 -1
  %i463 = load i8, ptr %i462, align 1, !tbaa !21
  %i464 = icmp ult i8 %i463, 8
  %i465 = zext i1 %i464 to i32
  %i466 = add nuw nsw i32 %i453, %i445
  %i467 = add nuw nsw i32 %i466, %i461
  %i468 = add nuw nsw i32 %i467, %i465
  %i469 = icmp ugt i32 %i468, 1
  br i1 %i469, label %bb470, label %bb437.bb508_crit_edge

bb437.bb508_crit_edge:                            ; preds = %bb437
  br label %bb508

bb470:                                            ; preds = %bb437
  %i471 = getelementptr i8, ptr %i442, i64 -1
  %i472 = load i8, ptr %i471, align 1, !tbaa !21
  %i473 = icmp ult i8 %i472, 8
  %i474 = getelementptr i8, ptr %i442, i64 1
  %i475 = load i8, ptr %i474, align 1, !tbaa !21
  %i476 = icmp ult i8 %i475, 8
  %i477 = getelementptr i8, ptr %i458, i64 -1
  %i478 = load i8, ptr %i477, align 1, !tbaa !21
  %i479 = icmp ult i8 %i478, 8
  %i480 = getelementptr i8, ptr %i458, i64 1
  %i481 = load i8, ptr %i480, align 1, !tbaa !21
  %i482 = icmp ult i8 %i481, 8
  %i483 = or i1 %i444, %i473
  %i484 = zext i1 %i483 to i32
  %i485 = or i1 %i452, %i476
  %i486 = zext i1 %i485 to i32
  %i487 = or i1 %i460, %i482
  %i488 = zext i1 %i487 to i32
  %i489 = or i1 %i464, %i479
  %i490 = zext i1 %i489 to i32
  %i491 = and i32 %i486, %i445
  %i492 = and i32 %i488, %i453
  %i493 = and i32 %i490, %i461
  %i494 = and i32 %i484, %i465
  %i495 = add nuw nsw i32 %i486, %i484
  %i496 = add nuw nsw i32 %i495, %i490
  %i497 = add nuw nsw i32 %i494, %i491
  %i498 = add nuw nsw i32 %i496, %i488
  %i499 = add nuw nsw i32 %i497, %i493
  %i500 = add nuw nsw i32 %i499, %i492
  %i501 = sub nsw i32 %i498, %i500
  %i502 = icmp slt i32 %i501, 2
  br i1 %i502, label %bb503, label %bb470.bb508_crit_edge

bb470.bb508_crit_edge:                            ; preds = %bb470
  br label %bb508

bb503:                                            ; preds = %bb470
  store i8 100, ptr %i449, align 1, !tbaa !21
  %i504 = tail call i32 @llvm.smax.i32(i32 %i16, i32 5)
  %i505 = add nsw i32 %i504, -1
  %i506 = tail call i32 @llvm.smax.i32(i32 %i15, i32 6)
  %i507 = add nsw i32 %i506, -2
  br label %bb508

bb508:                                            ; preds = %bb503, %bb470.bb508_crit_edge, %bb437.bb508_crit_edge, %bb432, %bb386.bb508_crit_edge, %bb381.bb508_crit_edge, %bb358.bb508_crit_edge, %bb353, %bb347.bb508_crit_edge, %bb341.bb508_crit_edge, %bb332.bb508_crit_edge, %bb331.bb508_crit_edge, %bb293.bb508_crit_edge, %bb244, %bb231.bb508_crit_edge, %bb189.bb508_crit_edge, %bb73.bb508_crit_edge, %bb72, %bb14.bb508_crit_edge
  %i509 = phi i32 [ %i18, %bb503 ], [ %i18, %bb470.bb508_crit_edge ], [ %i18, %bb437.bb508_crit_edge ], [ %i18, %bb14.bb508_crit_edge ], [ %i18, %bb358.bb508_crit_edge ], [ %i18, %bb381.bb508_crit_edge ], [ %i18, %bb386.bb508_crit_edge ], [ %i18, %bb432 ], [ %i18, %bb293.bb508_crit_edge ], [ %i18, %bb331.bb508_crit_edge ], [ %i18, %bb332.bb508_crit_edge ], [ %i18, %bb341.bb508_crit_edge ], [ %i18, %bb347.bb508_crit_edge ], [ %i18, %bb353 ], [ %i18, %bb72 ], [ %i18, %bb73.bb508_crit_edge ], [ %i228, %bb244 ], [ %i228, %bb189.bb508_crit_edge ], [ %i228, %bb231.bb508_crit_edge ]
  %i510 = phi i32 [ %i17, %bb503 ], [ %i17, %bb470.bb508_crit_edge ], [ %i17, %bb437.bb508_crit_edge ], [ %i17, %bb14.bb508_crit_edge ], [ %i17, %bb358.bb508_crit_edge ], [ %i17, %bb381.bb508_crit_edge ], [ %i17, %bb386.bb508_crit_edge ], [ %i17, %bb432 ], [ %i17, %bb293.bb508_crit_edge ], [ %i17, %bb331.bb508_crit_edge ], [ %i17, %bb332.bb508_crit_edge ], [ %i17, %bb341.bb508_crit_edge ], [ %i17, %bb347.bb508_crit_edge ], [ %i17, %bb353 ], [ %i17, %bb72 ], [ %i17, %bb73.bb508_crit_edge ], [ %i229, %bb244 ], [ %i229, %bb189.bb508_crit_edge ], [ %i229, %bb231.bb508_crit_edge ]
  %i511 = phi i32 [ %i505, %bb503 ], [ %i16, %bb470.bb508_crit_edge ], [ %i16, %bb437.bb508_crit_edge ], [ %i16, %bb14.bb508_crit_edge ], [ %i16, %bb358.bb508_crit_edge ], [ %i16, %bb381.bb508_crit_edge ], [ %i16, %bb386.bb508_crit_edge ], [ %i434, %bb432 ], [ %i16, %bb293.bb508_crit_edge ], [ %i16, %bb331.bb508_crit_edge ], [ %i16, %bb332.bb508_crit_edge ], [ %i16, %bb341.bb508_crit_edge ], [ %i16, %bb347.bb508_crit_edge ], [ %i16, %bb353 ], [ %i16, %bb72 ], [ %i16, %bb73.bb508_crit_edge ], [ %i248, %bb244 ], [ %i16, %bb189.bb508_crit_edge ], [ %i16, %bb231.bb508_crit_edge ]
  %i512 = phi i32 [ %i507, %bb503 ], [ %i15, %bb470.bb508_crit_edge ], [ %i15, %bb437.bb508_crit_edge ], [ %i15, %bb14.bb508_crit_edge ], [ %i15, %bb358.bb508_crit_edge ], [ %i15, %bb381.bb508_crit_edge ], [ %i15, %bb386.bb508_crit_edge ], [ %i436, %bb432 ], [ %i15, %bb293.bb508_crit_edge ], [ %i15, %bb331.bb508_crit_edge ], [ %i15, %bb332.bb508_crit_edge ], [ %i15, %bb341.bb508_crit_edge ], [ %i15, %bb347.bb508_crit_edge ], [ %i15, %bb353 ], [ %i15, %bb72 ], [ %i15, %bb73.bb508_crit_edge ], [ %i249, %bb244 ], [ %i15, %bb189.bb508_crit_edge ], [ %i15, %bb231.bb508_crit_edge ]
  %i513 = add nsw i32 %i512, 1
  %i514 = icmp slt i32 %i513, %i6
  br i1 %i514, label %bb508.bb14_crit_edge, label %bb515.loopexit, !llvm.loop !42

bb508.bb14_crit_edge:                             ; preds = %bb508
  br label %bb14

bb515.loopexit:                                   ; preds = %bb508
  br label %bb515

bb515:                                            ; preds = %bb515.loopexit, %bb10.bb515_crit_edge
  %i516 = phi i32 [ %i13, %bb10.bb515_crit_edge ], [ %i509, %bb515.loopexit ]
  %i517 = phi i32 [ %i12, %bb10.bb515_crit_edge ], [ %i510, %bb515.loopexit ]
  %i518 = phi i32 [ %i11, %bb10.bb515_crit_edge ], [ %i511, %bb515.loopexit ]
  %i519 = add nsw i32 %i518, 1
  %i520 = icmp slt i32 %i519, %i
  br i1 %i520, label %bb515.bb10_crit_edge, label %bb521.loopexit, !llvm.loop !43

bb515.bb10_crit_edge:                             ; preds = %bb515
  br label %bb10

bb521.loopexit:                                   ; preds = %bb515
  br label %bb521

bb521:                                            ; preds = %bb521.loopexit, %bb.bb521_crit_edge
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
  br i1 %i9, label %bb10, label %bb.bb1162_crit_edge

bb.bb1162_crit_edge:                              ; preds = %bb
  br label %bb1162

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
  %i20 = zext nneg i32 %i11 to i64
  %i21 = zext nneg i32 %i12 to i64
  br label %bb22

bb22:                                             ; preds = %bb348.bb22_crit_edge, %bb10
  %i23 = phi i64 [ 3, %bb10 ], [ %i349, %bb348.bb22_crit_edge ]
  br i1 %i13, label %bb24, label %bb22.bb348_crit_edge

bb22.bb348_crit_edge:                             ; preds = %bb22
  br label %bb348

bb24:                                             ; preds = %bb22
  %i25 = add nsw i64 %i23, -3
  %i26 = mul nsw i64 %i25, %i19
  %i27 = getelementptr inbounds i8, ptr %arg, i64 %i26
  %i28 = trunc i64 %i23 to i32
  %i29 = mul i32 %i28, %arg5
  %i30 = zext i32 %i29 to i64
  br label %bb46

bb31:                                             ; preds = %bb348
  %i32 = icmp sgt i32 %arg6, 8
  br i1 %i32, label %bb33, label %bb31.bb1162_crit_edge

bb31.bb1162_crit_edge:                            ; preds = %bb31
  br label %bb1162

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
  %i43 = sext i32 %arg5 to i64
  %i44 = zext nneg i32 %i34 to i64
  %i45 = zext nneg i32 %i35 to i64
  br label %bb351

bb46:                                             ; preds = %bb345.bb46_crit_edge, %bb24
  %i47 = phi i64 [ 3, %bb24 ], [ %i346, %bb345.bb46_crit_edge ]
  %i48 = getelementptr inbounds i8, ptr %i27, i64 %i47
  %i49 = getelementptr inbounds i8, ptr %i48, i64 -1
  %i50 = add nuw nsw i64 %i47, %i30
  %i51 = getelementptr inbounds i8, ptr %arg, i64 %i50
  %i52 = load i8, ptr %i51, align 1, !tbaa !21
  %i53 = zext i8 %i52 to i64
  %i54 = getelementptr inbounds i8, ptr %arg3, i64 %i53
  %i55 = load i8, ptr %i49, align 1, !tbaa !21
  %i56 = zext i8 %i55 to i64
  %i57 = sub nsw i64 0, %i56
  %i58 = getelementptr inbounds i8, ptr %i54, i64 %i57
  %i59 = load i8, ptr %i58, align 1, !tbaa !21
  %i60 = zext i8 %i59 to i32
  %i61 = add nuw nsw i32 %i60, 100
  %i62 = getelementptr inbounds i8, ptr %i48, i64 1
  %i63 = load i8, ptr %i48, align 1, !tbaa !21
  %i64 = zext i8 %i63 to i64
  %i65 = sub nsw i64 0, %i64
  %i66 = getelementptr inbounds i8, ptr %i54, i64 %i65
  %i67 = load i8, ptr %i66, align 1, !tbaa !21
  %i68 = zext i8 %i67 to i32
  %i69 = add nuw nsw i32 %i61, %i68
  %i70 = load i8, ptr %i62, align 1, !tbaa !21
  %i71 = zext i8 %i70 to i64
  %i72 = sub nsw i64 0, %i71
  %i73 = getelementptr inbounds i8, ptr %i54, i64 %i72
  %i74 = load i8, ptr %i73, align 1, !tbaa !21
  %i75 = zext i8 %i74 to i32
  %i76 = add nuw nsw i32 %i69, %i75
  %i77 = getelementptr inbounds i8, ptr %i62, i64 %i14
  %i78 = getelementptr inbounds i8, ptr %i77, i64 1
  %i79 = load i8, ptr %i77, align 1, !tbaa !21
  %i80 = zext i8 %i79 to i64
  %i81 = sub nsw i64 0, %i80
  %i82 = getelementptr inbounds i8, ptr %i54, i64 %i81
  %i83 = load i8, ptr %i82, align 1, !tbaa !21
  %i84 = zext i8 %i83 to i32
  %i85 = add nuw nsw i32 %i76, %i84
  %i86 = getelementptr inbounds i8, ptr %i77, i64 2
  %i87 = load i8, ptr %i78, align 1, !tbaa !21
  %i88 = zext i8 %i87 to i64
  %i89 = sub nsw i64 0, %i88
  %i90 = getelementptr inbounds i8, ptr %i54, i64 %i89
  %i91 = load i8, ptr %i90, align 1, !tbaa !21
  %i92 = zext i8 %i91 to i32
  %i93 = add nuw nsw i32 %i85, %i92
  %i94 = getelementptr inbounds i8, ptr %i77, i64 3
  %i95 = load i8, ptr %i86, align 1, !tbaa !21
  %i96 = zext i8 %i95 to i64
  %i97 = sub nsw i64 0, %i96
  %i98 = getelementptr inbounds i8, ptr %i54, i64 %i97
  %i99 = load i8, ptr %i98, align 1, !tbaa !21
  %i100 = zext i8 %i99 to i32
  %i101 = add nuw nsw i32 %i93, %i100
  %i102 = getelementptr inbounds i8, ptr %i77, i64 4
  %i103 = load i8, ptr %i94, align 1, !tbaa !21
  %i104 = zext i8 %i103 to i64
  %i105 = sub nsw i64 0, %i104
  %i106 = getelementptr inbounds i8, ptr %i54, i64 %i105
  %i107 = load i8, ptr %i106, align 1, !tbaa !21
  %i108 = zext i8 %i107 to i32
  %i109 = add nuw nsw i32 %i101, %i108
  %i110 = load i8, ptr %i102, align 1, !tbaa !21
  %i111 = zext i8 %i110 to i64
  %i112 = sub nsw i64 0, %i111
  %i113 = getelementptr inbounds i8, ptr %i54, i64 %i112
  %i114 = load i8, ptr %i113, align 1, !tbaa !21
  %i115 = zext i8 %i114 to i32
  %i116 = add nuw nsw i32 %i109, %i115
  %i117 = getelementptr inbounds i8, ptr %i102, i64 %i16
  %i118 = getelementptr inbounds i8, ptr %i117, i64 1
  %i119 = load i8, ptr %i117, align 1, !tbaa !21
  %i120 = zext i8 %i119 to i64
  %i121 = sub nsw i64 0, %i120
  %i122 = getelementptr inbounds i8, ptr %i54, i64 %i121
  %i123 = load i8, ptr %i122, align 1, !tbaa !21
  %i124 = zext i8 %i123 to i32
  %i125 = add nuw nsw i32 %i116, %i124
  %i126 = getelementptr inbounds i8, ptr %i117, i64 2
  %i127 = load i8, ptr %i118, align 1, !tbaa !21
  %i128 = zext i8 %i127 to i64
  %i129 = sub nsw i64 0, %i128
  %i130 = getelementptr inbounds i8, ptr %i54, i64 %i129
  %i131 = load i8, ptr %i130, align 1, !tbaa !21
  %i132 = zext i8 %i131 to i32
  %i133 = add nuw nsw i32 %i125, %i132
  %i134 = getelementptr inbounds i8, ptr %i117, i64 3
  %i135 = load i8, ptr %i126, align 1, !tbaa !21
  %i136 = zext i8 %i135 to i64
  %i137 = sub nsw i64 0, %i136
  %i138 = getelementptr inbounds i8, ptr %i54, i64 %i137
  %i139 = load i8, ptr %i138, align 1, !tbaa !21
  %i140 = zext i8 %i139 to i32
  %i141 = add nuw nsw i32 %i133, %i140
  %i142 = getelementptr inbounds i8, ptr %i117, i64 4
  %i143 = load i8, ptr %i134, align 1, !tbaa !21
  %i144 = zext i8 %i143 to i64
  %i145 = sub nsw i64 0, %i144
  %i146 = getelementptr inbounds i8, ptr %i54, i64 %i145
  %i147 = load i8, ptr %i146, align 1, !tbaa !21
  %i148 = zext i8 %i147 to i32
  %i149 = add nuw nsw i32 %i141, %i148
  %i150 = getelementptr inbounds i8, ptr %i117, i64 5
  %i151 = load i8, ptr %i142, align 1, !tbaa !21
  %i152 = zext i8 %i151 to i64
  %i153 = sub nsw i64 0, %i152
  %i154 = getelementptr inbounds i8, ptr %i54, i64 %i153
  %i155 = load i8, ptr %i154, align 1, !tbaa !21
  %i156 = zext i8 %i155 to i32
  %i157 = add nuw nsw i32 %i149, %i156
  %i158 = getelementptr inbounds i8, ptr %i117, i64 6
  %i159 = load i8, ptr %i150, align 1, !tbaa !21
  %i160 = zext i8 %i159 to i64
  %i161 = sub nsw i64 0, %i160
  %i162 = getelementptr inbounds i8, ptr %i54, i64 %i161
  %i163 = load i8, ptr %i162, align 1, !tbaa !21
  %i164 = zext i8 %i163 to i32
  %i165 = add nuw nsw i32 %i157, %i164
  %i166 = load i8, ptr %i158, align 1, !tbaa !21
  %i167 = zext i8 %i166 to i64
  %i168 = sub nsw i64 0, %i167
  %i169 = getelementptr inbounds i8, ptr %i54, i64 %i168
  %i170 = load i8, ptr %i169, align 1, !tbaa !21
  %i171 = zext i8 %i170 to i32
  %i172 = add nuw nsw i32 %i165, %i171
  %i173 = getelementptr inbounds i8, ptr %i158, i64 %i18
  %i174 = getelementptr inbounds i8, ptr %i173, i64 1
  %i175 = load i8, ptr %i173, align 1, !tbaa !21
  %i176 = zext i8 %i175 to i64
  %i177 = sub nsw i64 0, %i176
  %i178 = getelementptr inbounds i8, ptr %i54, i64 %i177
  %i179 = load i8, ptr %i178, align 1, !tbaa !21
  %i180 = zext i8 %i179 to i32
  %i181 = add nuw nsw i32 %i172, %i180
  %i182 = getelementptr inbounds i8, ptr %i173, i64 2
  %i183 = load i8, ptr %i174, align 1, !tbaa !21
  %i184 = zext i8 %i183 to i64
  %i185 = sub nsw i64 0, %i184
  %i186 = getelementptr inbounds i8, ptr %i54, i64 %i185
  %i187 = load i8, ptr %i186, align 1, !tbaa !21
  %i188 = zext i8 %i187 to i32
  %i189 = add nuw nsw i32 %i181, %i188
  %i190 = load i8, ptr %i182, align 1, !tbaa !21
  %i191 = zext i8 %i190 to i64
  %i192 = sub nsw i64 0, %i191
  %i193 = getelementptr inbounds i8, ptr %i54, i64 %i192
  %i194 = load i8, ptr %i193, align 1, !tbaa !21
  %i195 = zext i8 %i194 to i32
  %i196 = add nuw nsw i32 %i189, %i195
  %i197 = getelementptr inbounds i8, ptr %i173, i64 4
  %i198 = getelementptr inbounds i8, ptr %i173, i64 5
  %i199 = load i8, ptr %i197, align 1, !tbaa !21
  %i200 = zext i8 %i199 to i64
  %i201 = sub nsw i64 0, %i200
  %i202 = getelementptr inbounds i8, ptr %i54, i64 %i201
  %i203 = load i8, ptr %i202, align 1, !tbaa !21
  %i204 = zext i8 %i203 to i32
  %i205 = add nuw nsw i32 %i196, %i204
  %i206 = getelementptr inbounds i8, ptr %i173, i64 6
  %i207 = load i8, ptr %i198, align 1, !tbaa !21
  %i208 = zext i8 %i207 to i64
  %i209 = sub nsw i64 0, %i208
  %i210 = getelementptr inbounds i8, ptr %i54, i64 %i209
  %i211 = load i8, ptr %i210, align 1, !tbaa !21
  %i212 = zext i8 %i211 to i32
  %i213 = add nuw nsw i32 %i205, %i212
  %i214 = load i8, ptr %i206, align 1, !tbaa !21
  %i215 = zext i8 %i214 to i64
  %i216 = sub nsw i64 0, %i215
  %i217 = getelementptr inbounds i8, ptr %i54, i64 %i216
  %i218 = load i8, ptr %i217, align 1, !tbaa !21
  %i219 = zext i8 %i218 to i32
  %i220 = add nuw nsw i32 %i213, %i219
  %i221 = getelementptr inbounds i8, ptr %i206, i64 %i18
  %i222 = getelementptr inbounds i8, ptr %i221, i64 1
  %i223 = load i8, ptr %i221, align 1, !tbaa !21
  %i224 = zext i8 %i223 to i64
  %i225 = sub nsw i64 0, %i224
  %i226 = getelementptr inbounds i8, ptr %i54, i64 %i225
  %i227 = load i8, ptr %i226, align 1, !tbaa !21
  %i228 = zext i8 %i227 to i32
  %i229 = add nuw nsw i32 %i220, %i228
  %i230 = getelementptr inbounds i8, ptr %i221, i64 2
  %i231 = load i8, ptr %i222, align 1, !tbaa !21
  %i232 = zext i8 %i231 to i64
  %i233 = sub nsw i64 0, %i232
  %i234 = getelementptr inbounds i8, ptr %i54, i64 %i233
  %i235 = load i8, ptr %i234, align 1, !tbaa !21
  %i236 = zext i8 %i235 to i32
  %i237 = add nuw nsw i32 %i229, %i236
  %i238 = getelementptr inbounds i8, ptr %i221, i64 3
  %i239 = load i8, ptr %i230, align 1, !tbaa !21
  %i240 = zext i8 %i239 to i64
  %i241 = sub nsw i64 0, %i240
  %i242 = getelementptr inbounds i8, ptr %i54, i64 %i241
  %i243 = load i8, ptr %i242, align 1, !tbaa !21
  %i244 = zext i8 %i243 to i32
  %i245 = add nuw nsw i32 %i237, %i244
  %i246 = getelementptr inbounds i8, ptr %i221, i64 4
  %i247 = load i8, ptr %i238, align 1, !tbaa !21
  %i248 = zext i8 %i247 to i64
  %i249 = sub nsw i64 0, %i248
  %i250 = getelementptr inbounds i8, ptr %i54, i64 %i249
  %i251 = load i8, ptr %i250, align 1, !tbaa !21
  %i252 = zext i8 %i251 to i32
  %i253 = add nuw nsw i32 %i245, %i252
  %i254 = getelementptr inbounds i8, ptr %i221, i64 5
  %i255 = load i8, ptr %i246, align 1, !tbaa !21
  %i256 = zext i8 %i255 to i64
  %i257 = sub nsw i64 0, %i256
  %i258 = getelementptr inbounds i8, ptr %i54, i64 %i257
  %i259 = load i8, ptr %i258, align 1, !tbaa !21
  %i260 = zext i8 %i259 to i32
  %i261 = add nuw nsw i32 %i253, %i260
  %i262 = getelementptr inbounds i8, ptr %i221, i64 6
  %i263 = load i8, ptr %i254, align 1, !tbaa !21
  %i264 = zext i8 %i263 to i64
  %i265 = sub nsw i64 0, %i264
  %i266 = getelementptr inbounds i8, ptr %i54, i64 %i265
  %i267 = load i8, ptr %i266, align 1, !tbaa !21
  %i268 = zext i8 %i267 to i32
  %i269 = add nuw nsw i32 %i261, %i268
  %i270 = load i8, ptr %i262, align 1, !tbaa !21
  %i271 = zext i8 %i270 to i64
  %i272 = sub nsw i64 0, %i271
  %i273 = getelementptr inbounds i8, ptr %i54, i64 %i272
  %i274 = load i8, ptr %i273, align 1, !tbaa !21
  %i275 = zext i8 %i274 to i32
  %i276 = add nuw nsw i32 %i269, %i275
  %i277 = getelementptr inbounds i8, ptr %i262, i64 %i16
  %i278 = getelementptr inbounds i8, ptr %i277, i64 1
  %i279 = load i8, ptr %i277, align 1, !tbaa !21
  %i280 = zext i8 %i279 to i64
  %i281 = sub nsw i64 0, %i280
  %i282 = getelementptr inbounds i8, ptr %i54, i64 %i281
  %i283 = load i8, ptr %i282, align 1, !tbaa !21
  %i284 = zext i8 %i283 to i32
  %i285 = add nuw nsw i32 %i276, %i284
  %i286 = getelementptr inbounds i8, ptr %i277, i64 2
  %i287 = load i8, ptr %i278, align 1, !tbaa !21
  %i288 = zext i8 %i287 to i64
  %i289 = sub nsw i64 0, %i288
  %i290 = getelementptr inbounds i8, ptr %i54, i64 %i289
  %i291 = load i8, ptr %i290, align 1, !tbaa !21
  %i292 = zext i8 %i291 to i32
  %i293 = add nuw nsw i32 %i285, %i292
  %i294 = getelementptr inbounds i8, ptr %i277, i64 3
  %i295 = load i8, ptr %i286, align 1, !tbaa !21
  %i296 = zext i8 %i295 to i64
  %i297 = sub nsw i64 0, %i296
  %i298 = getelementptr inbounds i8, ptr %i54, i64 %i297
  %i299 = load i8, ptr %i298, align 1, !tbaa !21
  %i300 = zext i8 %i299 to i32
  %i301 = add nuw nsw i32 %i293, %i300
  %i302 = getelementptr inbounds i8, ptr %i277, i64 4
  %i303 = load i8, ptr %i294, align 1, !tbaa !21
  %i304 = zext i8 %i303 to i64
  %i305 = sub nsw i64 0, %i304
  %i306 = getelementptr inbounds i8, ptr %i54, i64 %i305
  %i307 = load i8, ptr %i306, align 1, !tbaa !21
  %i308 = zext i8 %i307 to i32
  %i309 = add nuw nsw i32 %i301, %i308
  %i310 = load i8, ptr %i302, align 1, !tbaa !21
  %i311 = zext i8 %i310 to i64
  %i312 = sub nsw i64 0, %i311
  %i313 = getelementptr inbounds i8, ptr %i54, i64 %i312
  %i314 = load i8, ptr %i313, align 1, !tbaa !21
  %i315 = zext i8 %i314 to i32
  %i316 = add nuw nsw i32 %i309, %i315
  %i317 = getelementptr inbounds i8, ptr %i302, i64 %i14
  %i318 = getelementptr inbounds i8, ptr %i317, i64 1
  %i319 = load i8, ptr %i317, align 1, !tbaa !21
  %i320 = zext i8 %i319 to i64
  %i321 = sub nsw i64 0, %i320
  %i322 = getelementptr inbounds i8, ptr %i54, i64 %i321
  %i323 = load i8, ptr %i322, align 1, !tbaa !21
  %i324 = zext i8 %i323 to i32
  %i325 = add nuw nsw i32 %i316, %i324
  %i326 = getelementptr inbounds i8, ptr %i317, i64 2
  %i327 = load i8, ptr %i318, align 1, !tbaa !21
  %i328 = zext i8 %i327 to i64
  %i329 = sub nsw i64 0, %i328
  %i330 = getelementptr inbounds i8, ptr %i54, i64 %i329
  %i331 = load i8, ptr %i330, align 1, !tbaa !21
  %i332 = zext i8 %i331 to i32
  %i333 = add nuw nsw i32 %i325, %i332
  %i334 = load i8, ptr %i326, align 1, !tbaa !21
  %i335 = zext i8 %i334 to i64
  %i336 = sub nsw i64 0, %i335
  %i337 = getelementptr inbounds i8, ptr %i54, i64 %i336
  %i338 = load i8, ptr %i337, align 1, !tbaa !21
  %i339 = zext i8 %i338 to i32
  %i340 = add nuw nsw i32 %i333, %i339
  %i341 = icmp sgt i32 %i340, %arg4
  br i1 %i341, label %bb46.bb345_crit_edge, label %bb342

bb46.bb345_crit_edge:                             ; preds = %bb46
  br label %bb345

bb342:                                            ; preds = %bb46
  %i343 = sub nsw i32 %arg4, %i340
  %i344 = getelementptr inbounds i32, ptr %arg1, i64 %i50
  store i32 %i343, ptr %i344, align 4, !tbaa !16
  br label %bb345

bb345:                                            ; preds = %bb342, %bb46.bb345_crit_edge
  %i346 = add nuw nsw i64 %i47, 1
  %i347 = icmp eq i64 %i346, %i21
  br i1 %i347, label %bb348.loopexit, label %bb345.bb46_crit_edge, !llvm.loop !44

bb345.bb46_crit_edge:                             ; preds = %bb345
  br label %bb46

bb348.loopexit:                                   ; preds = %bb345
  br label %bb348

bb348:                                            ; preds = %bb348.loopexit, %bb22.bb348_crit_edge
  %i349 = add nuw nsw i64 %i23, 1
  %i350 = icmp eq i64 %i349, %i20
  br i1 %i350, label %bb31, label %bb348.bb22_crit_edge, !llvm.loop !45

bb348.bb22_crit_edge:                             ; preds = %bb348
  br label %bb22

bb351:                                            ; preds = %bb1159.bb351_crit_edge, %bb33
  %i352 = phi i64 [ 4, %bb33 ], [ %i1160, %bb1159.bb351_crit_edge ]
  br i1 %i36, label %bb353, label %bb351.bb1159_crit_edge

bb351.bb1159_crit_edge:                           ; preds = %bb351
  br label %bb1159

bb353:                                            ; preds = %bb351
  %i354 = add nsw i64 %i352, -3
  %i355 = mul nsw i64 %i354, %i43
  %i356 = getelementptr inbounds i8, ptr %arg, i64 %i355
  %i357 = trunc i64 %i352 to i32
  %i358 = mul i32 %i357, %arg5
  %i359 = zext i32 %i358 to i64
  %i360 = trunc i64 %i352 to i32
  %i361 = trunc i64 %i352 to i32
  br label %bb362

bb362:                                            ; preds = %bb1156.bb362_crit_edge, %bb353
  %i363 = phi i64 [ 4, %bb353 ], [ %i1157, %bb1156.bb362_crit_edge ]
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
  br i1 %i374, label %bb375, label %bb368.bb757_crit_edge

bb368.bb757_crit_edge:                            ; preds = %bb368
  br label %bb757

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
  %i399 = getelementptr inbounds i8, ptr %i384, i64 %i38
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
  %i438 = getelementptr inbounds i8, ptr %i423, i64 %i40
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
  %i487 = getelementptr inbounds i8, ptr %i474, i64 %i42
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
  %i529 = getelementptr inbounds i8, ptr %i516, i64 %i42
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
  %i578 = getelementptr inbounds i8, ptr %i565, i64 %i40
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
  %i615 = getelementptr inbounds i8, ptr %i601, i64 %i38
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
  br i1 %i701, label %bb702, label %bb375.bb757_crit_edge

bb375.bb757_crit_edge:                            ; preds = %bb375
  br label %bb757

bb702:                                            ; preds = %bb375
  %i703 = icmp eq i32 %i666, 0
  %i704 = sitofp i32 %i691 to float
  %i705 = sitofp i32 %i666 to float
  %i706 = fdiv float %i704, %i705
  %i707 = select i1 %i703, float 1.000000e+06, float %i706
  %i708 = fcmp uge float %i707, 0.000000e+00
  %i709 = fneg float %i707
  %i710 = select i1 %i708, float %i707, float %i709
  %i711 = fcmp olt float %i710, 5.000000e-01
  br i1 %i711, label %bb702.bb716_crit_edge, label %bb712

bb702.bb716_crit_edge:                            ; preds = %bb702
  br label %bb716

bb712:                                            ; preds = %bb702
  %i713 = fcmp ogt float %i710, 2.000000e+00
  br i1 %i713, label %bb712.bb716_crit_edge, label %bb714

bb712.bb716_crit_edge:                            ; preds = %bb712
  br label %bb716

bb714:                                            ; preds = %bb712
  %i715 = select i1 %i708, i32 1, i32 -1
  br label %bb716

bb716:                                            ; preds = %bb714, %bb712.bb716_crit_edge, %bb702.bb716_crit_edge
  %i717 = phi i32 [ 0, %bb702.bb716_crit_edge ], [ 1, %bb712.bb716_crit_edge ], [ %i715, %bb714 ]
  %i718 = phi i32 [ 1, %bb702.bb716_crit_edge ], [ 0, %bb712.bb716_crit_edge ], [ 1, %bb714 ]
  %i719 = add nsw i32 %i717, %i361
  %i720 = mul nsw i32 %i719, %arg5
  %i721 = trunc i64 %i363 to i32
  %i722 = add nuw nsw i32 %i718, %i721
  %i723 = add i32 %i722, %i720
  %i724 = sext i32 %i723 to i64
  %i725 = getelementptr inbounds i32, ptr %arg1, i64 %i724
  %i726 = load i32, ptr %i725, align 4, !tbaa !16
  %i727 = icmp sgt i32 %i366, %i726
  br i1 %i727, label %bb728, label %bb716.bb1156_crit_edge

bb716.bb1156_crit_edge:                           ; preds = %bb716
  br label %bb1156

bb728:                                            ; preds = %bb716
  %i729 = sub nsw i32 %i361, %i717
  %i730 = mul nsw i32 %i729, %arg5
  %i731 = sub nsw i32 %i721, %i718
  %i732 = add i32 %i731, %i730
  %i733 = sext i32 %i732 to i64
  %i734 = getelementptr inbounds i32, ptr %arg1, i64 %i733
  %i735 = load i32, ptr %i734, align 4, !tbaa !16
  %i736 = icmp slt i32 %i366, %i735
  br i1 %i736, label %bb728.bb1156_crit_edge, label %bb737

bb728.bb1156_crit_edge:                           ; preds = %bb728
  br label %bb1156

bb737:                                            ; preds = %bb728
  %i738 = shl nsw i32 %i717, 1
  %i739 = add nsw i32 %i738, %i361
  %i740 = mul nsw i32 %i739, %arg5
  %i741 = shl nuw nsw i32 %i718, 1
  %i742 = add nuw i32 %i741, %i721
  %i743 = add i32 %i742, %i740
  %i744 = sext i32 %i743 to i64
  %i745 = getelementptr inbounds i32, ptr %arg1, i64 %i744
  %i746 = load i32, ptr %i745, align 4, !tbaa !16
  %i747 = icmp sgt i32 %i366, %i746
  br i1 %i747, label %bb748, label %bb737.bb1156_crit_edge

bb737.bb1156_crit_edge:                           ; preds = %bb737
  br label %bb1156

bb748:                                            ; preds = %bb737
  %i749 = sub nsw i32 %i361, %i738
  %i750 = mul nsw i32 %i749, %arg5
  %i751 = sub nsw i32 %i721, %i741
  %i752 = add i32 %i751, %i750
  %i753 = sext i32 %i752 to i64
  %i754 = getelementptr inbounds i32, ptr %arg1, i64 %i753
  %i755 = load i32, ptr %i754, align 4, !tbaa !16
  %i756 = icmp slt i32 %i366, %i755
  br i1 %i756, label %bb748.bb1156_crit_edge, label %bb748.bb1153_crit_edge

bb748.bb1153_crit_edge:                           ; preds = %bb748
  br label %bb1153

bb748.bb1156_crit_edge:                           ; preds = %bb748
  br label %bb1156

bb757:                                            ; preds = %bb375.bb757_crit_edge, %bb368.bb757_crit_edge
  %i758 = getelementptr inbounds i8, ptr %i356, i64 %i363
  %i759 = getelementptr inbounds i8, ptr %i758, i64 -1
  %i760 = load i8, ptr %i759, align 1, !tbaa !21
  %i761 = zext i8 %i760 to i64
  %i762 = sub nsw i64 0, %i761
  %i763 = getelementptr inbounds i8, ptr %i373, i64 %i762
  %i764 = load i8, ptr %i763, align 1, !tbaa !21
  %i765 = zext i8 %i764 to i32
  %i766 = getelementptr inbounds i8, ptr %i758, i64 1
  %i767 = load i8, ptr %i758, align 1, !tbaa !21
  %i768 = zext i8 %i767 to i64
  %i769 = sub nsw i64 0, %i768
  %i770 = getelementptr inbounds i8, ptr %i373, i64 %i769
  %i771 = load i8, ptr %i770, align 1, !tbaa !21
  %i772 = zext i8 %i771 to i32
  %i773 = load i8, ptr %i766, align 1, !tbaa !21
  %i774 = zext i8 %i773 to i64
  %i775 = sub nsw i64 0, %i774
  %i776 = getelementptr inbounds i8, ptr %i373, i64 %i775
  %i777 = load i8, ptr %i776, align 1, !tbaa !21
  %i778 = zext i8 %i777 to i32
  %i779 = getelementptr inbounds i8, ptr %i766, i64 %i38
  %i780 = getelementptr inbounds i8, ptr %i779, i64 1
  %i781 = load i8, ptr %i779, align 1, !tbaa !21
  %i782 = zext i8 %i781 to i64
  %i783 = sub nsw i64 0, %i782
  %i784 = getelementptr inbounds i8, ptr %i373, i64 %i783
  %i785 = load i8, ptr %i784, align 1, !tbaa !21
  %i786 = zext i8 %i785 to i32
  %i787 = shl nuw nsw i32 %i786, 2
  %i788 = getelementptr inbounds i8, ptr %i779, i64 2
  %i789 = load i8, ptr %i780, align 1, !tbaa !21
  %i790 = zext i8 %i789 to i64
  %i791 = sub nsw i64 0, %i790
  %i792 = getelementptr inbounds i8, ptr %i373, i64 %i791
  %i793 = load i8, ptr %i792, align 1, !tbaa !21
  %i794 = zext i8 %i793 to i32
  %i795 = getelementptr inbounds i8, ptr %i779, i64 3
  %i796 = load i8, ptr %i788, align 1, !tbaa !21
  %i797 = zext i8 %i796 to i64
  %i798 = sub nsw i64 0, %i797
  %i799 = getelementptr inbounds i8, ptr %i373, i64 %i798
  %i800 = load i8, ptr %i799, align 1, !tbaa !21
  %i801 = zext i8 %i800 to i32
  %i802 = getelementptr inbounds i8, ptr %i779, i64 4
  %i803 = load i8, ptr %i795, align 1, !tbaa !21
  %i804 = zext i8 %i803 to i64
  %i805 = sub nsw i64 0, %i804
  %i806 = getelementptr inbounds i8, ptr %i373, i64 %i805
  %i807 = load i8, ptr %i806, align 1, !tbaa !21
  %i808 = zext i8 %i807 to i32
  %i809 = load i8, ptr %i802, align 1, !tbaa !21
  %i810 = zext i8 %i809 to i64
  %i811 = sub nsw i64 0, %i810
  %i812 = getelementptr inbounds i8, ptr %i373, i64 %i811
  %i813 = load i8, ptr %i812, align 1, !tbaa !21
  %i814 = zext i8 %i813 to i32
  %i815 = shl nuw nsw i32 %i814, 2
  %i816 = getelementptr inbounds i8, ptr %i802, i64 %i40
  %i817 = getelementptr inbounds i8, ptr %i816, i64 1
  %i818 = load i8, ptr %i816, align 1, !tbaa !21
  %i819 = zext i8 %i818 to i64
  %i820 = sub nsw i64 0, %i819
  %i821 = getelementptr inbounds i8, ptr %i373, i64 %i820
  %i822 = load i8, ptr %i821, align 1, !tbaa !21
  %i823 = zext i8 %i822 to i32
  %i824 = getelementptr inbounds i8, ptr %i816, i64 2
  %i825 = load i8, ptr %i817, align 1, !tbaa !21
  %i826 = zext i8 %i825 to i64
  %i827 = sub nsw i64 0, %i826
  %i828 = getelementptr inbounds i8, ptr %i373, i64 %i827
  %i829 = load i8, ptr %i828, align 1, !tbaa !21
  %i830 = zext i8 %i829 to i32
  %i831 = getelementptr inbounds i8, ptr %i816, i64 3
  %i832 = load i8, ptr %i824, align 1, !tbaa !21
  %i833 = zext i8 %i832 to i64
  %i834 = sub nsw i64 0, %i833
  %i835 = getelementptr inbounds i8, ptr %i373, i64 %i834
  %i836 = load i8, ptr %i835, align 1, !tbaa !21
  %i837 = zext i8 %i836 to i32
  %i838 = getelementptr inbounds i8, ptr %i816, i64 4
  %i839 = load i8, ptr %i831, align 1, !tbaa !21
  %i840 = zext i8 %i839 to i64
  %i841 = sub nsw i64 0, %i840
  %i842 = getelementptr inbounds i8, ptr %i373, i64 %i841
  %i843 = load i8, ptr %i842, align 1, !tbaa !21
  %i844 = zext i8 %i843 to i32
  %i845 = getelementptr inbounds i8, ptr %i816, i64 5
  %i846 = load i8, ptr %i838, align 1, !tbaa !21
  %i847 = zext i8 %i846 to i64
  %i848 = sub nsw i64 0, %i847
  %i849 = getelementptr inbounds i8, ptr %i373, i64 %i848
  %i850 = load i8, ptr %i849, align 1, !tbaa !21
  %i851 = zext i8 %i850 to i32
  %i852 = getelementptr inbounds i8, ptr %i816, i64 6
  %i853 = load i8, ptr %i845, align 1, !tbaa !21
  %i854 = zext i8 %i853 to i64
  %i855 = sub nsw i64 0, %i854
  %i856 = getelementptr inbounds i8, ptr %i373, i64 %i855
  %i857 = load i8, ptr %i856, align 1, !tbaa !21
  %i858 = zext i8 %i857 to i32
  %i859 = load i8, ptr %i852, align 1, !tbaa !21
  %i860 = zext i8 %i859 to i64
  %i861 = sub nsw i64 0, %i860
  %i862 = getelementptr inbounds i8, ptr %i373, i64 %i861
  %i863 = load i8, ptr %i862, align 1, !tbaa !21
  %i864 = zext i8 %i863 to i32
  %i865 = getelementptr inbounds i8, ptr %i852, i64 %i42
  %i866 = getelementptr inbounds i8, ptr %i865, i64 6
  %i867 = getelementptr inbounds i8, ptr %i866, i64 %i42
  %i868 = getelementptr inbounds i8, ptr %i867, i64 1
  %i869 = load i8, ptr %i867, align 1, !tbaa !21
  %i870 = zext i8 %i869 to i64
  %i871 = sub nsw i64 0, %i870
  %i872 = getelementptr inbounds i8, ptr %i373, i64 %i871
  %i873 = load i8, ptr %i872, align 1, !tbaa !21
  %i874 = zext i8 %i873 to i32
  %i875 = getelementptr inbounds i8, ptr %i867, i64 2
  %i876 = load i8, ptr %i868, align 1, !tbaa !21
  %i877 = zext i8 %i876 to i64
  %i878 = sub nsw i64 0, %i877
  %i879 = getelementptr inbounds i8, ptr %i373, i64 %i878
  %i880 = load i8, ptr %i879, align 1, !tbaa !21
  %i881 = zext i8 %i880 to i32
  %i882 = getelementptr inbounds i8, ptr %i867, i64 3
  %i883 = load i8, ptr %i875, align 1, !tbaa !21
  %i884 = zext i8 %i883 to i64
  %i885 = sub nsw i64 0, %i884
  %i886 = getelementptr inbounds i8, ptr %i373, i64 %i885
  %i887 = load i8, ptr %i886, align 1, !tbaa !21
  %i888 = zext i8 %i887 to i32
  %i889 = getelementptr inbounds i8, ptr %i867, i64 4
  %i890 = load i8, ptr %i882, align 1, !tbaa !21
  %i891 = zext i8 %i890 to i64
  %i892 = sub nsw i64 0, %i891
  %i893 = getelementptr inbounds i8, ptr %i373, i64 %i892
  %i894 = load i8, ptr %i893, align 1, !tbaa !21
  %i895 = zext i8 %i894 to i32
  %i896 = getelementptr inbounds i8, ptr %i867, i64 5
  %i897 = load i8, ptr %i889, align 1, !tbaa !21
  %i898 = zext i8 %i897 to i64
  %i899 = sub nsw i64 0, %i898
  %i900 = getelementptr inbounds i8, ptr %i373, i64 %i899
  %i901 = load i8, ptr %i900, align 1, !tbaa !21
  %i902 = zext i8 %i901 to i32
  %i903 = getelementptr inbounds i8, ptr %i867, i64 6
  %i904 = load i8, ptr %i896, align 1, !tbaa !21
  %i905 = zext i8 %i904 to i64
  %i906 = sub nsw i64 0, %i905
  %i907 = getelementptr inbounds i8, ptr %i373, i64 %i906
  %i908 = load i8, ptr %i907, align 1, !tbaa !21
  %i909 = zext i8 %i908 to i32
  %i910 = load i8, ptr %i903, align 1, !tbaa !21
  %i911 = zext i8 %i910 to i64
  %i912 = sub nsw i64 0, %i911
  %i913 = getelementptr inbounds i8, ptr %i373, i64 %i912
  %i914 = load i8, ptr %i913, align 1, !tbaa !21
  %i915 = zext i8 %i914 to i32
  %i916 = getelementptr inbounds i8, ptr %i903, i64 %i40
  %i917 = getelementptr inbounds i8, ptr %i916, i64 1
  %i918 = load i8, ptr %i916, align 1, !tbaa !21
  %i919 = zext i8 %i918 to i64
  %i920 = sub nsw i64 0, %i919
  %i921 = getelementptr inbounds i8, ptr %i373, i64 %i920
  %i922 = load i8, ptr %i921, align 1, !tbaa !21
  %i923 = zext i8 %i922 to i32
  %i924 = shl nuw nsw i32 %i923, 2
  %i925 = getelementptr inbounds i8, ptr %i916, i64 2
  %i926 = load i8, ptr %i917, align 1, !tbaa !21
  %i927 = zext i8 %i926 to i64
  %i928 = sub nsw i64 0, %i927
  %i929 = getelementptr inbounds i8, ptr %i373, i64 %i928
  %i930 = load i8, ptr %i929, align 1, !tbaa !21
  %i931 = zext i8 %i930 to i32
  %i932 = getelementptr inbounds i8, ptr %i916, i64 3
  %i933 = load i8, ptr %i925, align 1, !tbaa !21
  %i934 = zext i8 %i933 to i64
  %i935 = sub nsw i64 0, %i934
  %i936 = getelementptr inbounds i8, ptr %i373, i64 %i935
  %i937 = load i8, ptr %i936, align 1, !tbaa !21
  %i938 = zext i8 %i937 to i32
  %i939 = getelementptr inbounds i8, ptr %i916, i64 4
  %i940 = load i8, ptr %i932, align 1, !tbaa !21
  %i941 = zext i8 %i940 to i64
  %i942 = sub nsw i64 0, %i941
  %i943 = getelementptr inbounds i8, ptr %i373, i64 %i942
  %i944 = load i8, ptr %i943, align 1, !tbaa !21
  %i945 = zext i8 %i944 to i32
  %i946 = load i8, ptr %i939, align 1, !tbaa !21
  %i947 = zext i8 %i946 to i64
  %i948 = sub nsw i64 0, %i947
  %i949 = getelementptr inbounds i8, ptr %i373, i64 %i948
  %i950 = load i8, ptr %i949, align 1, !tbaa !21
  %i951 = zext i8 %i950 to i32
  %i952 = shl nuw nsw i32 %i951, 2
  %i953 = getelementptr inbounds i8, ptr %i939, i64 %i38
  %i954 = getelementptr inbounds i8, ptr %i953, i64 1
  %i955 = load i8, ptr %i953, align 1, !tbaa !21
  %i956 = zext i8 %i955 to i64
  %i957 = sub nsw i64 0, %i956
  %i958 = getelementptr inbounds i8, ptr %i373, i64 %i957
  %i959 = load i8, ptr %i958, align 1, !tbaa !21
  %i960 = zext i8 %i959 to i32
  %i961 = getelementptr inbounds i8, ptr %i953, i64 2
  %i962 = load i8, ptr %i954, align 1, !tbaa !21
  %i963 = zext i8 %i962 to i64
  %i964 = sub nsw i64 0, %i963
  %i965 = getelementptr inbounds i8, ptr %i373, i64 %i964
  %i966 = load i8, ptr %i965, align 1, !tbaa !21
  %i967 = zext i8 %i966 to i32
  %i968 = load i8, ptr %i961, align 1, !tbaa !21
  %i969 = zext i8 %i968 to i64
  %i970 = sub nsw i64 0, %i969
  %i971 = getelementptr inbounds i8, ptr %i373, i64 %i970
  %i972 = load i8, ptr %i971, align 1, !tbaa !21
  %i973 = zext i8 %i972 to i32
  %i974 = add nuw nsw i32 %i801, %i794
  %i975 = add nuw nsw i32 %i974, %i808
  %i976 = add nuw nsw i32 %i975, %i931
  %i977 = add nuw nsw i32 %i976, %i938
  %i978 = add nuw nsw i32 %i977, %i945
  %i979 = shl nuw nsw i32 %i978, 2
  %i980 = add nuw nsw i32 %i772, %i765
  %i981 = add nuw nsw i32 %i980, %i778
  %i982 = add nuw nsw i32 %i981, %i960
  %i983 = add nuw nsw i32 %i982, %i967
  %i984 = add nuw nsw i32 %i983, %i973
  %i985 = mul nuw nsw i32 %i984, 9
  %i986 = add nuw nsw i32 %i815, %i787
  %i987 = add nuw nsw i32 %i986, %i823
  %i988 = add nuw nsw i32 %i987, %i830
  %i989 = add nuw nsw i32 %i988, %i837
  %i990 = add nuw nsw i32 %i989, %i844
  %i991 = add nuw nsw i32 %i990, %i851
  %i992 = add nuw nsw i32 %i991, %i858
  %i993 = add nuw nsw i32 %i992, %i864
  %i994 = add nuw nsw i32 %i993, %i874
  %i995 = add nuw nsw i32 %i994, %i881
  %i996 = add nuw nsw i32 %i995, %i888
  %i997 = add nuw nsw i32 %i996, %i895
  %i998 = add nuw nsw i32 %i997, %i902
  %i999 = add nuw nsw i32 %i998, %i909
  %i1000 = add nuw nsw i32 %i999, %i915
  %i1001 = add nuw nsw i32 %i1000, %i924
  %i1002 = add nuw nsw i32 %i1001, %i952
  %i1003 = add nuw nsw i32 %i1002, %i979
  %i1004 = add nuw nsw i32 %i1003, %i985
  %i1005 = add nuw nsw i32 %i765, %i823
  %i1006 = add nuw nsw i32 %i778, %i864
  %i1007 = add nuw nsw i32 %i1006, %i874
  %i1008 = add nuw nsw i32 %i1005, %i915
  %i1009 = add nuw nsw i32 %i1007, %i960
  %i1010 = sub nsw i32 %i1008, %i1009
  %i1011 = add nsw i32 %i1010, %i973
  %i1012 = mul nsw i32 %i1011, 3
  %i1013 = add nuw nsw i32 %i794, %i830
  %i1014 = add nuw nsw i32 %i808, %i858
  %i1015 = add nuw nsw i32 %i1014, %i881
  %i1016 = add nuw nsw i32 %i1013, %i909
  %i1017 = add nuw nsw i32 %i1015, %i931
  %i1018 = sub nsw i32 %i1016, %i1017
  %i1019 = add nsw i32 %i1018, %i945
  %i1020 = shl nsw i32 %i1019, 1
  %i1021 = add nuw nsw i32 %i787, %i837
  %i1022 = add nuw nsw i32 %i815, %i851
  %i1023 = add nuw nsw i32 %i1022, %i888
  %i1024 = add nuw nsw i32 %i1021, %i902
  %i1025 = add nuw nsw i32 %i1023, %i924
  %i1026 = sub nsw i32 %i1024, %i1025
  %i1027 = add nsw i32 %i1026, %i952
  %i1028 = add i32 %i1027, %i1020
  %i1029 = add i32 %i1028, %i1012
  %i1030 = icmp eq i32 %i1004, 0
  br i1 %i1030, label %bb757.bb1112_crit_edge, label %bb1031

bb757.bb1112_crit_edge:                           ; preds = %bb757
  br label %bb1112

bb1031:                                           ; preds = %bb757
  %i1032 = load i8, ptr %i865, align 1, !tbaa !21
  %i1033 = zext i8 %i1032 to i64
  %i1034 = sub nsw i64 0, %i1033
  %i1035 = getelementptr inbounds i8, ptr %i373, i64 %i1034
  %i1036 = load i8, ptr %i1035, align 1, !tbaa !21
  %i1037 = zext i8 %i1036 to i32
  %i1038 = getelementptr inbounds i8, ptr %i865, i64 1
  %i1039 = load i8, ptr %i1038, align 1, !tbaa !21
  %i1040 = zext i8 %i1039 to i64
  %i1041 = sub nsw i64 0, %i1040
  %i1042 = getelementptr inbounds i8, ptr %i373, i64 %i1041
  %i1043 = load i8, ptr %i1042, align 1, !tbaa !21
  %i1044 = zext i8 %i1043 to i32
  %i1045 = getelementptr inbounds i8, ptr %i865, i64 2
  %i1046 = load i8, ptr %i1045, align 1, !tbaa !21
  %i1047 = zext i8 %i1046 to i64
  %i1048 = sub nsw i64 0, %i1047
  %i1049 = getelementptr inbounds i8, ptr %i373, i64 %i1048
  %i1050 = load i8, ptr %i1049, align 1, !tbaa !21
  %i1051 = zext i8 %i1050 to i32
  %i1052 = getelementptr inbounds i8, ptr %i865, i64 4
  %i1053 = load i8, ptr %i1052, align 1, !tbaa !21
  %i1054 = zext i8 %i1053 to i64
  %i1055 = sub nsw i64 0, %i1054
  %i1056 = getelementptr inbounds i8, ptr %i373, i64 %i1055
  %i1057 = load i8, ptr %i1056, align 1, !tbaa !21
  %i1058 = zext i8 %i1057 to i32
  %i1059 = getelementptr inbounds i8, ptr %i865, i64 5
  %i1060 = load i8, ptr %i1059, align 1, !tbaa !21
  %i1061 = zext i8 %i1060 to i64
  %i1062 = sub nsw i64 0, %i1061
  %i1063 = getelementptr inbounds i8, ptr %i373, i64 %i1062
  %i1064 = load i8, ptr %i1063, align 1, !tbaa !21
  %i1065 = zext i8 %i1064 to i32
  %i1066 = load i8, ptr %i866, align 1, !tbaa !21
  %i1067 = zext i8 %i1066 to i64
  %i1068 = sub nsw i64 0, %i1067
  %i1069 = getelementptr inbounds i8, ptr %i373, i64 %i1068
  %i1070 = load i8, ptr %i1069, align 1, !tbaa !21
  %i1071 = zext i8 %i1070 to i32
  %i1072 = add nuw nsw i32 %i858, %i830
  %i1073 = add nuw nsw i32 %i1072, %i881
  %i1074 = add nuw nsw i32 %i1073, %i909
  %i1075 = add nuw nsw i32 %i1074, %i1044
  %i1076 = add nuw nsw i32 %i1075, %i1065
  %i1077 = shl nuw nsw i32 %i1076, 2
  %i1078 = add nuw nsw i32 %i864, %i823
  %i1079 = add nuw nsw i32 %i1078, %i874
  %i1080 = add nuw nsw i32 %i1079, %i915
  %i1081 = add nuw nsw i32 %i1080, %i1037
  %i1082 = add nuw nsw i32 %i1081, %i1071
  %i1083 = mul nuw nsw i32 %i1082, 9
  %i1084 = add nuw nsw i32 %i778, %i765
  %i1085 = add nuw nsw i32 %i1084, %i787
  %i1086 = add nuw nsw i32 %i1085, %i794
  %i1087 = add nuw nsw i32 %i1086, %i808
  %i1088 = add nuw nsw i32 %i1087, %i815
  %i1089 = add nuw nsw i32 %i1088, %i837
  %i1090 = add nuw nsw i32 %i1089, %i851
  %i1091 = add nuw nsw i32 %i1090, %i888
  %i1092 = add nuw nsw i32 %i1091, %i902
  %i1093 = add nuw nsw i32 %i1092, %i924
  %i1094 = add nuw nsw i32 %i1093, %i931
  %i1095 = add nuw nsw i32 %i1094, %i945
  %i1096 = add nuw nsw i32 %i1095, %i952
  %i1097 = add nuw nsw i32 %i1096, %i960
  %i1098 = add nuw nsw i32 %i1097, %i973
  %i1099 = add nuw nsw i32 %i1098, %i1051
  %i1100 = add nuw nsw i32 %i1099, %i1058
  %i1101 = add nuw nsw i32 %i1100, %i1077
  %i1102 = add nuw nsw i32 %i1101, %i1083
  %i1103 = sitofp i32 %i1102 to float
  %i1104 = sitofp i32 %i1004 to float
  %i1105 = fdiv float %i1103, %i1104
  %i1106 = fcmp olt float %i1105, 5.000000e-01
  br i1 %i1106, label %bb1031.bb1112_crit_edge, label %bb1107

bb1031.bb1112_crit_edge:                          ; preds = %bb1031
  br label %bb1112

bb1107:                                           ; preds = %bb1031
  %i1108 = fcmp ogt float %i1105, 2.000000e+00
  br i1 %i1108, label %bb1107.bb1112_crit_edge, label %bb1109

bb1107.bb1112_crit_edge:                          ; preds = %bb1107
  br label %bb1112

bb1109:                                           ; preds = %bb1107
  %i1110 = icmp slt i32 %i1029, 1
  %i1111 = select i1 %i1110, i32 1, i32 -1
  br label %bb1112

bb1112:                                           ; preds = %bb1109, %bb1107.bb1112_crit_edge, %bb1031.bb1112_crit_edge, %bb757.bb1112_crit_edge
  %i1113 = phi i32 [ 0, %bb1031.bb1112_crit_edge ], [ 1, %bb1107.bb1112_crit_edge ], [ %i1111, %bb1109 ], [ 1, %bb757.bb1112_crit_edge ]
  %i1114 = phi i32 [ 1, %bb1031.bb1112_crit_edge ], [ 0, %bb1107.bb1112_crit_edge ], [ 1, %bb1109 ], [ 0, %bb757.bb1112_crit_edge ]
  %i1115 = add nsw i32 %i1113, %i360
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
  %i1125 = sub nsw i32 %i360, %i1113
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
  %i1135 = add nsw i32 %i1134, %i360
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
  %i1145 = sub nsw i32 %i360, %i1134
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

bb1153:                                           ; preds = %bb1144.bb1153_crit_edge, %bb748.bb1153_crit_edge
  %i1154 = phi i8 [ 1, %bb748.bb1153_crit_edge ], [ 2, %bb1144.bb1153_crit_edge ]
  %i1155 = getelementptr inbounds i8, ptr %arg2, i64 %i364
  store i8 %i1154, ptr %i1155, align 1, !tbaa !21
  br label %bb1156

bb1156:                                           ; preds = %bb1153, %bb1144.bb1156_crit_edge, %bb1133.bb1156_crit_edge, %bb1124.bb1156_crit_edge, %bb1112.bb1156_crit_edge, %bb748.bb1156_crit_edge, %bb737.bb1156_crit_edge, %bb728.bb1156_crit_edge, %bb716.bb1156_crit_edge, %bb362.bb1156_crit_edge
  %i1157 = add nuw nsw i64 %i363, 1
  %i1158 = icmp eq i64 %i1157, %i45
  br i1 %i1158, label %bb1159.loopexit, label %bb1156.bb362_crit_edge, !llvm.loop !46

bb1156.bb362_crit_edge:                           ; preds = %bb1156
  br label %bb362

bb1159.loopexit:                                  ; preds = %bb1156
  br label %bb1159

bb1159:                                           ; preds = %bb1159.loopexit, %bb351.bb1159_crit_edge
  %i1160 = add nuw nsw i64 %i352, 1
  %i1161 = icmp eq i64 %i1160, %i44
  br i1 %i1161, label %bb1162.loopexit, label %bb1159.bb351_crit_edge, !llvm.loop !47

bb1159.bb351_crit_edge:                           ; preds = %bb1159
  br label %bb351

bb1162.loopexit:                                  ; preds = %bb1159
  br label %bb1162

bb1162:                                           ; preds = %bb1162.loopexit, %bb31.bb1162_crit_edge, %bb.bb1162_crit_edge
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
  br i1 %i9, label %bb10, label %bb.bb361_crit_edge

bb.bb361_crit_edge:                               ; preds = %bb
  br label %bb361

bb10:                                             ; preds = %bb
  %i11 = add nsw i32 %arg6, -1
  %i12 = add i32 %arg5, -1
  %i13 = icmp sgt i32 %arg5, 2
  %i14 = add nsw i32 %arg5, -2
  %i15 = sext i32 %i14 to i64
  %i16 = sext i32 %arg5 to i64
  %i17 = zext nneg i32 %i11 to i64
  %i18 = zext nneg i32 %i12 to i64
  br label %bb19

bb19:                                             ; preds = %bb116.bb19_crit_edge, %bb10
  %i20 = phi i64 [ 1, %bb10 ], [ %i117, %bb116.bb19_crit_edge ]
  br i1 %i13, label %bb21, label %bb19.bb116_crit_edge

bb19.bb116_crit_edge:                             ; preds = %bb19
  br label %bb116

bb21:                                             ; preds = %bb19
  %i22 = add nsw i64 %i20, -1
  %i23 = mul nsw i64 %i22, %i16
  %i24 = getelementptr inbounds i8, ptr %arg, i64 %i23
  %i25 = trunc i64 %i20 to i32
  %i26 = mul i32 %i25, %arg5
  %i27 = zext i32 %i26 to i64
  br label %bb38

bb28:                                             ; preds = %bb116
  %i29 = icmp sgt i32 %arg6, 4
  br i1 %i29, label %bb30, label %bb28.bb361_crit_edge

bb28.bb361_crit_edge:                             ; preds = %bb28
  br label %bb361

bb30:                                             ; preds = %bb28
  %i31 = add nsw i32 %arg6, -2
  %i32 = add i32 %arg5, -2
  %i33 = icmp sgt i32 %arg5, 4
  %i34 = sext i32 %i32 to i64
  %i35 = sext i32 %arg5 to i64
  %i36 = zext nneg i32 %i31 to i64
  %i37 = zext nneg i32 %i32 to i64
  br label %bb119

bb38:                                             ; preds = %bb113.bb38_crit_edge, %bb21
  %i39 = phi i64 [ 1, %bb21 ], [ %i114, %bb113.bb38_crit_edge ]
  %i40 = getelementptr inbounds i8, ptr %i24, i64 %i39
  %i41 = getelementptr inbounds i8, ptr %i40, i64 -1
  %i42 = add nuw nsw i64 %i39, %i27
  %i43 = getelementptr inbounds i8, ptr %arg, i64 %i42
  %i44 = load i8, ptr %i43, align 1, !tbaa !21
  %i45 = zext i8 %i44 to i64
  %i46 = getelementptr inbounds i8, ptr %arg3, i64 %i45
  %i47 = load i8, ptr %i41, align 1, !tbaa !21
  %i48 = zext i8 %i47 to i64
  %i49 = sub nsw i64 0, %i48
  %i50 = getelementptr inbounds i8, ptr %i46, i64 %i49
  %i51 = load i8, ptr %i50, align 1, !tbaa !21
  %i52 = zext i8 %i51 to i32
  %i53 = add nuw nsw i32 %i52, 100
  %i54 = getelementptr inbounds i8, ptr %i40, i64 1
  %i55 = load i8, ptr %i40, align 1, !tbaa !21
  %i56 = zext i8 %i55 to i64
  %i57 = sub nsw i64 0, %i56
  %i58 = getelementptr inbounds i8, ptr %i46, i64 %i57
  %i59 = load i8, ptr %i58, align 1, !tbaa !21
  %i60 = zext i8 %i59 to i32
  %i61 = add nuw nsw i32 %i53, %i60
  %i62 = load i8, ptr %i54, align 1, !tbaa !21
  %i63 = zext i8 %i62 to i64
  %i64 = sub nsw i64 0, %i63
  %i65 = getelementptr inbounds i8, ptr %i46, i64 %i64
  %i66 = load i8, ptr %i65, align 1, !tbaa !21
  %i67 = zext i8 %i66 to i32
  %i68 = add nuw nsw i32 %i61, %i67
  %i69 = getelementptr inbounds i8, ptr %i54, i64 %i15
  %i70 = load i8, ptr %i69, align 1, !tbaa !21
  %i71 = zext i8 %i70 to i64
  %i72 = sub nsw i64 0, %i71
  %i73 = getelementptr inbounds i8, ptr %i46, i64 %i72
  %i74 = load i8, ptr %i73, align 1, !tbaa !21
  %i75 = zext i8 %i74 to i32
  %i76 = add nuw nsw i32 %i68, %i75
  %i77 = getelementptr inbounds i8, ptr %i69, i64 2
  %i78 = load i8, ptr %i77, align 1, !tbaa !21
  %i79 = zext i8 %i78 to i64
  %i80 = sub nsw i64 0, %i79
  %i81 = getelementptr inbounds i8, ptr %i46, i64 %i80
  %i82 = load i8, ptr %i81, align 1, !tbaa !21
  %i83 = zext i8 %i82 to i32
  %i84 = add nuw nsw i32 %i76, %i83
  %i85 = getelementptr inbounds i8, ptr %i77, i64 %i15
  %i86 = getelementptr inbounds i8, ptr %i85, i64 1
  %i87 = load i8, ptr %i85, align 1, !tbaa !21
  %i88 = zext i8 %i87 to i64
  %i89 = sub nsw i64 0, %i88
  %i90 = getelementptr inbounds i8, ptr %i46, i64 %i89
  %i91 = load i8, ptr %i90, align 1, !tbaa !21
  %i92 = zext i8 %i91 to i32
  %i93 = add nuw nsw i32 %i84, %i92
  %i94 = getelementptr inbounds i8, ptr %i85, i64 2
  %i95 = load i8, ptr %i86, align 1, !tbaa !21
  %i96 = zext i8 %i95 to i64
  %i97 = sub nsw i64 0, %i96
  %i98 = getelementptr inbounds i8, ptr %i46, i64 %i97
  %i99 = load i8, ptr %i98, align 1, !tbaa !21
  %i100 = zext i8 %i99 to i32
  %i101 = add nuw nsw i32 %i93, %i100
  %i102 = load i8, ptr %i94, align 1, !tbaa !21
  %i103 = zext i8 %i102 to i64
  %i104 = sub nsw i64 0, %i103
  %i105 = getelementptr inbounds i8, ptr %i46, i64 %i104
  %i106 = load i8, ptr %i105, align 1, !tbaa !21
  %i107 = zext i8 %i106 to i32
  %i108 = add nuw nsw i32 %i101, %i107
  %i109 = icmp ult i32 %i108, 731
  br i1 %i109, label %bb110, label %bb38.bb113_crit_edge

bb38.bb113_crit_edge:                             ; preds = %bb38
  br label %bb113

bb110:                                            ; preds = %bb38
  %i111 = sub nuw nsw i32 730, %i108
  %i112 = getelementptr inbounds i32, ptr %arg1, i64 %i42
  store i32 %i111, ptr %i112, align 4, !tbaa !16
  br label %bb113

bb113:                                            ; preds = %bb110, %bb38.bb113_crit_edge
  %i114 = add nuw nsw i64 %i39, 1
  %i115 = icmp eq i64 %i114, %i18
  br i1 %i115, label %bb116.loopexit, label %bb113.bb38_crit_edge, !llvm.loop !48

bb113.bb38_crit_edge:                             ; preds = %bb113
  br label %bb38

bb116.loopexit:                                   ; preds = %bb113
  br label %bb116

bb116:                                            ; preds = %bb116.loopexit, %bb19.bb116_crit_edge
  %i117 = add nuw nsw i64 %i20, 1
  %i118 = icmp eq i64 %i117, %i17
  br i1 %i118, label %bb28, label %bb116.bb19_crit_edge, !llvm.loop !49

bb116.bb19_crit_edge:                             ; preds = %bb116
  br label %bb19

bb119:                                            ; preds = %bb358.bb119_crit_edge, %bb30
  %i120 = phi i64 [ 2, %bb30 ], [ %i359, %bb358.bb119_crit_edge ]
  br i1 %i33, label %bb121, label %bb119.bb358_crit_edge

bb119.bb358_crit_edge:                            ; preds = %bb119
  br label %bb358

bb121:                                            ; preds = %bb119
  %i122 = add nsw i64 %i120, -1
  %i123 = mul nsw i64 %i122, %i35
  %i124 = getelementptr inbounds i8, ptr %arg, i64 %i123
  %i125 = trunc i64 %i120 to i32
  %i126 = mul i32 %i125, %arg5
  %i127 = zext i32 %i126 to i64
  %i128 = trunc i64 %i120 to i32
  %i129 = trunc i64 %i120 to i32
  br label %bb130

bb130:                                            ; preds = %bb355.bb130_crit_edge, %bb121
  %i131 = phi i64 [ 2, %bb121 ], [ %i356, %bb355.bb130_crit_edge ]
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
  br i1 %i141, label %bb142, label %bb136.bb254_crit_edge

bb136.bb254_crit_edge:                            ; preds = %bb136
  br label %bb254

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
  %i165 = getelementptr inbounds i8, ptr %i152, i64 %i34
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
  %i179 = getelementptr inbounds i8, ptr %i172, i64 %i34
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
  br i1 %i218, label %bb219, label %bb142.bb254_crit_edge

bb142.bb254_crit_edge:                            ; preds = %bb142
  br label %bb254

bb219:                                            ; preds = %bb142
  %i220 = icmp eq i32 %i208, 0
  %i221 = sitofp i32 %i209 to float
  %i222 = sitofp i32 %i208 to float
  %i223 = fdiv float %i221, %i222
  %i224 = select i1 %i220, float 1.000000e+06, float %i223
  %i225 = fcmp uge float %i224, 0.000000e+00
  %i226 = fneg float %i224
  %i227 = select i1 %i225, float %i224, float %i226
  %i228 = fcmp olt float %i227, 5.000000e-01
  br i1 %i228, label %bb219.bb233_crit_edge, label %bb229

bb219.bb233_crit_edge:                            ; preds = %bb219
  br label %bb233

bb229:                                            ; preds = %bb219
  %i230 = fcmp ogt float %i227, 2.000000e+00
  br i1 %i230, label %bb229.bb233_crit_edge, label %bb231

bb229.bb233_crit_edge:                            ; preds = %bb229
  br label %bb233

bb231:                                            ; preds = %bb229
  %i232 = select i1 %i225, i32 1, i32 -1
  br label %bb233

bb233:                                            ; preds = %bb231, %bb229.bb233_crit_edge, %bb219.bb233_crit_edge
  %i234 = phi i32 [ 0, %bb219.bb233_crit_edge ], [ 1, %bb229.bb233_crit_edge ], [ %i232, %bb231 ]
  %i235 = phi i32 [ 1, %bb219.bb233_crit_edge ], [ 0, %bb229.bb233_crit_edge ], [ 1, %bb231 ]
  %i236 = add nsw i32 %i234, %i129
  %i237 = mul nsw i32 %i236, %arg5
  %i238 = trunc i64 %i131 to i32
  %i239 = add nuw nsw i32 %i235, %i238
  %i240 = add i32 %i239, %i237
  %i241 = sext i32 %i240 to i64
  %i242 = getelementptr inbounds i32, ptr %arg1, i64 %i241
  %i243 = load i32, ptr %i242, align 4, !tbaa !16
  %i244 = icmp sgt i32 %i134, %i243
  br i1 %i244, label %bb245, label %bb233.bb355_crit_edge

bb233.bb355_crit_edge:                            ; preds = %bb233
  br label %bb355

bb245:                                            ; preds = %bb233
  %i246 = sub nsw i32 %i129, %i234
  %i247 = mul nsw i32 %i246, %arg5
  %i248 = sub nsw i32 %i238, %i235
  %i249 = add i32 %i248, %i247
  %i250 = sext i32 %i249 to i64
  %i251 = getelementptr inbounds i32, ptr %arg1, i64 %i250
  %i252 = load i32, ptr %i251, align 4, !tbaa !16
  %i253 = icmp slt i32 %i134, %i252
  br i1 %i253, label %bb245.bb355_crit_edge, label %bb245.bb352_crit_edge

bb245.bb352_crit_edge:                            ; preds = %bb245
  br label %bb352

bb245.bb355_crit_edge:                            ; preds = %bb245
  br label %bb355

bb254:                                            ; preds = %bb142.bb254_crit_edge, %bb136.bb254_crit_edge
  %i255 = getelementptr inbounds i8, ptr %i124, i64 %i131
  %i256 = getelementptr inbounds i8, ptr %i255, i64 -1
  %i257 = load i8, ptr %i256, align 1, !tbaa !21
  %i258 = zext i8 %i257 to i64
  %i259 = sub nsw i64 0, %i258
  %i260 = getelementptr inbounds i8, ptr %i140, i64 %i259
  %i261 = load i8, ptr %i260, align 1, !tbaa !21
  %i262 = zext i8 %i261 to i32
  %i263 = getelementptr inbounds i8, ptr %i255, i64 1
  %i264 = load i8, ptr %i255, align 1, !tbaa !21
  %i265 = zext i8 %i264 to i64
  %i266 = sub nsw i64 0, %i265
  %i267 = getelementptr inbounds i8, ptr %i140, i64 %i266
  %i268 = load i8, ptr %i267, align 1, !tbaa !21
  %i269 = zext i8 %i268 to i32
  %i270 = load i8, ptr %i263, align 1, !tbaa !21
  %i271 = zext i8 %i270 to i64
  %i272 = sub nsw i64 0, %i271
  %i273 = getelementptr inbounds i8, ptr %i140, i64 %i272
  %i274 = load i8, ptr %i273, align 1, !tbaa !21
  %i275 = zext i8 %i274 to i32
  %i276 = getelementptr inbounds i8, ptr %i263, i64 %i34
  %i277 = getelementptr inbounds i8, ptr %i276, i64 2
  %i278 = getelementptr inbounds i8, ptr %i277, i64 %i34
  %i279 = getelementptr inbounds i8, ptr %i278, i64 1
  %i280 = load i8, ptr %i278, align 1, !tbaa !21
  %i281 = zext i8 %i280 to i64
  %i282 = sub nsw i64 0, %i281
  %i283 = getelementptr inbounds i8, ptr %i140, i64 %i282
  %i284 = load i8, ptr %i283, align 1, !tbaa !21
  %i285 = zext i8 %i284 to i32
  %i286 = getelementptr inbounds i8, ptr %i278, i64 2
  %i287 = load i8, ptr %i279, align 1, !tbaa !21
  %i288 = zext i8 %i287 to i64
  %i289 = sub nsw i64 0, %i288
  %i290 = getelementptr inbounds i8, ptr %i140, i64 %i289
  %i291 = load i8, ptr %i290, align 1, !tbaa !21
  %i292 = zext i8 %i291 to i32
  %i293 = load i8, ptr %i286, align 1, !tbaa !21
  %i294 = zext i8 %i293 to i64
  %i295 = sub nsw i64 0, %i294
  %i296 = getelementptr inbounds i8, ptr %i140, i64 %i295
  %i297 = load i8, ptr %i296, align 1, !tbaa !21
  %i298 = zext i8 %i297 to i32
  %i299 = add nuw nsw i32 %i285, %i275
  %i300 = add nuw nsw i32 %i299, %i262
  %i301 = add nuw nsw i32 %i300, %i269
  %i302 = add nuw nsw i32 %i301, %i292
  %i303 = add nuw nsw i32 %i302, %i298
  %i304 = add nuw nsw i32 %i298, %i262
  %i305 = icmp eq i32 %i303, 0
  br i1 %i305, label %bb254.bb331_crit_edge, label %bb306

bb254.bb331_crit_edge:                            ; preds = %bb254
  br label %bb331

bb306:                                            ; preds = %bb254
  %i307 = load i8, ptr %i276, align 1, !tbaa !21
  %i308 = zext i8 %i307 to i64
  %i309 = sub nsw i64 0, %i308
  %i310 = getelementptr inbounds i8, ptr %i140, i64 %i309
  %i311 = load i8, ptr %i310, align 1, !tbaa !21
  %i312 = zext i8 %i311 to i32
  %i313 = load i8, ptr %i277, align 1, !tbaa !21
  %i314 = zext i8 %i313 to i64
  %i315 = sub nsw i64 0, %i314
  %i316 = getelementptr inbounds i8, ptr %i140, i64 %i315
  %i317 = load i8, ptr %i316, align 1, !tbaa !21
  %i318 = zext i8 %i317 to i32
  %i319 = add nuw nsw i32 %i300, %i298
  %i320 = add nuw nsw i32 %i319, %i312
  %i321 = add nuw nsw i32 %i320, %i318
  %i322 = sitofp i32 %i321 to float
  %i323 = sitofp i32 %i303 to float
  %i324 = fdiv float %i322, %i323
  %i325 = fcmp olt float %i324, 5.000000e-01
  br i1 %i325, label %bb306.bb331_crit_edge, label %bb326

bb306.bb331_crit_edge:                            ; preds = %bb306
  br label %bb331

bb326:                                            ; preds = %bb306
  %i327 = fcmp ogt float %i324, 2.000000e+00
  br i1 %i327, label %bb326.bb331_crit_edge, label %bb328

bb326.bb331_crit_edge:                            ; preds = %bb326
  br label %bb331

bb328:                                            ; preds = %bb326
  %i329 = icmp ugt i32 %i304, %i299
  %i330 = select i1 %i329, i32 -1, i32 1
  br label %bb331

bb331:                                            ; preds = %bb328, %bb326.bb331_crit_edge, %bb306.bb331_crit_edge, %bb254.bb331_crit_edge
  %i332 = phi i32 [ 0, %bb306.bb331_crit_edge ], [ 1, %bb326.bb331_crit_edge ], [ %i330, %bb328 ], [ 1, %bb254.bb331_crit_edge ]
  %i333 = phi i32 [ 1, %bb306.bb331_crit_edge ], [ 0, %bb326.bb331_crit_edge ], [ 1, %bb328 ], [ 0, %bb254.bb331_crit_edge ]
  %i334 = add nsw i32 %i332, %i128
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
  %i344 = sub nsw i32 %i128, %i332
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

bb352:                                            ; preds = %bb343.bb352_crit_edge, %bb245.bb352_crit_edge
  %i353 = phi i8 [ 1, %bb245.bb352_crit_edge ], [ 2, %bb343.bb352_crit_edge ]
  %i354 = getelementptr inbounds i8, ptr %arg2, i64 %i132
  store i8 %i353, ptr %i354, align 1, !tbaa !21
  br label %bb355

bb355:                                            ; preds = %bb352, %bb343.bb355_crit_edge, %bb331.bb355_crit_edge, %bb245.bb355_crit_edge, %bb233.bb355_crit_edge, %bb130.bb355_crit_edge
  %i356 = add nuw nsw i64 %i131, 1
  %i357 = icmp eq i64 %i356, %i37
  br i1 %i357, label %bb358.loopexit, label %bb355.bb130_crit_edge, !llvm.loop !50

bb355.bb130_crit_edge:                            ; preds = %bb355
  br label %bb130

bb358.loopexit:                                   ; preds = %bb355
  br label %bb358

bb358:                                            ; preds = %bb358.loopexit, %bb119.bb358_crit_edge
  %i359 = add nuw nsw i64 %i120, 1
  %i360 = icmp eq i64 %i359, %i36
  br i1 %i360, label %bb361.loopexit, label %bb358.bb119_crit_edge, !llvm.loop !51

bb358.bb119_crit_edge:                            ; preds = %bb358
  br label %bb119

bb361.loopexit:                                   ; preds = %bb358
  br label %bb361

bb361:                                            ; preds = %bb361.loopexit, %bb28.bb361_crit_edge, %bb.bb361_crit_edge
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @corner_draw(ptr nocapture noundef writeonly %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2, i32 noundef %arg3) local_unnamed_addr #17 {
bb:
  %i = getelementptr inbounds %struct.anon, ptr %arg1, i64 0, i32 2
  %i4 = load i32, ptr %i, align 4, !tbaa !52
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
  %i14 = load i32, ptr %i13, align 4, !tbaa !54
  br i1 %i7, label %bb15, label %bb31

bb15:                                             ; preds = %bb10
  %i16 = add nsw i32 %i14, -1
  %i17 = mul nsw i32 %i16, %arg2
  %i18 = sext i32 %i17 to i64
  %i19 = getelementptr inbounds i8, ptr %arg, i64 %i18
  %i20 = load i32, ptr %i12, align 4, !tbaa !55
  %i21 = sext i32 %i20 to i64
  %i22 = getelementptr inbounds i8, ptr %i19, i64 %i21
  %i23 = getelementptr inbounds i8, ptr %i22, i64 -1
  store i8 -1, ptr %i23, align 1, !tbaa !21
  %i24 = getelementptr inbounds i8, ptr %i22, i64 1
  store i8 -1, ptr %i22, align 1, !tbaa !21
  store i8 -1, ptr %i24, align 1, !tbaa !21
  %i25 = getelementptr inbounds i8, ptr %i24, i64 %i9
  %i26 = getelementptr inbounds i8, ptr %i25, i64 1
  store i8 -1, ptr %i25, align 1, !tbaa !21
  %i27 = getelementptr inbounds i8, ptr %i25, i64 2
  store i8 0, ptr %i26, align 1, !tbaa !21
  store i8 -1, ptr %i27, align 1, !tbaa !21
  %i28 = getelementptr inbounds i8, ptr %i27, i64 %i9
  %i29 = getelementptr inbounds i8, ptr %i28, i64 1
  store i8 -1, ptr %i28, align 1, !tbaa !21
  %i30 = getelementptr inbounds i8, ptr %i28, i64 2
  store i8 -1, ptr %i29, align 1, !tbaa !21
  store i8 -1, ptr %i30, align 1, !tbaa !21
  br label %bb38

bb31:                                             ; preds = %bb10
  %i32 = mul nsw i32 %i14, %arg2
  %i33 = sext i32 %i32 to i64
  %i34 = getelementptr inbounds i8, ptr %arg, i64 %i33
  %i35 = load i32, ptr %i12, align 4, !tbaa !55
  %i36 = sext i32 %i35 to i64
  %i37 = getelementptr inbounds i8, ptr %i34, i64 %i36
  store i8 0, ptr %i37, align 1, !tbaa !21
  br label %bb38

bb38:                                             ; preds = %bb31, %bb15
  %i39 = add nuw nsw i64 %i11, 1
  %i40 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i39
  %i41 = getelementptr inbounds %struct.anon, ptr %arg1, i64 %i39, i32 2
  %i42 = load i32, ptr %i41, align 4, !tbaa !52
  %i43 = icmp eq i32 %i42, 7
  br i1 %i43, label %bb44.loopexit, label %bb38.bb10_crit_edge, !llvm.loop !56

bb38.bb10_crit_edge:                              ; preds = %bb38
  br label %bb10

bb44.loopexit:                                    ; preds = %bb38
  br label %bb44

bb44:                                             ; preds = %bb44.loopexit, %bb.bb44_crit_edge
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
  br i1 %i12, label %bb13, label %bb.bb846_crit_edge

bb.bb846_crit_edge:                               ; preds = %bb
  br label %bb846

bb13:                                             ; preds = %bb
  %i14 = add i32 %arg5, -5
  %i15 = icmp sgt i32 %arg5, 10
  %i16 = add nsw i32 %arg5, -3
  %i17 = sext i32 %i16 to i64
  %i18 = sext i32 %i14 to i64
  %i19 = add nsw i32 %arg5, -6
  %i20 = sext i32 %i19 to i64
  %i21 = sext i32 %arg5 to i64
  %i22 = zext nneg i32 %i11 to i64
  %i23 = zext nneg i32 %i14 to i64
  br label %bb24

bb24:                                             ; preds = %bb587.bb24_crit_edge, %bb13
  %i25 = phi i64 [ 5, %bb13 ], [ %i588, %bb587.bb24_crit_edge ]
  br i1 %i15, label %bb26, label %bb24.bb587_crit_edge

bb24.bb587_crit_edge:                             ; preds = %bb24
  br label %bb587

bb26:                                             ; preds = %bb24
  %i27 = add nsw i64 %i25, -3
  %i28 = mul nsw i64 %i27, %i21
  %i29 = getelementptr inbounds i8, ptr %arg, i64 %i28
  %i30 = trunc i64 %i25 to i32
  %i31 = mul i32 %i30, %arg5
  %i32 = zext i32 %i31 to i64
  %i33 = trunc i64 %i25 to i32
  %i34 = trunc i64 %i25 to i32
  br label %bb42

bb35:                                             ; preds = %bb587
  br i1 %i12, label %bb36, label %bb35.bb846_crit_edge

bb35.bb846_crit_edge:                             ; preds = %bb35
  br label %bb846

bb36:                                             ; preds = %bb35
  %i37 = add i32 %arg5, -5
  %i38 = icmp sgt i32 %arg5, 10
  %i39 = sext i32 %arg5 to i64
  %i40 = zext nneg i32 %i11 to i64
  %i41 = zext nneg i32 %i37 to i64
  br label %bb590

bb42:                                             ; preds = %bb584.bb42_crit_edge, %bb26
  %i43 = phi i64 [ 5, %bb26 ], [ %i585, %bb584.bb42_crit_edge ]
  %i44 = getelementptr inbounds i8, ptr %i29, i64 %i43
  %i45 = getelementptr inbounds i8, ptr %i44, i64 -1
  %i46 = add nuw nsw i64 %i43, %i32
  %i47 = getelementptr inbounds i8, ptr %arg, i64 %i46
  %i48 = load i8, ptr %i47, align 1, !tbaa !21
  %i49 = zext i8 %i48 to i64
  %i50 = getelementptr inbounds i8, ptr %arg2, i64 %i49
  %i51 = load i8, ptr %i45, align 1, !tbaa !21
  %i52 = zext i8 %i51 to i64
  %i53 = sub nsw i64 0, %i52
  %i54 = getelementptr inbounds i8, ptr %i50, i64 %i53
  %i55 = load i8, ptr %i54, align 1, !tbaa !21
  %i56 = zext i8 %i55 to i32
  %i57 = add nuw nsw i32 %i56, 100
  %i58 = getelementptr inbounds i8, ptr %i44, i64 1
  %i59 = load i8, ptr %i44, align 1, !tbaa !21
  %i60 = zext i8 %i59 to i64
  %i61 = sub nsw i64 0, %i60
  %i62 = getelementptr inbounds i8, ptr %i50, i64 %i61
  %i63 = load i8, ptr %i62, align 1, !tbaa !21
  %i64 = zext i8 %i63 to i32
  %i65 = add nuw nsw i32 %i57, %i64
  %i66 = load i8, ptr %i58, align 1, !tbaa !21
  %i67 = zext i8 %i66 to i64
  %i68 = sub nsw i64 0, %i67
  %i69 = getelementptr inbounds i8, ptr %i50, i64 %i68
  %i70 = load i8, ptr %i69, align 1, !tbaa !21
  %i71 = zext i8 %i70 to i32
  %i72 = add nuw nsw i32 %i65, %i71
  %i73 = getelementptr inbounds i8, ptr %i58, i64 %i17
  %i74 = getelementptr inbounds i8, ptr %i73, i64 1
  %i75 = load i8, ptr %i73, align 1, !tbaa !21
  %i76 = zext i8 %i75 to i64
  %i77 = sub nsw i64 0, %i76
  %i78 = getelementptr inbounds i8, ptr %i50, i64 %i77
  %i79 = load i8, ptr %i78, align 1, !tbaa !21
  %i80 = zext i8 %i79 to i32
  %i81 = add nuw nsw i32 %i72, %i80
  %i82 = getelementptr inbounds i8, ptr %i73, i64 2
  %i83 = load i8, ptr %i74, align 1, !tbaa !21
  %i84 = zext i8 %i83 to i64
  %i85 = sub nsw i64 0, %i84
  %i86 = getelementptr inbounds i8, ptr %i50, i64 %i85
  %i87 = load i8, ptr %i86, align 1, !tbaa !21
  %i88 = zext i8 %i87 to i32
  %i89 = add nuw nsw i32 %i81, %i88
  %i90 = getelementptr inbounds i8, ptr %i73, i64 3
  %i91 = load i8, ptr %i82, align 1, !tbaa !21
  %i92 = zext i8 %i91 to i64
  %i93 = sub nsw i64 0, %i92
  %i94 = getelementptr inbounds i8, ptr %i50, i64 %i93
  %i95 = load i8, ptr %i94, align 1, !tbaa !21
  %i96 = zext i8 %i95 to i32
  %i97 = add nuw nsw i32 %i89, %i96
  %i98 = getelementptr inbounds i8, ptr %i73, i64 4
  %i99 = load i8, ptr %i90, align 1, !tbaa !21
  %i100 = zext i8 %i99 to i64
  %i101 = sub nsw i64 0, %i100
  %i102 = getelementptr inbounds i8, ptr %i50, i64 %i101
  %i103 = load i8, ptr %i102, align 1, !tbaa !21
  %i104 = zext i8 %i103 to i32
  %i105 = add nuw nsw i32 %i97, %i104
  %i106 = load i8, ptr %i98, align 1, !tbaa !21
  %i107 = zext i8 %i106 to i64
  %i108 = sub nsw i64 0, %i107
  %i109 = getelementptr inbounds i8, ptr %i50, i64 %i108
  %i110 = load i8, ptr %i109, align 1, !tbaa !21
  %i111 = zext i8 %i110 to i32
  %i112 = add nuw nsw i32 %i105, %i111
  %i113 = getelementptr inbounds i8, ptr %i98, i64 %i18
  %i114 = getelementptr inbounds i8, ptr %i113, i64 1
  %i115 = load i8, ptr %i113, align 1, !tbaa !21
  %i116 = zext i8 %i115 to i64
  %i117 = sub nsw i64 0, %i116
  %i118 = getelementptr inbounds i8, ptr %i50, i64 %i117
  %i119 = load i8, ptr %i118, align 1, !tbaa !21
  %i120 = zext i8 %i119 to i32
  %i121 = add nuw nsw i32 %i112, %i120
  %i122 = getelementptr inbounds i8, ptr %i113, i64 2
  %i123 = load i8, ptr %i114, align 1, !tbaa !21
  %i124 = zext i8 %i123 to i64
  %i125 = sub nsw i64 0, %i124
  %i126 = getelementptr inbounds i8, ptr %i50, i64 %i125
  %i127 = load i8, ptr %i126, align 1, !tbaa !21
  %i128 = zext i8 %i127 to i32
  %i129 = add nuw nsw i32 %i121, %i128
  %i130 = getelementptr inbounds i8, ptr %i113, i64 3
  %i131 = load i8, ptr %i122, align 1, !tbaa !21
  %i132 = zext i8 %i131 to i64
  %i133 = sub nsw i64 0, %i132
  %i134 = getelementptr inbounds i8, ptr %i50, i64 %i133
  %i135 = load i8, ptr %i134, align 1, !tbaa !21
  %i136 = zext i8 %i135 to i32
  %i137 = add nuw nsw i32 %i129, %i136
  %i138 = getelementptr inbounds i8, ptr %i113, i64 4
  %i139 = load i8, ptr %i130, align 1, !tbaa !21
  %i140 = zext i8 %i139 to i64
  %i141 = sub nsw i64 0, %i140
  %i142 = getelementptr inbounds i8, ptr %i50, i64 %i141
  %i143 = load i8, ptr %i142, align 1, !tbaa !21
  %i144 = zext i8 %i143 to i32
  %i145 = add nuw nsw i32 %i137, %i144
  %i146 = getelementptr inbounds i8, ptr %i113, i64 5
  %i147 = load i8, ptr %i138, align 1, !tbaa !21
  %i148 = zext i8 %i147 to i64
  %i149 = sub nsw i64 0, %i148
  %i150 = getelementptr inbounds i8, ptr %i50, i64 %i149
  %i151 = load i8, ptr %i150, align 1, !tbaa !21
  %i152 = zext i8 %i151 to i32
  %i153 = add nuw nsw i32 %i145, %i152
  %i154 = getelementptr inbounds i8, ptr %i113, i64 6
  %i155 = load i8, ptr %i146, align 1, !tbaa !21
  %i156 = zext i8 %i155 to i64
  %i157 = sub nsw i64 0, %i156
  %i158 = getelementptr inbounds i8, ptr %i50, i64 %i157
  %i159 = load i8, ptr %i158, align 1, !tbaa !21
  %i160 = zext i8 %i159 to i32
  %i161 = add nuw nsw i32 %i153, %i160
  %i162 = load i8, ptr %i154, align 1, !tbaa !21
  %i163 = zext i8 %i162 to i64
  %i164 = sub nsw i64 0, %i163
  %i165 = getelementptr inbounds i8, ptr %i50, i64 %i164
  %i166 = load i8, ptr %i165, align 1, !tbaa !21
  %i167 = zext i8 %i166 to i32
  %i168 = add nuw nsw i32 %i161, %i167
  %i169 = getelementptr inbounds i8, ptr %i154, i64 %i20
  %i170 = getelementptr inbounds i8, ptr %i169, i64 1
  %i171 = load i8, ptr %i169, align 1, !tbaa !21
  %i172 = zext i8 %i171 to i64
  %i173 = sub nsw i64 0, %i172
  %i174 = getelementptr inbounds i8, ptr %i50, i64 %i173
  %i175 = load i8, ptr %i174, align 1, !tbaa !21
  %i176 = zext i8 %i175 to i32
  %i177 = add nuw nsw i32 %i168, %i176
  %i178 = getelementptr inbounds i8, ptr %i169, i64 2
  %i179 = load i8, ptr %i170, align 1, !tbaa !21
  %i180 = zext i8 %i179 to i64
  %i181 = sub nsw i64 0, %i180
  %i182 = getelementptr inbounds i8, ptr %i50, i64 %i181
  %i183 = load i8, ptr %i182, align 1, !tbaa !21
  %i184 = zext i8 %i183 to i32
  %i185 = add nuw nsw i32 %i177, %i184
  %i186 = load i8, ptr %i178, align 1, !tbaa !21
  %i187 = zext i8 %i186 to i64
  %i188 = sub nsw i64 0, %i187
  %i189 = getelementptr inbounds i8, ptr %i50, i64 %i188
  %i190 = load i8, ptr %i189, align 1, !tbaa !21
  %i191 = zext i8 %i190 to i32
  %i192 = add nuw nsw i32 %i185, %i191
  %i193 = icmp slt i32 %i192, %arg3
  br i1 %i193, label %bb194, label %bb42.bb584_crit_edge

bb42.bb584_crit_edge:                             ; preds = %bb42
  br label %bb584

bb194:                                            ; preds = %bb42
  %i195 = getelementptr inbounds i8, ptr %i169, i64 4
  %i196 = load i8, ptr %i195, align 1, !tbaa !21
  %i197 = zext i8 %i196 to i64
  %i198 = sub nsw i64 0, %i197
  %i199 = getelementptr inbounds i8, ptr %i50, i64 %i198
  %i200 = load i8, ptr %i199, align 1, !tbaa !21
  %i201 = zext i8 %i200 to i32
  %i202 = add nuw nsw i32 %i192, %i201
  %i203 = icmp ult i32 %i202, %arg3
  br i1 %i203, label %bb204, label %bb194.bb584_crit_edge

bb194.bb584_crit_edge:                            ; preds = %bb194
  br label %bb584

bb204:                                            ; preds = %bb194
  %i205 = getelementptr inbounds i8, ptr %i169, i64 5
  %i206 = getelementptr inbounds i8, ptr %i169, i64 6
  %i207 = load i8, ptr %i205, align 1, !tbaa !21
  %i208 = zext i8 %i207 to i64
  %i209 = sub nsw i64 0, %i208
  %i210 = getelementptr inbounds i8, ptr %i50, i64 %i209
  %i211 = load i8, ptr %i210, align 1, !tbaa !21
  %i212 = zext i8 %i211 to i32
  %i213 = add nuw nsw i32 %i202, %i212
  %i214 = icmp ult i32 %i213, %arg3
  br i1 %i214, label %bb215, label %bb204.bb584_crit_edge

bb204.bb584_crit_edge:                            ; preds = %bb204
  br label %bb584

bb215:                                            ; preds = %bb204
  %i216 = load i8, ptr %i206, align 1, !tbaa !21
  %i217 = zext i8 %i216 to i64
  %i218 = sub nsw i64 0, %i217
  %i219 = getelementptr inbounds i8, ptr %i50, i64 %i218
  %i220 = load i8, ptr %i219, align 1, !tbaa !21
  %i221 = zext i8 %i220 to i32
  %i222 = add nuw nsw i32 %i213, %i221
  %i223 = icmp ult i32 %i222, %arg3
  br i1 %i223, label %bb224, label %bb215.bb584_crit_edge

bb215.bb584_crit_edge:                            ; preds = %bb215
  br label %bb584

bb224:                                            ; preds = %bb215
  %i225 = getelementptr inbounds i8, ptr %i206, i64 %i20
  %i226 = load i8, ptr %i225, align 1, !tbaa !21
  %i227 = zext i8 %i226 to i64
  %i228 = sub nsw i64 0, %i227
  %i229 = getelementptr inbounds i8, ptr %i50, i64 %i228
  %i230 = load i8, ptr %i229, align 1, !tbaa !21
  %i231 = zext i8 %i230 to i32
  %i232 = add nuw nsw i32 %i222, %i231
  %i233 = icmp ult i32 %i232, %arg3
  br i1 %i233, label %bb234, label %bb224.bb584_crit_edge

bb224.bb584_crit_edge:                            ; preds = %bb224
  br label %bb584

bb234:                                            ; preds = %bb224
  %i235 = getelementptr inbounds i8, ptr %i225, i64 1
  %i236 = load i8, ptr %i235, align 1, !tbaa !21
  %i237 = zext i8 %i236 to i64
  %i238 = sub nsw i64 0, %i237
  %i239 = getelementptr inbounds i8, ptr %i50, i64 %i238
  %i240 = load i8, ptr %i239, align 1, !tbaa !21
  %i241 = zext i8 %i240 to i32
  %i242 = add nuw nsw i32 %i232, %i241
  %i243 = icmp ult i32 %i242, %arg3
  br i1 %i243, label %bb244, label %bb234.bb584_crit_edge

bb234.bb584_crit_edge:                            ; preds = %bb234
  br label %bb584

bb244:                                            ; preds = %bb234
  %i245 = getelementptr inbounds i8, ptr %i225, i64 2
  %i246 = load i8, ptr %i245, align 1, !tbaa !21
  %i247 = zext i8 %i246 to i64
  %i248 = sub nsw i64 0, %i247
  %i249 = getelementptr inbounds i8, ptr %i50, i64 %i248
  %i250 = load i8, ptr %i249, align 1, !tbaa !21
  %i251 = zext i8 %i250 to i32
  %i252 = add nuw nsw i32 %i242, %i251
  %i253 = icmp ult i32 %i252, %arg3
  br i1 %i253, label %bb254, label %bb244.bb584_crit_edge

bb244.bb584_crit_edge:                            ; preds = %bb244
  br label %bb584

bb254:                                            ; preds = %bb244
  %i255 = getelementptr inbounds i8, ptr %i225, i64 3
  %i256 = load i8, ptr %i255, align 1, !tbaa !21
  %i257 = zext i8 %i256 to i64
  %i258 = sub nsw i64 0, %i257
  %i259 = getelementptr inbounds i8, ptr %i50, i64 %i258
  %i260 = load i8, ptr %i259, align 1, !tbaa !21
  %i261 = zext i8 %i260 to i32
  %i262 = add nuw nsw i32 %i252, %i261
  %i263 = icmp ult i32 %i262, %arg3
  br i1 %i263, label %bb264, label %bb254.bb584_crit_edge

bb254.bb584_crit_edge:                            ; preds = %bb254
  br label %bb584

bb264:                                            ; preds = %bb254
  %i265 = getelementptr inbounds i8, ptr %i225, i64 4
  %i266 = load i8, ptr %i265, align 1, !tbaa !21
  %i267 = zext i8 %i266 to i64
  %i268 = sub nsw i64 0, %i267
  %i269 = getelementptr inbounds i8, ptr %i50, i64 %i268
  %i270 = load i8, ptr %i269, align 1, !tbaa !21
  %i271 = zext i8 %i270 to i32
  %i272 = add nuw nsw i32 %i262, %i271
  %i273 = icmp ult i32 %i272, %arg3
  br i1 %i273, label %bb274, label %bb264.bb584_crit_edge

bb264.bb584_crit_edge:                            ; preds = %bb264
  br label %bb584

bb274:                                            ; preds = %bb264
  %i275 = getelementptr inbounds i8, ptr %i225, i64 5
  %i276 = getelementptr inbounds i8, ptr %i225, i64 6
  %i277 = load i8, ptr %i275, align 1, !tbaa !21
  %i278 = zext i8 %i277 to i64
  %i279 = sub nsw i64 0, %i278
  %i280 = getelementptr inbounds i8, ptr %i50, i64 %i279
  %i281 = load i8, ptr %i280, align 1, !tbaa !21
  %i282 = zext i8 %i281 to i32
  %i283 = add nuw nsw i32 %i272, %i282
  %i284 = icmp ult i32 %i283, %arg3
  br i1 %i284, label %bb285, label %bb274.bb584_crit_edge

bb274.bb584_crit_edge:                            ; preds = %bb274
  br label %bb584

bb285:                                            ; preds = %bb274
  %i286 = load i8, ptr %i276, align 1, !tbaa !21
  %i287 = zext i8 %i286 to i64
  %i288 = sub nsw i64 0, %i287
  %i289 = getelementptr inbounds i8, ptr %i50, i64 %i288
  %i290 = load i8, ptr %i289, align 1, !tbaa !21
  %i291 = zext i8 %i290 to i32
  %i292 = add nuw nsw i32 %i283, %i291
  %i293 = icmp ult i32 %i292, %arg3
  br i1 %i293, label %bb294, label %bb285.bb584_crit_edge

bb285.bb584_crit_edge:                            ; preds = %bb285
  br label %bb584

bb294:                                            ; preds = %bb285
  %i295 = getelementptr inbounds i8, ptr %i276, i64 %i18
  %i296 = load i8, ptr %i295, align 1, !tbaa !21
  %i297 = zext i8 %i296 to i64
  %i298 = sub nsw i64 0, %i297
  %i299 = getelementptr inbounds i8, ptr %i50, i64 %i298
  %i300 = load i8, ptr %i299, align 1, !tbaa !21
  %i301 = zext i8 %i300 to i32
  %i302 = add nuw nsw i32 %i292, %i301
  %i303 = icmp ult i32 %i302, %arg3
  br i1 %i303, label %bb304, label %bb294.bb584_crit_edge

bb294.bb584_crit_edge:                            ; preds = %bb294
  br label %bb584

bb304:                                            ; preds = %bb294
  %i305 = getelementptr inbounds i8, ptr %i295, i64 1
  %i306 = load i8, ptr %i305, align 1, !tbaa !21
  %i307 = zext i8 %i306 to i64
  %i308 = sub nsw i64 0, %i307
  %i309 = getelementptr inbounds i8, ptr %i50, i64 %i308
  %i310 = load i8, ptr %i309, align 1, !tbaa !21
  %i311 = zext i8 %i310 to i32
  %i312 = add nuw nsw i32 %i302, %i311
  %i313 = icmp ult i32 %i312, %arg3
  br i1 %i313, label %bb314, label %bb304.bb584_crit_edge

bb304.bb584_crit_edge:                            ; preds = %bb304
  br label %bb584

bb314:                                            ; preds = %bb304
  %i315 = getelementptr inbounds i8, ptr %i295, i64 2
  %i316 = load i8, ptr %i315, align 1, !tbaa !21
  %i317 = zext i8 %i316 to i64
  %i318 = sub nsw i64 0, %i317
  %i319 = getelementptr inbounds i8, ptr %i50, i64 %i318
  %i320 = load i8, ptr %i319, align 1, !tbaa !21
  %i321 = zext i8 %i320 to i32
  %i322 = add nuw nsw i32 %i312, %i321
  %i323 = icmp ult i32 %i322, %arg3
  br i1 %i323, label %bb324, label %bb314.bb584_crit_edge

bb314.bb584_crit_edge:                            ; preds = %bb314
  br label %bb584

bb324:                                            ; preds = %bb314
  %i325 = getelementptr inbounds i8, ptr %i295, i64 3
  %i326 = getelementptr inbounds i8, ptr %i295, i64 4
  %i327 = load i8, ptr %i325, align 1, !tbaa !21
  %i328 = zext i8 %i327 to i64
  %i329 = sub nsw i64 0, %i328
  %i330 = getelementptr inbounds i8, ptr %i50, i64 %i329
  %i331 = load i8, ptr %i330, align 1, !tbaa !21
  %i332 = zext i8 %i331 to i32
  %i333 = add nuw nsw i32 %i322, %i332
  %i334 = icmp ult i32 %i333, %arg3
  br i1 %i334, label %bb335, label %bb324.bb584_crit_edge

bb324.bb584_crit_edge:                            ; preds = %bb324
  br label %bb584

bb335:                                            ; preds = %bb324
  %i336 = load i8, ptr %i326, align 1, !tbaa !21
  %i337 = zext i8 %i336 to i64
  %i338 = sub nsw i64 0, %i337
  %i339 = getelementptr inbounds i8, ptr %i50, i64 %i338
  %i340 = load i8, ptr %i339, align 1, !tbaa !21
  %i341 = zext i8 %i340 to i32
  %i342 = add nuw nsw i32 %i333, %i341
  %i343 = icmp ult i32 %i342, %arg3
  br i1 %i343, label %bb344, label %bb335.bb584_crit_edge

bb335.bb584_crit_edge:                            ; preds = %bb335
  br label %bb584

bb344:                                            ; preds = %bb335
  %i345 = getelementptr inbounds i8, ptr %i326, i64 %i17
  %i346 = load i8, ptr %i345, align 1, !tbaa !21
  %i347 = zext i8 %i346 to i64
  %i348 = sub nsw i64 0, %i347
  %i349 = getelementptr inbounds i8, ptr %i50, i64 %i348
  %i350 = load i8, ptr %i349, align 1, !tbaa !21
  %i351 = zext i8 %i350 to i32
  %i352 = add nuw nsw i32 %i342, %i351
  %i353 = icmp ult i32 %i352, %arg3
  br i1 %i353, label %bb354, label %bb344.bb584_crit_edge

bb344.bb584_crit_edge:                            ; preds = %bb344
  br label %bb584

bb354:                                            ; preds = %bb344
  %i355 = getelementptr inbounds i8, ptr %i345, i64 1
  %i356 = load i8, ptr %i355, align 1, !tbaa !21
  %i357 = zext i8 %i356 to i64
  %i358 = sub nsw i64 0, %i357
  %i359 = getelementptr inbounds i8, ptr %i50, i64 %i358
  %i360 = load i8, ptr %i359, align 1, !tbaa !21
  %i361 = zext i8 %i360 to i32
  %i362 = add nuw nsw i32 %i352, %i361
  %i363 = icmp ult i32 %i362, %arg3
  br i1 %i363, label %bb364, label %bb354.bb584_crit_edge

bb354.bb584_crit_edge:                            ; preds = %bb354
  br label %bb584

bb364:                                            ; preds = %bb354
  %i365 = getelementptr inbounds i8, ptr %i345, i64 2
  %i366 = load i8, ptr %i365, align 1, !tbaa !21
  %i367 = zext i8 %i366 to i64
  %i368 = sub nsw i64 0, %i367
  %i369 = getelementptr inbounds i8, ptr %i50, i64 %i368
  %i370 = load i8, ptr %i369, align 1, !tbaa !21
  %i371 = zext i8 %i370 to i32
  %i372 = add nuw nsw i32 %i362, %i371
  %i373 = icmp ult i32 %i372, %arg3
  br i1 %i373, label %bb374, label %bb364.bb584_crit_edge

bb364.bb584_crit_edge:                            ; preds = %bb364
  br label %bb584

bb374:                                            ; preds = %bb364
  %i375 = add nuw nsw i32 %i64, %i56
  %i376 = add nuw nsw i32 %i375, %i71
  %i377 = add nuw nsw i32 %i88, %i80
  %i378 = add nuw nsw i32 %i377, %i96
  %i379 = add nuw nsw i32 %i378, %i104
  %i380 = add nuw nsw i32 %i379, %i111
  %i381 = shl nuw nsw i32 %i301, 1
  %i382 = shl nuw nsw i32 %i341, 1
  %i383 = add nuw nsw i32 %i120, %i176
  %i384 = add nuw nsw i32 %i167, %i221
  %i385 = add nuw nsw i32 %i383, %i231
  %i386 = sub nsw i32 %i384, %i385
  %i387 = add nsw i32 %i386, %i291
  %i388 = mul nsw i32 %i387, 3
  %i389 = add nuw nsw i32 %i80, %i128
  %i390 = add nuw nsw i32 %i111, %i160
  %i391 = add nuw nsw i32 %i389, %i184
  %i392 = add nuw nsw i32 %i390, %i212
  %i393 = add nuw nsw i32 %i391, %i241
  %i394 = sub nsw i32 %i392, %i393
  %i395 = add nsw i32 %i394, %i282
  %i396 = shl nsw i32 %i395, 1
  %i397 = add nuw nsw i32 %i56, %i88
  %i398 = add nuw nsw i32 %i71, %i104
  %i399 = add nuw nsw i32 %i397, %i136
  %i400 = add nuw nsw i32 %i398, %i152
  %i401 = add nuw nsw i32 %i399, %i191
  %i402 = add nuw nsw i32 %i400, %i201
  %i403 = add nuw nsw i32 %i401, %i251
  %i404 = sub nsw i32 %i402, %i403
  %i405 = add nsw i32 %i404, %i271
  %i406 = add i32 %i405, %i396
  %i407 = add i32 %i406, %i388
  %i408 = add nuw nsw i32 %i381, %i311
  %i409 = sub i32 %i407, %i408
  %i410 = add i32 %i409, %i332
  %i411 = add i32 %i410, %i382
  %i412 = sub i32 %i411, %i351
  %i413 = add i32 %i412, %i371
  %i414 = sub nsw i32 %i351, %i376
  %i415 = add nsw i32 %i414, %i361
  %i416 = add nsw i32 %i415, %i371
  %i417 = mul nsw i32 %i416, 3
  %i418 = sub nsw i32 %i311, %i380
  %i419 = add nsw i32 %i418, %i321
  %i420 = add nsw i32 %i419, %i332
  %i421 = shl nsw i32 %i420, 1
  %i422 = add nuw nsw i32 %i128, %i120
  %i423 = add nuw nsw i32 %i422, %i136
  %i424 = add nuw nsw i32 %i423, %i144
  %i425 = add nuw nsw i32 %i424, %i152
  %i426 = add nuw nsw i32 %i425, %i160
  %i427 = add nuw nsw i32 %i426, %i167
  %i428 = sub nsw i32 %i231, %i427
  %i429 = add nsw i32 %i428, %i241
  %i430 = add nsw i32 %i429, %i251
  %i431 = add nsw i32 %i430, %i261
  %i432 = add nsw i32 %i431, %i271
  %i433 = add nsw i32 %i432, %i282
  %i434 = add nsw i32 %i433, %i291
  %i435 = add nsw i32 %i434, %i381
  %i436 = add i32 %i435, %i421
  %i437 = add i32 %i436, %i382
  %i438 = add i32 %i437, %i417
  %i439 = mul nsw i32 %i413, %i413
  %i440 = mul nsw i32 %i438, %i438
  %i441 = add nuw nsw i32 %i440, %i439
  %i442 = mul nuw nsw i32 %i372, %i372
  %i443 = lshr i32 %i442, 1
  %i444 = icmp ugt i32 %i441, %i443
  br i1 %i444, label %bb445, label %bb374.bb584_crit_edge

bb374.bb584_crit_edge:                            ; preds = %bb374
  br label %bb584

bb445:                                            ; preds = %bb374
  %i446 = icmp ult i32 %i440, %i439
  %i447 = trunc i64 %i43 to i32
  br i1 %i446, label %bb448, label %bb505

bb448:                                            ; preds = %bb445
  %i449 = sitofp i32 %i438 to float
  %i450 = tail call i32 @llvm.abs.i32(i32 %i413, i1 true)
  %i451 = sitofp i32 %i450 to float
  %i452 = fdiv float %i449, %i451
  %i453 = trunc i32 %i450 to i16
  %i454 = trunc i32 %i413 to i16
  %i455 = sdiv i16 %i453, %i454
  %i456 = sext i16 %i455 to i32
  %i457 = fcmp olt float %i452, 0.000000e+00
  %i458 = fpext float %i452 to double
  %i459 = select i1 %i457, double -5.000000e-01, double 5.000000e-01
  %i460 = fadd double %i459, %i458
  %i461 = fptosi double %i460 to i32
  %i462 = add nsw i32 %i34, %i461
  %i463 = mul nsw i32 %i462, %arg5
  %i464 = add nsw i32 %i463, %i447
  %i465 = add nsw i32 %i464, %i456
  %i466 = sext i32 %i465 to i64
  %i467 = getelementptr inbounds i8, ptr %arg, i64 %i466
  %i468 = load i8, ptr %i467, align 1, !tbaa !21
  %i469 = zext i8 %i468 to i64
  %i470 = sub nsw i64 0, %i469
  %i471 = getelementptr inbounds i8, ptr %i50, i64 %i470
  %i472 = load i8, ptr %i471, align 1, !tbaa !21
  %i473 = zext i8 %i472 to i32
  %i474 = fmul float %i452, 2.000000e+00
  %i475 = fcmp olt float %i474, 0.000000e+00
  %i476 = fpext float %i474 to double
  %i477 = select i1 %i475, double -5.000000e-01, double 5.000000e-01
  %i478 = fadd double %i477, %i476
  %i479 = fptosi double %i478 to i32
  %i480 = add nsw i32 %i34, %i479
  %i481 = mul nsw i32 %i480, %arg5
  %i482 = add nsw i32 %i481, %i447
  %i483 = shl nsw i32 %i456, 1
  %i484 = add nsw i32 %i482, %i483
  %i485 = sext i32 %i484 to i64
  %i486 = getelementptr inbounds i8, ptr %arg, i64 %i485
  %i487 = load i8, ptr %i486, align 1, !tbaa !21
  %i488 = zext i8 %i487 to i64
  %i489 = sub nsw i64 0, %i488
  %i490 = getelementptr inbounds i8, ptr %i50, i64 %i489
  %i491 = load i8, ptr %i490, align 1, !tbaa !21
  %i492 = zext i8 %i491 to i32
  %i493 = add nuw nsw i32 %i492, %i473
  %i494 = fmul float %i452, 3.000000e+00
  %i495 = fcmp olt float %i494, 0.000000e+00
  %i496 = fpext float %i494 to double
  %i497 = select i1 %i495, double -5.000000e-01, double 5.000000e-01
  %i498 = fadd double %i497, %i496
  %i499 = fptosi double %i498 to i32
  %i500 = add nsw i32 %i34, %i499
  %i501 = mul nsw i32 %i500, %arg5
  %i502 = add nsw i32 %i501, %i447
  %i503 = mul nsw i32 %i456, 3
  %i504 = add nsw i32 %i502, %i503
  br label %bb562

bb505:                                            ; preds = %bb445
  %i506 = sitofp i32 %i413 to float
  %i507 = tail call i32 @llvm.abs.i32(i32 %i438, i1 true)
  %i508 = sitofp i32 %i507 to float
  %i509 = fdiv float %i506, %i508
  %i510 = trunc i32 %i507 to i16
  %i511 = trunc i32 %i438 to i16
  %i512 = sdiv i16 %i510, %i511
  %i513 = sext i16 %i512 to i32
  %i514 = add nsw i32 %i33, %i513
  %i515 = mul nsw i32 %i514, %arg5
  %i516 = fcmp olt float %i509, 0.000000e+00
  %i517 = fpext float %i509 to double
  %i518 = select i1 %i516, double -5.000000e-01, double 5.000000e-01
  %i519 = fadd double %i518, %i517
  %i520 = fptosi double %i519 to i32
  %i521 = add i32 %i447, %i520
  %i522 = add i32 %i521, %i515
  %i523 = sext i32 %i522 to i64
  %i524 = getelementptr inbounds i8, ptr %arg, i64 %i523
  %i525 = load i8, ptr %i524, align 1, !tbaa !21
  %i526 = zext i8 %i525 to i64
  %i527 = sub nsw i64 0, %i526
  %i528 = getelementptr inbounds i8, ptr %i50, i64 %i527
  %i529 = load i8, ptr %i528, align 1, !tbaa !21
  %i530 = zext i8 %i529 to i32
  %i531 = shl nsw i32 %i513, 1
  %i532 = add nsw i32 %i531, %i33
  %i533 = mul nsw i32 %i532, %arg5
  %i534 = fmul float %i509, 2.000000e+00
  %i535 = fcmp olt float %i534, 0.000000e+00
  %i536 = fpext float %i534 to double
  %i537 = select i1 %i535, double -5.000000e-01, double 5.000000e-01
  %i538 = fadd double %i537, %i536
  %i539 = fptosi double %i538 to i32
  %i540 = add i32 %i447, %i539
  %i541 = add i32 %i540, %i533
  %i542 = sext i32 %i541 to i64
  %i543 = getelementptr inbounds i8, ptr %arg, i64 %i542
  %i544 = load i8, ptr %i543, align 1, !tbaa !21
  %i545 = zext i8 %i544 to i64
  %i546 = sub nsw i64 0, %i545
  %i547 = getelementptr inbounds i8, ptr %i50, i64 %i546
  %i548 = load i8, ptr %i547, align 1, !tbaa !21
  %i549 = zext i8 %i548 to i32
  %i550 = add nuw nsw i32 %i549, %i530
  %i551 = mul nsw i32 %i513, 3
  %i552 = add nsw i32 %i551, %i33
  %i553 = mul nsw i32 %i552, %arg5
  %i554 = fmul float %i509, 3.000000e+00
  %i555 = fcmp olt float %i554, 0.000000e+00
  %i556 = fpext float %i554 to double
  %i557 = select i1 %i555, double -5.000000e-01, double 5.000000e-01
  %i558 = fadd double %i557, %i556
  %i559 = fptosi double %i558 to i32
  %i560 = add i32 %i447, %i559
  %i561 = add i32 %i560, %i553
  br label %bb562

bb562:                                            ; preds = %bb505, %bb448
  %i563 = phi i32 [ %i561, %bb505 ], [ %i504, %bb448 ]
  %i564 = phi i32 [ %i550, %bb505 ], [ %i493, %bb448 ]
  %i565 = sext i32 %i563 to i64
  %i566 = getelementptr inbounds i8, ptr %arg, i64 %i565
  %i567 = load i8, ptr %i566, align 1, !tbaa !21
  %i568 = zext i8 %i567 to i64
  %i569 = sub nsw i64 0, %i568
  %i570 = getelementptr inbounds i8, ptr %i50, i64 %i569
  %i571 = load i8, ptr %i570, align 1, !tbaa !21
  %i572 = zext i8 %i571 to i32
  %i573 = add nuw nsw i32 %i564, %i572
  %i574 = icmp ugt i32 %i573, 290
  br i1 %i574, label %bb575, label %bb562.bb584_crit_edge

bb562.bb584_crit_edge:                            ; preds = %bb562
  br label %bb584

bb575:                                            ; preds = %bb562
  %i576 = sub nsw i32 %arg3, %i372
  %i577 = getelementptr inbounds i32, ptr %arg1, i64 %i46
  store i32 %i576, ptr %i577, align 4, !tbaa !16
  %i578 = mul nsw i32 %i413, 51
  %i579 = sdiv i32 %i578, %i372
  %i580 = getelementptr inbounds i32, ptr %i9, i64 %i46
  store i32 %i579, ptr %i580, align 4, !tbaa !16
  %i581 = mul nsw i32 %i438, 51
  %i582 = sdiv i32 %i581, %i372
  %i583 = getelementptr inbounds i32, ptr %i10, i64 %i46
  store i32 %i582, ptr %i583, align 4, !tbaa !16
  br label %bb584

bb584:                                            ; preds = %bb575, %bb562.bb584_crit_edge, %bb374.bb584_crit_edge, %bb364.bb584_crit_edge, %bb354.bb584_crit_edge, %bb344.bb584_crit_edge, %bb335.bb584_crit_edge, %bb324.bb584_crit_edge, %bb314.bb584_crit_edge, %bb304.bb584_crit_edge, %bb294.bb584_crit_edge, %bb285.bb584_crit_edge, %bb274.bb584_crit_edge, %bb264.bb584_crit_edge, %bb254.bb584_crit_edge, %bb244.bb584_crit_edge, %bb234.bb584_crit_edge, %bb224.bb584_crit_edge, %bb215.bb584_crit_edge, %bb204.bb584_crit_edge, %bb194.bb584_crit_edge, %bb42.bb584_crit_edge
  %i585 = add nuw nsw i64 %i43, 1
  %i586 = icmp eq i64 %i585, %i23
  br i1 %i586, label %bb587.loopexit, label %bb584.bb42_crit_edge, !llvm.loop !57

bb584.bb42_crit_edge:                             ; preds = %bb584
  br label %bb42

bb587.loopexit:                                   ; preds = %bb584
  br label %bb587

bb587:                                            ; preds = %bb587.loopexit, %bb24.bb587_crit_edge
  %i588 = add nuw nsw i64 %i25, 1
  %i589 = icmp eq i64 %i588, %i22
  br i1 %i589, label %bb35, label %bb587.bb24_crit_edge, !llvm.loop !58

bb587.bb24_crit_edge:                             ; preds = %bb587
  br label %bb24

bb590:                                            ; preds = %bb840.bb590_crit_edge, %bb36
  %i591 = phi i64 [ 5, %bb36 ], [ %i841, %bb840.bb590_crit_edge ]
  %i592 = phi i32 [ 0, %bb36 ], [ %i842, %bb840.bb590_crit_edge ]
  br i1 %i38, label %bb595, label %bb593

bb593:                                            ; preds = %bb590
  %i594 = add nuw nsw i64 %i591, 1
  br label %bb840

bb595:                                            ; preds = %bb590
  %i596 = mul nsw i64 %i591, %i39
  %i597 = add nsw i64 %i591, -3
  %i598 = mul nsw i64 %i597, %i39
  %i599 = add nsw i64 %i591, -2
  %i600 = mul nsw i64 %i599, %i39
  %i601 = add nsw i64 %i591, -1
  %i602 = mul nsw i64 %i601, %i39
  %i603 = add nuw nsw i64 %i591, 1
  %i604 = mul nsw i64 %i603, %i39
  %i605 = add nuw nsw i64 %i591, 2
  %i606 = mul nsw i64 %i605, %i39
  %i607 = add nuw nsw i64 %i591, 3
  %i608 = mul nsw i64 %i607, %i39
  %i609 = getelementptr i32, ptr %arg1, i64 %i598
  %i610 = getelementptr i32, ptr %arg1, i64 %i600
  %i611 = getelementptr i32, ptr %arg1, i64 %i602
  %i612 = getelementptr i32, ptr %arg1, i64 %i604
  %i613 = getelementptr i32, ptr %arg1, i64 %i606
  %i614 = getelementptr i32, ptr %arg1, i64 %i608
  %i615 = trunc i64 %i591 to i32
  br label %bb616

bb616:                                            ; preds = %bb836.bb616_crit_edge, %bb595
  %i617 = phi i64 [ 5, %bb595 ], [ %i838, %bb836.bb616_crit_edge ]
  %i618 = phi i32 [ %i592, %bb595 ], [ %i837, %bb836.bb616_crit_edge ]
  %i619 = add nuw nsw i64 %i617, %i596
  %i620 = getelementptr inbounds i32, ptr %arg1, i64 %i619
  %i621 = load i32, ptr %i620, align 4, !tbaa !16
  %i622 = icmp sgt i32 %i621, 0
  br i1 %i622, label %bb623, label %bb616.bb836_crit_edge

bb616.bb836_crit_edge:                            ; preds = %bb616
  br label %bb836

bb623:                                            ; preds = %bb616
  %i624 = getelementptr i32, ptr %i609, i64 %i617
  %i625 = getelementptr i32, ptr %i624, i64 -3
  %i626 = load i32, ptr %i625, align 4, !tbaa !16
  %i627 = icmp sgt i32 %i621, %i626
  br i1 %i627, label %bb628, label %bb623.bb836_crit_edge

bb623.bb836_crit_edge:                            ; preds = %bb623
  br label %bb836

bb628:                                            ; preds = %bb623
  %i629 = getelementptr i32, ptr %i624, i64 -2
  %i630 = load i32, ptr %i629, align 4, !tbaa !16
  %i631 = icmp sgt i32 %i621, %i630
  br i1 %i631, label %bb632, label %bb628.bb836_crit_edge

bb628.bb836_crit_edge:                            ; preds = %bb628
  br label %bb836

bb632:                                            ; preds = %bb628
  %i633 = getelementptr i32, ptr %i624, i64 -1
  %i634 = load i32, ptr %i633, align 4, !tbaa !16
  %i635 = icmp sgt i32 %i621, %i634
  br i1 %i635, label %bb636, label %bb632.bb836_crit_edge

bb632.bb836_crit_edge:                            ; preds = %bb632
  br label %bb836

bb636:                                            ; preds = %bb632
  %i637 = load i32, ptr %i624, align 4, !tbaa !16
  %i638 = icmp sgt i32 %i621, %i637
  br i1 %i638, label %bb639, label %bb636.bb836_crit_edge

bb636.bb836_crit_edge:                            ; preds = %bb636
  br label %bb836

bb639:                                            ; preds = %bb636
  %i640 = getelementptr i32, ptr %i624, i64 1
  %i641 = load i32, ptr %i640, align 4, !tbaa !16
  %i642 = icmp sgt i32 %i621, %i641
  br i1 %i642, label %bb643, label %bb639.bb836_crit_edge

bb639.bb836_crit_edge:                            ; preds = %bb639
  br label %bb836

bb643:                                            ; preds = %bb639
  %i644 = getelementptr i32, ptr %i624, i64 2
  %i645 = load i32, ptr %i644, align 4, !tbaa !16
  %i646 = icmp sgt i32 %i621, %i645
  br i1 %i646, label %bb647, label %bb643.bb836_crit_edge

bb643.bb836_crit_edge:                            ; preds = %bb643
  br label %bb836

bb647:                                            ; preds = %bb643
  %i648 = getelementptr i32, ptr %i624, i64 3
  %i649 = load i32, ptr %i648, align 4, !tbaa !16
  %i650 = icmp sgt i32 %i621, %i649
  br i1 %i650, label %bb651, label %bb647.bb836_crit_edge

bb647.bb836_crit_edge:                            ; preds = %bb647
  br label %bb836

bb651:                                            ; preds = %bb647
  %i652 = getelementptr i32, ptr %i610, i64 %i617
  %i653 = getelementptr i32, ptr %i652, i64 -3
  %i654 = load i32, ptr %i653, align 4, !tbaa !16
  %i655 = icmp sgt i32 %i621, %i654
  br i1 %i655, label %bb656, label %bb651.bb836_crit_edge

bb651.bb836_crit_edge:                            ; preds = %bb651
  br label %bb836

bb656:                                            ; preds = %bb651
  %i657 = getelementptr i32, ptr %i652, i64 -2
  %i658 = load i32, ptr %i657, align 4, !tbaa !16
  %i659 = icmp sgt i32 %i621, %i658
  br i1 %i659, label %bb660, label %bb656.bb836_crit_edge

bb656.bb836_crit_edge:                            ; preds = %bb656
  br label %bb836

bb660:                                            ; preds = %bb656
  %i661 = getelementptr i32, ptr %i652, i64 -1
  %i662 = load i32, ptr %i661, align 4, !tbaa !16
  %i663 = icmp sgt i32 %i621, %i662
  br i1 %i663, label %bb664, label %bb660.bb836_crit_edge

bb660.bb836_crit_edge:                            ; preds = %bb660
  br label %bb836

bb664:                                            ; preds = %bb660
  %i665 = load i32, ptr %i652, align 4, !tbaa !16
  %i666 = icmp sgt i32 %i621, %i665
  br i1 %i666, label %bb667, label %bb664.bb836_crit_edge

bb664.bb836_crit_edge:                            ; preds = %bb664
  br label %bb836

bb667:                                            ; preds = %bb664
  %i668 = getelementptr i32, ptr %i652, i64 1
  %i669 = load i32, ptr %i668, align 4, !tbaa !16
  %i670 = icmp sgt i32 %i621, %i669
  br i1 %i670, label %bb671, label %bb667.bb836_crit_edge

bb667.bb836_crit_edge:                            ; preds = %bb667
  br label %bb836

bb671:                                            ; preds = %bb667
  %i672 = getelementptr i32, ptr %i652, i64 2
  %i673 = load i32, ptr %i672, align 4, !tbaa !16
  %i674 = icmp sgt i32 %i621, %i673
  br i1 %i674, label %bb675, label %bb671.bb836_crit_edge

bb671.bb836_crit_edge:                            ; preds = %bb671
  br label %bb836

bb675:                                            ; preds = %bb671
  %i676 = getelementptr i32, ptr %i652, i64 3
  %i677 = load i32, ptr %i676, align 4, !tbaa !16
  %i678 = icmp sgt i32 %i621, %i677
  br i1 %i678, label %bb679, label %bb675.bb836_crit_edge

bb675.bb836_crit_edge:                            ; preds = %bb675
  br label %bb836

bb679:                                            ; preds = %bb675
  %i680 = getelementptr i32, ptr %i611, i64 %i617
  %i681 = getelementptr i32, ptr %i680, i64 -3
  %i682 = load i32, ptr %i681, align 4, !tbaa !16
  %i683 = icmp sgt i32 %i621, %i682
  br i1 %i683, label %bb684, label %bb679.bb836_crit_edge

bb679.bb836_crit_edge:                            ; preds = %bb679
  br label %bb836

bb684:                                            ; preds = %bb679
  %i685 = getelementptr i32, ptr %i680, i64 -2
  %i686 = load i32, ptr %i685, align 4, !tbaa !16
  %i687 = icmp sgt i32 %i621, %i686
  br i1 %i687, label %bb688, label %bb684.bb836_crit_edge

bb684.bb836_crit_edge:                            ; preds = %bb684
  br label %bb836

bb688:                                            ; preds = %bb684
  %i689 = getelementptr i32, ptr %i680, i64 -1
  %i690 = load i32, ptr %i689, align 4, !tbaa !16
  %i691 = icmp sgt i32 %i621, %i690
  br i1 %i691, label %bb692, label %bb688.bb836_crit_edge

bb688.bb836_crit_edge:                            ; preds = %bb688
  br label %bb836

bb692:                                            ; preds = %bb688
  %i693 = load i32, ptr %i680, align 4, !tbaa !16
  %i694 = icmp sgt i32 %i621, %i693
  br i1 %i694, label %bb695, label %bb692.bb836_crit_edge

bb692.bb836_crit_edge:                            ; preds = %bb692
  br label %bb836

bb695:                                            ; preds = %bb692
  %i696 = getelementptr i32, ptr %i680, i64 1
  %i697 = load i32, ptr %i696, align 4, !tbaa !16
  %i698 = icmp sgt i32 %i621, %i697
  br i1 %i698, label %bb699, label %bb695.bb836_crit_edge

bb695.bb836_crit_edge:                            ; preds = %bb695
  br label %bb836

bb699:                                            ; preds = %bb695
  %i700 = getelementptr i32, ptr %i680, i64 2
  %i701 = load i32, ptr %i700, align 4, !tbaa !16
  %i702 = icmp sgt i32 %i621, %i701
  br i1 %i702, label %bb703, label %bb699.bb836_crit_edge

bb699.bb836_crit_edge:                            ; preds = %bb699
  br label %bb836

bb703:                                            ; preds = %bb699
  %i704 = getelementptr i32, ptr %i680, i64 3
  %i705 = load i32, ptr %i704, align 4, !tbaa !16
  %i706 = icmp sgt i32 %i621, %i705
  br i1 %i706, label %bb707, label %bb703.bb836_crit_edge

bb703.bb836_crit_edge:                            ; preds = %bb703
  br label %bb836

bb707:                                            ; preds = %bb703
  %i708 = getelementptr i32, ptr %i620, i64 -3
  %i709 = load i32, ptr %i708, align 4, !tbaa !16
  %i710 = icmp sgt i32 %i621, %i709
  br i1 %i710, label %bb711, label %bb707.bb836_crit_edge

bb707.bb836_crit_edge:                            ; preds = %bb707
  br label %bb836

bb711:                                            ; preds = %bb707
  %i712 = getelementptr i32, ptr %i620, i64 -2
  %i713 = load i32, ptr %i712, align 4, !tbaa !16
  %i714 = icmp sgt i32 %i621, %i713
  br i1 %i714, label %bb715, label %bb711.bb836_crit_edge

bb711.bb836_crit_edge:                            ; preds = %bb711
  br label %bb836

bb715:                                            ; preds = %bb711
  %i716 = getelementptr i32, ptr %i620, i64 -1
  %i717 = load i32, ptr %i716, align 4, !tbaa !16
  %i718 = icmp sgt i32 %i621, %i717
  br i1 %i718, label %bb719, label %bb715.bb836_crit_edge

bb715.bb836_crit_edge:                            ; preds = %bb715
  br label %bb836

bb719:                                            ; preds = %bb715
  %i720 = getelementptr i32, ptr %i620, i64 1
  %i721 = load i32, ptr %i720, align 4, !tbaa !16
  %i722 = icmp slt i32 %i621, %i721
  br i1 %i722, label %bb719.bb836_crit_edge, label %bb723

bb719.bb836_crit_edge:                            ; preds = %bb719
  br label %bb836

bb723:                                            ; preds = %bb719
  %i724 = getelementptr i32, ptr %i620, i64 2
  %i725 = load i32, ptr %i724, align 4, !tbaa !16
  %i726 = icmp slt i32 %i621, %i725
  br i1 %i726, label %bb723.bb836_crit_edge, label %bb727

bb723.bb836_crit_edge:                            ; preds = %bb723
  br label %bb836

bb727:                                            ; preds = %bb723
  %i728 = getelementptr i32, ptr %i620, i64 3
  %i729 = load i32, ptr %i728, align 4, !tbaa !16
  %i730 = icmp slt i32 %i621, %i729
  br i1 %i730, label %bb727.bb836_crit_edge, label %bb731

bb727.bb836_crit_edge:                            ; preds = %bb727
  br label %bb836

bb731:                                            ; preds = %bb727
  %i732 = getelementptr i32, ptr %i612, i64 %i617
  %i733 = getelementptr i32, ptr %i732, i64 -3
  %i734 = load i32, ptr %i733, align 4, !tbaa !16
  %i735 = icmp slt i32 %i621, %i734
  br i1 %i735, label %bb731.bb836_crit_edge, label %bb736

bb731.bb836_crit_edge:                            ; preds = %bb731
  br label %bb836

bb736:                                            ; preds = %bb731
  %i737 = getelementptr i32, ptr %i732, i64 -2
  %i738 = load i32, ptr %i737, align 4, !tbaa !16
  %i739 = icmp slt i32 %i621, %i738
  br i1 %i739, label %bb736.bb836_crit_edge, label %bb740

bb736.bb836_crit_edge:                            ; preds = %bb736
  br label %bb836

bb740:                                            ; preds = %bb736
  %i741 = getelementptr i32, ptr %i732, i64 -1
  %i742 = load i32, ptr %i741, align 4, !tbaa !16
  %i743 = icmp slt i32 %i621, %i742
  br i1 %i743, label %bb740.bb836_crit_edge, label %bb744

bb740.bb836_crit_edge:                            ; preds = %bb740
  br label %bb836

bb744:                                            ; preds = %bb740
  %i745 = load i32, ptr %i732, align 4, !tbaa !16
  %i746 = icmp slt i32 %i621, %i745
  br i1 %i746, label %bb744.bb836_crit_edge, label %bb747

bb744.bb836_crit_edge:                            ; preds = %bb744
  br label %bb836

bb747:                                            ; preds = %bb744
  %i748 = getelementptr i32, ptr %i732, i64 1
  %i749 = load i32, ptr %i748, align 4, !tbaa !16
  %i750 = icmp slt i32 %i621, %i749
  br i1 %i750, label %bb747.bb836_crit_edge, label %bb751

bb747.bb836_crit_edge:                            ; preds = %bb747
  br label %bb836

bb751:                                            ; preds = %bb747
  %i752 = getelementptr i32, ptr %i732, i64 2
  %i753 = load i32, ptr %i752, align 4, !tbaa !16
  %i754 = icmp slt i32 %i621, %i753
  br i1 %i754, label %bb751.bb836_crit_edge, label %bb755

bb751.bb836_crit_edge:                            ; preds = %bb751
  br label %bb836

bb755:                                            ; preds = %bb751
  %i756 = getelementptr i32, ptr %i732, i64 3
  %i757 = load i32, ptr %i756, align 4, !tbaa !16
  %i758 = icmp slt i32 %i621, %i757
  br i1 %i758, label %bb755.bb836_crit_edge, label %bb759

bb755.bb836_crit_edge:                            ; preds = %bb755
  br label %bb836

bb759:                                            ; preds = %bb755
  %i760 = getelementptr i32, ptr %i613, i64 %i617
  %i761 = getelementptr i32, ptr %i760, i64 -3
  %i762 = load i32, ptr %i761, align 4, !tbaa !16
  %i763 = icmp slt i32 %i621, %i762
  br i1 %i763, label %bb759.bb836_crit_edge, label %bb764

bb759.bb836_crit_edge:                            ; preds = %bb759
  br label %bb836

bb764:                                            ; preds = %bb759
  %i765 = getelementptr i32, ptr %i760, i64 -2
  %i766 = load i32, ptr %i765, align 4, !tbaa !16
  %i767 = icmp slt i32 %i621, %i766
  br i1 %i767, label %bb764.bb836_crit_edge, label %bb768

bb764.bb836_crit_edge:                            ; preds = %bb764
  br label %bb836

bb768:                                            ; preds = %bb764
  %i769 = getelementptr i32, ptr %i760, i64 -1
  %i770 = load i32, ptr %i769, align 4, !tbaa !16
  %i771 = icmp slt i32 %i621, %i770
  br i1 %i771, label %bb768.bb836_crit_edge, label %bb772

bb768.bb836_crit_edge:                            ; preds = %bb768
  br label %bb836

bb772:                                            ; preds = %bb768
  %i773 = load i32, ptr %i760, align 4, !tbaa !16
  %i774 = icmp slt i32 %i621, %i773
  br i1 %i774, label %bb772.bb836_crit_edge, label %bb775

bb772.bb836_crit_edge:                            ; preds = %bb772
  br label %bb836

bb775:                                            ; preds = %bb772
  %i776 = getelementptr i32, ptr %i760, i64 1
  %i777 = load i32, ptr %i776, align 4, !tbaa !16
  %i778 = icmp slt i32 %i621, %i777
  br i1 %i778, label %bb775.bb836_crit_edge, label %bb779

bb775.bb836_crit_edge:                            ; preds = %bb775
  br label %bb836

bb779:                                            ; preds = %bb775
  %i780 = getelementptr i32, ptr %i760, i64 2
  %i781 = load i32, ptr %i780, align 4, !tbaa !16
  %i782 = icmp slt i32 %i621, %i781
  br i1 %i782, label %bb779.bb836_crit_edge, label %bb783

bb779.bb836_crit_edge:                            ; preds = %bb779
  br label %bb836

bb783:                                            ; preds = %bb779
  %i784 = getelementptr i32, ptr %i760, i64 3
  %i785 = load i32, ptr %i784, align 4, !tbaa !16
  %i786 = icmp slt i32 %i621, %i785
  br i1 %i786, label %bb783.bb836_crit_edge, label %bb787

bb783.bb836_crit_edge:                            ; preds = %bb783
  br label %bb836

bb787:                                            ; preds = %bb783
  %i788 = getelementptr i32, ptr %i614, i64 %i617
  %i789 = getelementptr i32, ptr %i788, i64 -3
  %i790 = load i32, ptr %i789, align 4, !tbaa !16
  %i791 = icmp slt i32 %i621, %i790
  br i1 %i791, label %bb787.bb836_crit_edge, label %bb792

bb787.bb836_crit_edge:                            ; preds = %bb787
  br label %bb836

bb792:                                            ; preds = %bb787
  %i793 = getelementptr i32, ptr %i788, i64 -2
  %i794 = load i32, ptr %i793, align 4, !tbaa !16
  %i795 = icmp slt i32 %i621, %i794
  br i1 %i795, label %bb792.bb836_crit_edge, label %bb796

bb792.bb836_crit_edge:                            ; preds = %bb792
  br label %bb836

bb796:                                            ; preds = %bb792
  %i797 = getelementptr i32, ptr %i788, i64 -1
  %i798 = load i32, ptr %i797, align 4, !tbaa !16
  %i799 = icmp slt i32 %i621, %i798
  br i1 %i799, label %bb796.bb836_crit_edge, label %bb800

bb796.bb836_crit_edge:                            ; preds = %bb796
  br label %bb836

bb800:                                            ; preds = %bb796
  %i801 = load i32, ptr %i788, align 4, !tbaa !16
  %i802 = icmp slt i32 %i621, %i801
  br i1 %i802, label %bb800.bb836_crit_edge, label %bb803

bb800.bb836_crit_edge:                            ; preds = %bb800
  br label %bb836

bb803:                                            ; preds = %bb800
  %i804 = getelementptr i32, ptr %i788, i64 1
  %i805 = load i32, ptr %i804, align 4, !tbaa !16
  %i806 = icmp slt i32 %i621, %i805
  br i1 %i806, label %bb803.bb836_crit_edge, label %bb807

bb803.bb836_crit_edge:                            ; preds = %bb803
  br label %bb836

bb807:                                            ; preds = %bb803
  %i808 = getelementptr i32, ptr %i788, i64 2
  %i809 = load i32, ptr %i808, align 4, !tbaa !16
  %i810 = icmp slt i32 %i621, %i809
  br i1 %i810, label %bb807.bb836_crit_edge, label %bb811

bb807.bb836_crit_edge:                            ; preds = %bb807
  br label %bb836

bb811:                                            ; preds = %bb807
  %i812 = getelementptr i32, ptr %i788, i64 3
  %i813 = load i32, ptr %i812, align 4, !tbaa !16
  %i814 = icmp slt i32 %i621, %i813
  br i1 %i814, label %bb811.bb836_crit_edge, label %bb815

bb811.bb836_crit_edge:                            ; preds = %bb811
  br label %bb836

bb815:                                            ; preds = %bb811
  %i816 = sext i32 %i618 to i64
  %i817 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i816
  %i818 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i816, i32 2
  store i32 0, ptr %i818, align 4, !tbaa !52
  %i819 = trunc i64 %i617 to i32
  store i32 %i819, ptr %i817, align 4, !tbaa !55
  %i820 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i816, i32 1
  store i32 %i615, ptr %i820, align 4, !tbaa !54
  %i821 = getelementptr inbounds i32, ptr %i9, i64 %i619
  %i822 = load i32, ptr %i821, align 4, !tbaa !16
  %i823 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i816, i32 3
  store i32 %i822, ptr %i823, align 4, !tbaa !59
  %i824 = getelementptr inbounds i32, ptr %i10, i64 %i619
  %i825 = load i32, ptr %i824, align 4, !tbaa !16
  %i826 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i816, i32 4
  store i32 %i825, ptr %i826, align 4, !tbaa !60
  %i827 = getelementptr inbounds i8, ptr %arg, i64 %i619
  %i828 = load i8, ptr %i827, align 1, !tbaa !21
  %i829 = zext i8 %i828 to i32
  %i830 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i816, i32 5
  store i32 %i829, ptr %i830, align 4, !tbaa !61
  %i831 = add nsw i32 %i618, 1
  %i832 = icmp eq i32 %i831, 15000
  br i1 %i832, label %bb833, label %bb815.bb836_crit_edge

bb815.bb836_crit_edge:                            ; preds = %bb815
  br label %bb836

bb833:                                            ; preds = %bb815
  %i834 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i835 = tail call i64 @fwrite(ptr nonnull @.str.29, i64 18, i64 1, ptr %i834) #22
  tail call void @exit(i32 noundef 1) #23
  unreachable

bb836:                                            ; preds = %bb815.bb836_crit_edge, %bb811.bb836_crit_edge, %bb807.bb836_crit_edge, %bb803.bb836_crit_edge, %bb800.bb836_crit_edge, %bb796.bb836_crit_edge, %bb792.bb836_crit_edge, %bb787.bb836_crit_edge, %bb783.bb836_crit_edge, %bb779.bb836_crit_edge, %bb775.bb836_crit_edge, %bb772.bb836_crit_edge, %bb768.bb836_crit_edge, %bb764.bb836_crit_edge, %bb759.bb836_crit_edge, %bb755.bb836_crit_edge, %bb751.bb836_crit_edge, %bb747.bb836_crit_edge, %bb744.bb836_crit_edge, %bb740.bb836_crit_edge, %bb736.bb836_crit_edge, %bb731.bb836_crit_edge, %bb727.bb836_crit_edge, %bb723.bb836_crit_edge, %bb719.bb836_crit_edge, %bb715.bb836_crit_edge, %bb711.bb836_crit_edge, %bb707.bb836_crit_edge, %bb703.bb836_crit_edge, %bb699.bb836_crit_edge, %bb695.bb836_crit_edge, %bb692.bb836_crit_edge, %bb688.bb836_crit_edge, %bb684.bb836_crit_edge, %bb679.bb836_crit_edge, %bb675.bb836_crit_edge, %bb671.bb836_crit_edge, %bb667.bb836_crit_edge, %bb664.bb836_crit_edge, %bb660.bb836_crit_edge, %bb656.bb836_crit_edge, %bb651.bb836_crit_edge, %bb647.bb836_crit_edge, %bb643.bb836_crit_edge, %bb639.bb836_crit_edge, %bb636.bb836_crit_edge, %bb632.bb836_crit_edge, %bb628.bb836_crit_edge, %bb623.bb836_crit_edge, %bb616.bb836_crit_edge
  %i837 = phi i32 [ %i831, %bb815.bb836_crit_edge ], [ %i618, %bb811.bb836_crit_edge ], [ %i618, %bb807.bb836_crit_edge ], [ %i618, %bb803.bb836_crit_edge ], [ %i618, %bb800.bb836_crit_edge ], [ %i618, %bb796.bb836_crit_edge ], [ %i618, %bb792.bb836_crit_edge ], [ %i618, %bb787.bb836_crit_edge ], [ %i618, %bb783.bb836_crit_edge ], [ %i618, %bb779.bb836_crit_edge ], [ %i618, %bb775.bb836_crit_edge ], [ %i618, %bb772.bb836_crit_edge ], [ %i618, %bb768.bb836_crit_edge ], [ %i618, %bb764.bb836_crit_edge ], [ %i618, %bb759.bb836_crit_edge ], [ %i618, %bb755.bb836_crit_edge ], [ %i618, %bb751.bb836_crit_edge ], [ %i618, %bb747.bb836_crit_edge ], [ %i618, %bb744.bb836_crit_edge ], [ %i618, %bb740.bb836_crit_edge ], [ %i618, %bb736.bb836_crit_edge ], [ %i618, %bb731.bb836_crit_edge ], [ %i618, %bb727.bb836_crit_edge ], [ %i618, %bb723.bb836_crit_edge ], [ %i618, %bb719.bb836_crit_edge ], [ %i618, %bb715.bb836_crit_edge ], [ %i618, %bb711.bb836_crit_edge ], [ %i618, %bb707.bb836_crit_edge ], [ %i618, %bb703.bb836_crit_edge ], [ %i618, %bb699.bb836_crit_edge ], [ %i618, %bb695.bb836_crit_edge ], [ %i618, %bb692.bb836_crit_edge ], [ %i618, %bb688.bb836_crit_edge ], [ %i618, %bb684.bb836_crit_edge ], [ %i618, %bb679.bb836_crit_edge ], [ %i618, %bb675.bb836_crit_edge ], [ %i618, %bb671.bb836_crit_edge ], [ %i618, %bb667.bb836_crit_edge ], [ %i618, %bb664.bb836_crit_edge ], [ %i618, %bb660.bb836_crit_edge ], [ %i618, %bb656.bb836_crit_edge ], [ %i618, %bb651.bb836_crit_edge ], [ %i618, %bb647.bb836_crit_edge ], [ %i618, %bb643.bb836_crit_edge ], [ %i618, %bb639.bb836_crit_edge ], [ %i618, %bb636.bb836_crit_edge ], [ %i618, %bb632.bb836_crit_edge ], [ %i618, %bb628.bb836_crit_edge ], [ %i618, %bb623.bb836_crit_edge ], [ %i618, %bb616.bb836_crit_edge ]
  %i838 = add nuw nsw i64 %i617, 1
  %i839 = icmp eq i64 %i838, %i41
  br i1 %i839, label %bb840.loopexit, label %bb836.bb616_crit_edge, !llvm.loop !62

bb836.bb616_crit_edge:                            ; preds = %bb836
  br label %bb616

bb840.loopexit:                                   ; preds = %bb836
  br label %bb840

bb840:                                            ; preds = %bb840.loopexit, %bb593
  %i841 = phi i64 [ %i594, %bb593 ], [ %i603, %bb840.loopexit ]
  %i842 = phi i32 [ %i592, %bb593 ], [ %i837, %bb840.loopexit ]
  %i843 = icmp eq i64 %i841, %i40
  br i1 %i843, label %bb844, label %bb840.bb590_crit_edge, !llvm.loop !63

bb840.bb590_crit_edge:                            ; preds = %bb840
  br label %bb590

bb844:                                            ; preds = %bb840
  %i845 = sext i32 %i842 to i64
  br label %bb846

bb846:                                            ; preds = %bb844, %bb35.bb846_crit_edge, %bb.bb846_crit_edge
  %i847 = phi i64 [ 0, %bb35.bb846_crit_edge ], [ %i845, %bb844 ], [ 0, %bb.bb846_crit_edge ]
  %i848 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i847, i32 2
  store i32 7, ptr %i848, align 4, !tbaa !52
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
  br i1 %i10, label %bb11, label %bb.bb844_crit_edge

bb.bb844_crit_edge:                               ; preds = %bb
  br label %bb844

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
  %i21 = zext nneg i32 %i9 to i64
  %i22 = zext nneg i32 %i12 to i64
  br label %bb23

bb23:                                             ; preds = %bb377.bb23_crit_edge, %bb11
  %i24 = phi i64 [ 7, %bb11 ], [ %i378, %bb377.bb23_crit_edge ]
  br i1 %i13, label %bb25, label %bb23.bb377_crit_edge

bb23.bb377_crit_edge:                             ; preds = %bb23
  br label %bb377

bb25:                                             ; preds = %bb23
  %i26 = add nsw i64 %i24, -3
  %i27 = mul nsw i64 %i26, %i20
  %i28 = getelementptr inbounds i8, ptr %arg, i64 %i27
  %i29 = trunc i64 %i24 to i32
  %i30 = mul i32 %i29, %arg5
  %i31 = zext i32 %i30 to i64
  br label %bb39

bb32:                                             ; preds = %bb377
  br i1 %i10, label %bb33, label %bb32.bb844_crit_edge

bb32.bb844_crit_edge:                             ; preds = %bb32
  br label %bb844

bb33:                                             ; preds = %bb32
  %i34 = add i32 %arg5, -7
  %i35 = icmp sgt i32 %arg5, 14
  %i36 = sext i32 %arg5 to i64
  %i37 = zext nneg i32 %i9 to i64
  %i38 = zext nneg i32 %i34 to i64
  br label %bb380

bb39:                                             ; preds = %bb374.bb39_crit_edge, %bb25
  %i40 = phi i64 [ 7, %bb25 ], [ %i375, %bb374.bb39_crit_edge ]
  %i41 = getelementptr inbounds i8, ptr %i28, i64 %i40
  %i42 = getelementptr inbounds i8, ptr %i41, i64 -1
  %i43 = add nuw nsw i64 %i40, %i31
  %i44 = getelementptr inbounds i8, ptr %arg, i64 %i43
  %i45 = load i8, ptr %i44, align 1, !tbaa !21
  %i46 = zext i8 %i45 to i64
  %i47 = getelementptr inbounds i8, ptr %arg2, i64 %i46
  %i48 = load i8, ptr %i42, align 1, !tbaa !21
  %i49 = zext i8 %i48 to i64
  %i50 = sub nsw i64 0, %i49
  %i51 = getelementptr inbounds i8, ptr %i47, i64 %i50
  %i52 = load i8, ptr %i51, align 1, !tbaa !21
  %i53 = zext i8 %i52 to i32
  %i54 = add nuw nsw i32 %i53, 100
  %i55 = getelementptr inbounds i8, ptr %i41, i64 1
  %i56 = load i8, ptr %i41, align 1, !tbaa !21
  %i57 = zext i8 %i56 to i64
  %i58 = sub nsw i64 0, %i57
  %i59 = getelementptr inbounds i8, ptr %i47, i64 %i58
  %i60 = load i8, ptr %i59, align 1, !tbaa !21
  %i61 = zext i8 %i60 to i32
  %i62 = add nuw nsw i32 %i54, %i61
  %i63 = load i8, ptr %i55, align 1, !tbaa !21
  %i64 = zext i8 %i63 to i64
  %i65 = sub nsw i64 0, %i64
  %i66 = getelementptr inbounds i8, ptr %i47, i64 %i65
  %i67 = load i8, ptr %i66, align 1, !tbaa !21
  %i68 = zext i8 %i67 to i32
  %i69 = add nuw nsw i32 %i62, %i68
  %i70 = getelementptr inbounds i8, ptr %i55, i64 %i15
  %i71 = getelementptr inbounds i8, ptr %i70, i64 1
  %i72 = load i8, ptr %i70, align 1, !tbaa !21
  %i73 = zext i8 %i72 to i64
  %i74 = sub nsw i64 0, %i73
  %i75 = getelementptr inbounds i8, ptr %i47, i64 %i74
  %i76 = load i8, ptr %i75, align 1, !tbaa !21
  %i77 = zext i8 %i76 to i32
  %i78 = add nuw nsw i32 %i69, %i77
  %i79 = getelementptr inbounds i8, ptr %i70, i64 2
  %i80 = load i8, ptr %i71, align 1, !tbaa !21
  %i81 = zext i8 %i80 to i64
  %i82 = sub nsw i64 0, %i81
  %i83 = getelementptr inbounds i8, ptr %i47, i64 %i82
  %i84 = load i8, ptr %i83, align 1, !tbaa !21
  %i85 = zext i8 %i84 to i32
  %i86 = add nuw nsw i32 %i78, %i85
  %i87 = getelementptr inbounds i8, ptr %i70, i64 3
  %i88 = load i8, ptr %i79, align 1, !tbaa !21
  %i89 = zext i8 %i88 to i64
  %i90 = sub nsw i64 0, %i89
  %i91 = getelementptr inbounds i8, ptr %i47, i64 %i90
  %i92 = load i8, ptr %i91, align 1, !tbaa !21
  %i93 = zext i8 %i92 to i32
  %i94 = add nuw nsw i32 %i86, %i93
  %i95 = getelementptr inbounds i8, ptr %i70, i64 4
  %i96 = load i8, ptr %i87, align 1, !tbaa !21
  %i97 = zext i8 %i96 to i64
  %i98 = sub nsw i64 0, %i97
  %i99 = getelementptr inbounds i8, ptr %i47, i64 %i98
  %i100 = load i8, ptr %i99, align 1, !tbaa !21
  %i101 = zext i8 %i100 to i32
  %i102 = add nuw nsw i32 %i94, %i101
  %i103 = load i8, ptr %i95, align 1, !tbaa !21
  %i104 = zext i8 %i103 to i64
  %i105 = sub nsw i64 0, %i104
  %i106 = getelementptr inbounds i8, ptr %i47, i64 %i105
  %i107 = load i8, ptr %i106, align 1, !tbaa !21
  %i108 = zext i8 %i107 to i32
  %i109 = add nuw nsw i32 %i102, %i108
  %i110 = getelementptr inbounds i8, ptr %i95, i64 %i17
  %i111 = getelementptr inbounds i8, ptr %i110, i64 1
  %i112 = load i8, ptr %i110, align 1, !tbaa !21
  %i113 = zext i8 %i112 to i64
  %i114 = sub nsw i64 0, %i113
  %i115 = getelementptr inbounds i8, ptr %i47, i64 %i114
  %i116 = load i8, ptr %i115, align 1, !tbaa !21
  %i117 = zext i8 %i116 to i32
  %i118 = add nuw nsw i32 %i109, %i117
  %i119 = getelementptr inbounds i8, ptr %i110, i64 2
  %i120 = load i8, ptr %i111, align 1, !tbaa !21
  %i121 = zext i8 %i120 to i64
  %i122 = sub nsw i64 0, %i121
  %i123 = getelementptr inbounds i8, ptr %i47, i64 %i122
  %i124 = load i8, ptr %i123, align 1, !tbaa !21
  %i125 = zext i8 %i124 to i32
  %i126 = add nuw nsw i32 %i118, %i125
  %i127 = getelementptr inbounds i8, ptr %i110, i64 3
  %i128 = load i8, ptr %i119, align 1, !tbaa !21
  %i129 = zext i8 %i128 to i64
  %i130 = sub nsw i64 0, %i129
  %i131 = getelementptr inbounds i8, ptr %i47, i64 %i130
  %i132 = load i8, ptr %i131, align 1, !tbaa !21
  %i133 = zext i8 %i132 to i32
  %i134 = add nuw nsw i32 %i126, %i133
  %i135 = getelementptr inbounds i8, ptr %i110, i64 4
  %i136 = load i8, ptr %i127, align 1, !tbaa !21
  %i137 = zext i8 %i136 to i64
  %i138 = sub nsw i64 0, %i137
  %i139 = getelementptr inbounds i8, ptr %i47, i64 %i138
  %i140 = load i8, ptr %i139, align 1, !tbaa !21
  %i141 = zext i8 %i140 to i32
  %i142 = add nuw nsw i32 %i134, %i141
  %i143 = getelementptr inbounds i8, ptr %i110, i64 5
  %i144 = load i8, ptr %i135, align 1, !tbaa !21
  %i145 = zext i8 %i144 to i64
  %i146 = sub nsw i64 0, %i145
  %i147 = getelementptr inbounds i8, ptr %i47, i64 %i146
  %i148 = load i8, ptr %i147, align 1, !tbaa !21
  %i149 = zext i8 %i148 to i32
  %i150 = add nuw nsw i32 %i142, %i149
  %i151 = getelementptr inbounds i8, ptr %i110, i64 6
  %i152 = load i8, ptr %i143, align 1, !tbaa !21
  %i153 = zext i8 %i152 to i64
  %i154 = sub nsw i64 0, %i153
  %i155 = getelementptr inbounds i8, ptr %i47, i64 %i154
  %i156 = load i8, ptr %i155, align 1, !tbaa !21
  %i157 = zext i8 %i156 to i32
  %i158 = add nuw nsw i32 %i150, %i157
  %i159 = load i8, ptr %i151, align 1, !tbaa !21
  %i160 = zext i8 %i159 to i64
  %i161 = sub nsw i64 0, %i160
  %i162 = getelementptr inbounds i8, ptr %i47, i64 %i161
  %i163 = load i8, ptr %i162, align 1, !tbaa !21
  %i164 = zext i8 %i163 to i32
  %i165 = add nuw nsw i32 %i158, %i164
  %i166 = getelementptr inbounds i8, ptr %i151, i64 %i19
  %i167 = getelementptr inbounds i8, ptr %i166, i64 1
  %i168 = load i8, ptr %i166, align 1, !tbaa !21
  %i169 = zext i8 %i168 to i64
  %i170 = sub nsw i64 0, %i169
  %i171 = getelementptr inbounds i8, ptr %i47, i64 %i170
  %i172 = load i8, ptr %i171, align 1, !tbaa !21
  %i173 = zext i8 %i172 to i32
  %i174 = add nuw nsw i32 %i165, %i173
  %i175 = getelementptr inbounds i8, ptr %i166, i64 2
  %i176 = load i8, ptr %i167, align 1, !tbaa !21
  %i177 = zext i8 %i176 to i64
  %i178 = sub nsw i64 0, %i177
  %i179 = getelementptr inbounds i8, ptr %i47, i64 %i178
  %i180 = load i8, ptr %i179, align 1, !tbaa !21
  %i181 = zext i8 %i180 to i32
  %i182 = add nuw nsw i32 %i174, %i181
  %i183 = load i8, ptr %i175, align 1, !tbaa !21
  %i184 = zext i8 %i183 to i64
  %i185 = sub nsw i64 0, %i184
  %i186 = getelementptr inbounds i8, ptr %i47, i64 %i185
  %i187 = load i8, ptr %i186, align 1, !tbaa !21
  %i188 = zext i8 %i187 to i32
  %i189 = add nuw nsw i32 %i182, %i188
  %i190 = icmp slt i32 %i189, %arg3
  br i1 %i190, label %bb191, label %bb39.bb374_crit_edge

bb39.bb374_crit_edge:                             ; preds = %bb39
  br label %bb374

bb191:                                            ; preds = %bb39
  %i192 = getelementptr inbounds i8, ptr %i166, i64 4
  %i193 = load i8, ptr %i192, align 1, !tbaa !21
  %i194 = zext i8 %i193 to i64
  %i195 = sub nsw i64 0, %i194
  %i196 = getelementptr inbounds i8, ptr %i47, i64 %i195
  %i197 = load i8, ptr %i196, align 1, !tbaa !21
  %i198 = zext i8 %i197 to i32
  %i199 = add nuw nsw i32 %i189, %i198
  %i200 = icmp ult i32 %i199, %arg3
  br i1 %i200, label %bb201, label %bb191.bb374_crit_edge

bb191.bb374_crit_edge:                            ; preds = %bb191
  br label %bb374

bb201:                                            ; preds = %bb191
  %i202 = getelementptr inbounds i8, ptr %i166, i64 5
  %i203 = getelementptr inbounds i8, ptr %i166, i64 6
  %i204 = load i8, ptr %i202, align 1, !tbaa !21
  %i205 = zext i8 %i204 to i64
  %i206 = sub nsw i64 0, %i205
  %i207 = getelementptr inbounds i8, ptr %i47, i64 %i206
  %i208 = load i8, ptr %i207, align 1, !tbaa !21
  %i209 = zext i8 %i208 to i32
  %i210 = add nuw nsw i32 %i199, %i209
  %i211 = icmp ult i32 %i210, %arg3
  br i1 %i211, label %bb212, label %bb201.bb374_crit_edge

bb201.bb374_crit_edge:                            ; preds = %bb201
  br label %bb374

bb212:                                            ; preds = %bb201
  %i213 = load i8, ptr %i203, align 1, !tbaa !21
  %i214 = zext i8 %i213 to i64
  %i215 = sub nsw i64 0, %i214
  %i216 = getelementptr inbounds i8, ptr %i47, i64 %i215
  %i217 = load i8, ptr %i216, align 1, !tbaa !21
  %i218 = zext i8 %i217 to i32
  %i219 = add nuw nsw i32 %i210, %i218
  %i220 = icmp ult i32 %i219, %arg3
  br i1 %i220, label %bb221, label %bb212.bb374_crit_edge

bb212.bb374_crit_edge:                            ; preds = %bb212
  br label %bb374

bb221:                                            ; preds = %bb212
  %i222 = getelementptr inbounds i8, ptr %i203, i64 %i19
  %i223 = load i8, ptr %i222, align 1, !tbaa !21
  %i224 = zext i8 %i223 to i64
  %i225 = sub nsw i64 0, %i224
  %i226 = getelementptr inbounds i8, ptr %i47, i64 %i225
  %i227 = load i8, ptr %i226, align 1, !tbaa !21
  %i228 = zext i8 %i227 to i32
  %i229 = add nuw nsw i32 %i219, %i228
  %i230 = icmp ult i32 %i229, %arg3
  br i1 %i230, label %bb231, label %bb221.bb374_crit_edge

bb221.bb374_crit_edge:                            ; preds = %bb221
  br label %bb374

bb231:                                            ; preds = %bb221
  %i232 = getelementptr inbounds i8, ptr %i222, i64 1
  %i233 = load i8, ptr %i232, align 1, !tbaa !21
  %i234 = zext i8 %i233 to i64
  %i235 = sub nsw i64 0, %i234
  %i236 = getelementptr inbounds i8, ptr %i47, i64 %i235
  %i237 = load i8, ptr %i236, align 1, !tbaa !21
  %i238 = zext i8 %i237 to i32
  %i239 = add nuw nsw i32 %i229, %i238
  %i240 = icmp ult i32 %i239, %arg3
  br i1 %i240, label %bb241, label %bb231.bb374_crit_edge

bb231.bb374_crit_edge:                            ; preds = %bb231
  br label %bb374

bb241:                                            ; preds = %bb231
  %i242 = getelementptr inbounds i8, ptr %i222, i64 2
  %i243 = load i8, ptr %i242, align 1, !tbaa !21
  %i244 = zext i8 %i243 to i64
  %i245 = sub nsw i64 0, %i244
  %i246 = getelementptr inbounds i8, ptr %i47, i64 %i245
  %i247 = load i8, ptr %i246, align 1, !tbaa !21
  %i248 = zext i8 %i247 to i32
  %i249 = add nuw nsw i32 %i239, %i248
  %i250 = icmp ult i32 %i249, %arg3
  br i1 %i250, label %bb251, label %bb241.bb374_crit_edge

bb241.bb374_crit_edge:                            ; preds = %bb241
  br label %bb374

bb251:                                            ; preds = %bb241
  %i252 = getelementptr inbounds i8, ptr %i222, i64 3
  %i253 = load i8, ptr %i252, align 1, !tbaa !21
  %i254 = zext i8 %i253 to i64
  %i255 = sub nsw i64 0, %i254
  %i256 = getelementptr inbounds i8, ptr %i47, i64 %i255
  %i257 = load i8, ptr %i256, align 1, !tbaa !21
  %i258 = zext i8 %i257 to i32
  %i259 = add nuw nsw i32 %i249, %i258
  %i260 = icmp ult i32 %i259, %arg3
  br i1 %i260, label %bb261, label %bb251.bb374_crit_edge

bb251.bb374_crit_edge:                            ; preds = %bb251
  br label %bb374

bb261:                                            ; preds = %bb251
  %i262 = getelementptr inbounds i8, ptr %i222, i64 4
  %i263 = load i8, ptr %i262, align 1, !tbaa !21
  %i264 = zext i8 %i263 to i64
  %i265 = sub nsw i64 0, %i264
  %i266 = getelementptr inbounds i8, ptr %i47, i64 %i265
  %i267 = load i8, ptr %i266, align 1, !tbaa !21
  %i268 = zext i8 %i267 to i32
  %i269 = add nuw nsw i32 %i259, %i268
  %i270 = icmp ult i32 %i269, %arg3
  br i1 %i270, label %bb271, label %bb261.bb374_crit_edge

bb261.bb374_crit_edge:                            ; preds = %bb261
  br label %bb374

bb271:                                            ; preds = %bb261
  %i272 = getelementptr inbounds i8, ptr %i222, i64 5
  %i273 = getelementptr inbounds i8, ptr %i222, i64 6
  %i274 = load i8, ptr %i272, align 1, !tbaa !21
  %i275 = zext i8 %i274 to i64
  %i276 = sub nsw i64 0, %i275
  %i277 = getelementptr inbounds i8, ptr %i47, i64 %i276
  %i278 = load i8, ptr %i277, align 1, !tbaa !21
  %i279 = zext i8 %i278 to i32
  %i280 = add nuw nsw i32 %i269, %i279
  %i281 = icmp ult i32 %i280, %arg3
  br i1 %i281, label %bb282, label %bb271.bb374_crit_edge

bb271.bb374_crit_edge:                            ; preds = %bb271
  br label %bb374

bb282:                                            ; preds = %bb271
  %i283 = load i8, ptr %i273, align 1, !tbaa !21
  %i284 = zext i8 %i283 to i64
  %i285 = sub nsw i64 0, %i284
  %i286 = getelementptr inbounds i8, ptr %i47, i64 %i285
  %i287 = load i8, ptr %i286, align 1, !tbaa !21
  %i288 = zext i8 %i287 to i32
  %i289 = add nuw nsw i32 %i280, %i288
  %i290 = icmp ult i32 %i289, %arg3
  br i1 %i290, label %bb291, label %bb282.bb374_crit_edge

bb282.bb374_crit_edge:                            ; preds = %bb282
  br label %bb374

bb291:                                            ; preds = %bb282
  %i292 = getelementptr inbounds i8, ptr %i273, i64 %i17
  %i293 = load i8, ptr %i292, align 1, !tbaa !21
  %i294 = zext i8 %i293 to i64
  %i295 = sub nsw i64 0, %i294
  %i296 = getelementptr inbounds i8, ptr %i47, i64 %i295
  %i297 = load i8, ptr %i296, align 1, !tbaa !21
  %i298 = zext i8 %i297 to i32
  %i299 = add nuw nsw i32 %i289, %i298
  %i300 = icmp ult i32 %i299, %arg3
  br i1 %i300, label %bb301, label %bb291.bb374_crit_edge

bb291.bb374_crit_edge:                            ; preds = %bb291
  br label %bb374

bb301:                                            ; preds = %bb291
  %i302 = getelementptr inbounds i8, ptr %i292, i64 1
  %i303 = load i8, ptr %i302, align 1, !tbaa !21
  %i304 = zext i8 %i303 to i64
  %i305 = sub nsw i64 0, %i304
  %i306 = getelementptr inbounds i8, ptr %i47, i64 %i305
  %i307 = load i8, ptr %i306, align 1, !tbaa !21
  %i308 = zext i8 %i307 to i32
  %i309 = add nuw nsw i32 %i299, %i308
  %i310 = icmp ult i32 %i309, %arg3
  br i1 %i310, label %bb311, label %bb301.bb374_crit_edge

bb301.bb374_crit_edge:                            ; preds = %bb301
  br label %bb374

bb311:                                            ; preds = %bb301
  %i312 = getelementptr inbounds i8, ptr %i292, i64 2
  %i313 = load i8, ptr %i312, align 1, !tbaa !21
  %i314 = zext i8 %i313 to i64
  %i315 = sub nsw i64 0, %i314
  %i316 = getelementptr inbounds i8, ptr %i47, i64 %i315
  %i317 = load i8, ptr %i316, align 1, !tbaa !21
  %i318 = zext i8 %i317 to i32
  %i319 = add nuw nsw i32 %i309, %i318
  %i320 = icmp ult i32 %i319, %arg3
  br i1 %i320, label %bb321, label %bb311.bb374_crit_edge

bb311.bb374_crit_edge:                            ; preds = %bb311
  br label %bb374

bb321:                                            ; preds = %bb311
  %i322 = getelementptr inbounds i8, ptr %i292, i64 3
  %i323 = getelementptr inbounds i8, ptr %i292, i64 4
  %i324 = load i8, ptr %i322, align 1, !tbaa !21
  %i325 = zext i8 %i324 to i64
  %i326 = sub nsw i64 0, %i325
  %i327 = getelementptr inbounds i8, ptr %i47, i64 %i326
  %i328 = load i8, ptr %i327, align 1, !tbaa !21
  %i329 = zext i8 %i328 to i32
  %i330 = add nuw nsw i32 %i319, %i329
  %i331 = icmp ult i32 %i330, %arg3
  br i1 %i331, label %bb332, label %bb321.bb374_crit_edge

bb321.bb374_crit_edge:                            ; preds = %bb321
  br label %bb374

bb332:                                            ; preds = %bb321
  %i333 = load i8, ptr %i323, align 1, !tbaa !21
  %i334 = zext i8 %i333 to i64
  %i335 = sub nsw i64 0, %i334
  %i336 = getelementptr inbounds i8, ptr %i47, i64 %i335
  %i337 = load i8, ptr %i336, align 1, !tbaa !21
  %i338 = zext i8 %i337 to i32
  %i339 = add nuw nsw i32 %i330, %i338
  %i340 = icmp ult i32 %i339, %arg3
  br i1 %i340, label %bb341, label %bb332.bb374_crit_edge

bb332.bb374_crit_edge:                            ; preds = %bb332
  br label %bb374

bb341:                                            ; preds = %bb332
  %i342 = getelementptr inbounds i8, ptr %i323, i64 %i15
  %i343 = load i8, ptr %i342, align 1, !tbaa !21
  %i344 = zext i8 %i343 to i64
  %i345 = sub nsw i64 0, %i344
  %i346 = getelementptr inbounds i8, ptr %i47, i64 %i345
  %i347 = load i8, ptr %i346, align 1, !tbaa !21
  %i348 = zext i8 %i347 to i32
  %i349 = add nuw nsw i32 %i339, %i348
  %i350 = icmp ult i32 %i349, %arg3
  br i1 %i350, label %bb351, label %bb341.bb374_crit_edge

bb341.bb374_crit_edge:                            ; preds = %bb341
  br label %bb374

bb351:                                            ; preds = %bb341
  %i352 = getelementptr inbounds i8, ptr %i342, i64 1
  %i353 = load i8, ptr %i352, align 1, !tbaa !21
  %i354 = zext i8 %i353 to i64
  %i355 = sub nsw i64 0, %i354
  %i356 = getelementptr inbounds i8, ptr %i47, i64 %i355
  %i357 = load i8, ptr %i356, align 1, !tbaa !21
  %i358 = zext i8 %i357 to i32
  %i359 = add nuw nsw i32 %i349, %i358
  %i360 = icmp ult i32 %i359, %arg3
  br i1 %i360, label %bb361, label %bb351.bb374_crit_edge

bb351.bb374_crit_edge:                            ; preds = %bb351
  br label %bb374

bb361:                                            ; preds = %bb351
  %i362 = getelementptr inbounds i8, ptr %i342, i64 2
  %i363 = load i8, ptr %i362, align 1, !tbaa !21
  %i364 = zext i8 %i363 to i64
  %i365 = sub nsw i64 0, %i364
  %i366 = getelementptr inbounds i8, ptr %i47, i64 %i365
  %i367 = load i8, ptr %i366, align 1, !tbaa !21
  %i368 = zext i8 %i367 to i32
  %i369 = add nuw nsw i32 %i359, %i368
  %i370 = icmp ult i32 %i369, %arg3
  br i1 %i370, label %bb371, label %bb361.bb374_crit_edge

bb361.bb374_crit_edge:                            ; preds = %bb361
  br label %bb374

bb371:                                            ; preds = %bb361
  %i372 = sub nsw i32 %arg3, %i369
  %i373 = getelementptr inbounds i32, ptr %arg1, i64 %i43
  store i32 %i372, ptr %i373, align 4, !tbaa !16
  br label %bb374

bb374:                                            ; preds = %bb371, %bb361.bb374_crit_edge, %bb351.bb374_crit_edge, %bb341.bb374_crit_edge, %bb332.bb374_crit_edge, %bb321.bb374_crit_edge, %bb311.bb374_crit_edge, %bb301.bb374_crit_edge, %bb291.bb374_crit_edge, %bb282.bb374_crit_edge, %bb271.bb374_crit_edge, %bb261.bb374_crit_edge, %bb251.bb374_crit_edge, %bb241.bb374_crit_edge, %bb231.bb374_crit_edge, %bb221.bb374_crit_edge, %bb212.bb374_crit_edge, %bb201.bb374_crit_edge, %bb191.bb374_crit_edge, %bb39.bb374_crit_edge
  %i375 = add nuw nsw i64 %i40, 1
  %i376 = icmp eq i64 %i375, %i22
  br i1 %i376, label %bb377.loopexit, label %bb374.bb39_crit_edge, !llvm.loop !64

bb374.bb39_crit_edge:                             ; preds = %bb374
  br label %bb39

bb377.loopexit:                                   ; preds = %bb374
  br label %bb377

bb377:                                            ; preds = %bb377.loopexit, %bb23.bb377_crit_edge
  %i378 = add nuw nsw i64 %i24, 1
  %i379 = icmp eq i64 %i378, %i21
  br i1 %i379, label %bb32, label %bb377.bb23_crit_edge, !llvm.loop !65

bb377.bb23_crit_edge:                             ; preds = %bb377
  br label %bb23

bb380:                                            ; preds = %bb838.bb380_crit_edge, %bb33
  %i381 = phi i64 [ 7, %bb33 ], [ %i839, %bb838.bb380_crit_edge ]
  %i382 = phi i32 [ 0, %bb33 ], [ %i840, %bb838.bb380_crit_edge ]
  br i1 %i35, label %bb385, label %bb383

bb383:                                            ; preds = %bb380
  %i384 = add nuw nsw i64 %i381, 1
  br label %bb838

bb385:                                            ; preds = %bb380
  %i386 = mul nsw i64 %i381, %i36
  %i387 = add nsw i64 %i381, -3
  %i388 = mul nsw i64 %i387, %i36
  %i389 = add nsw i64 %i381, -2
  %i390 = mul nsw i64 %i389, %i36
  %i391 = add nsw i64 %i381, -1
  %i392 = mul nsw i64 %i391, %i36
  %i393 = add nuw nsw i64 %i381, 1
  %i394 = mul nsw i64 %i393, %i36
  %i395 = add nuw nsw i64 %i381, 2
  %i396 = mul nsw i64 %i395, %i36
  %i397 = add nuw nsw i64 %i381, 3
  %i398 = mul nsw i64 %i397, %i36
  %i399 = getelementptr i32, ptr %arg1, i64 %i388
  %i400 = getelementptr i32, ptr %arg1, i64 %i398
  %i401 = trunc i64 %i381 to i32
  br label %bb402

bb402:                                            ; preds = %bb834.bb402_crit_edge, %bb385
  %i403 = phi i64 [ 7, %bb385 ], [ %i836, %bb834.bb402_crit_edge ]
  %i404 = phi i32 [ %i382, %bb385 ], [ %i835, %bb834.bb402_crit_edge ]
  %i405 = add nuw nsw i64 %i403, %i386
  %i406 = getelementptr inbounds i32, ptr %arg1, i64 %i405
  %i407 = load i32, ptr %i406, align 4, !tbaa !16
  %i408 = icmp sgt i32 %i407, 0
  br i1 %i408, label %bb409, label %bb402.bb834_crit_edge

bb402.bb834_crit_edge:                            ; preds = %bb402
  br label %bb834

bb409:                                            ; preds = %bb402
  %i410 = getelementptr i32, ptr %i399, i64 %i403
  %i411 = getelementptr i32, ptr %i410, i64 -3
  %i412 = load i32, ptr %i411, align 4, !tbaa !16
  %i413 = icmp sgt i32 %i407, %i412
  br i1 %i413, label %bb414, label %bb409.bb834_crit_edge

bb409.bb834_crit_edge:                            ; preds = %bb409
  br label %bb834

bb414:                                            ; preds = %bb409
  %i415 = getelementptr i32, ptr %i410, i64 -2
  %i416 = load i32, ptr %i415, align 4, !tbaa !16
  %i417 = icmp sgt i32 %i407, %i416
  br i1 %i417, label %bb418, label %bb414.bb834_crit_edge

bb414.bb834_crit_edge:                            ; preds = %bb414
  br label %bb834

bb418:                                            ; preds = %bb414
  %i419 = getelementptr i32, ptr %i410, i64 -1
  %i420 = load i32, ptr %i419, align 4, !tbaa !16
  %i421 = icmp sgt i32 %i407, %i420
  br i1 %i421, label %bb422, label %bb418.bb834_crit_edge

bb418.bb834_crit_edge:                            ; preds = %bb418
  br label %bb834

bb422:                                            ; preds = %bb418
  %i423 = load i32, ptr %i410, align 4, !tbaa !16
  %i424 = icmp sgt i32 %i407, %i423
  br i1 %i424, label %bb425, label %bb422.bb834_crit_edge

bb422.bb834_crit_edge:                            ; preds = %bb422
  br label %bb834

bb425:                                            ; preds = %bb422
  %i426 = getelementptr i32, ptr %i410, i64 1
  %i427 = load i32, ptr %i426, align 4, !tbaa !16
  %i428 = icmp sgt i32 %i407, %i427
  br i1 %i428, label %bb429, label %bb425.bb834_crit_edge

bb425.bb834_crit_edge:                            ; preds = %bb425
  br label %bb834

bb429:                                            ; preds = %bb425
  %i430 = getelementptr i32, ptr %i410, i64 2
  %i431 = load i32, ptr %i430, align 4, !tbaa !16
  %i432 = icmp sgt i32 %i407, %i431
  br i1 %i432, label %bb433, label %bb429.bb834_crit_edge

bb429.bb834_crit_edge:                            ; preds = %bb429
  br label %bb834

bb433:                                            ; preds = %bb429
  %i434 = getelementptr i32, ptr %i410, i64 3
  %i435 = load i32, ptr %i434, align 4, !tbaa !16
  %i436 = icmp sgt i32 %i407, %i435
  br i1 %i436, label %bb437, label %bb433.bb834_crit_edge

bb433.bb834_crit_edge:                            ; preds = %bb433
  br label %bb834

bb437:                                            ; preds = %bb433
  %i438 = add nsw i64 %i403, %i390
  %i439 = getelementptr i32, ptr %arg1, i64 %i438
  %i440 = getelementptr i32, ptr %i439, i64 -3
  %i441 = load i32, ptr %i440, align 4, !tbaa !16
  %i442 = icmp sgt i32 %i407, %i441
  br i1 %i442, label %bb443, label %bb437.bb834_crit_edge

bb437.bb834_crit_edge:                            ; preds = %bb437
  br label %bb834

bb443:                                            ; preds = %bb437
  %i444 = add nsw i64 %i438, -2
  %i445 = getelementptr inbounds i32, ptr %arg1, i64 %i444
  %i446 = load i32, ptr %i445, align 4, !tbaa !16
  %i447 = icmp sgt i32 %i407, %i446
  br i1 %i447, label %bb448, label %bb443.bb834_crit_edge

bb443.bb834_crit_edge:                            ; preds = %bb443
  br label %bb834

bb448:                                            ; preds = %bb443
  %i449 = add nsw i64 %i438, -1
  %i450 = getelementptr inbounds i32, ptr %arg1, i64 %i449
  %i451 = load i32, ptr %i450, align 4, !tbaa !16
  %i452 = icmp sgt i32 %i407, %i451
  br i1 %i452, label %bb453, label %bb448.bb834_crit_edge

bb448.bb834_crit_edge:                            ; preds = %bb448
  br label %bb834

bb453:                                            ; preds = %bb448
  %i454 = load i32, ptr %i439, align 4, !tbaa !16
  %i455 = icmp sgt i32 %i407, %i454
  br i1 %i455, label %bb456, label %bb453.bb834_crit_edge

bb453.bb834_crit_edge:                            ; preds = %bb453
  br label %bb834

bb456:                                            ; preds = %bb453
  %i457 = add nsw i64 %i438, 1
  %i458 = getelementptr inbounds i32, ptr %arg1, i64 %i457
  %i459 = load i32, ptr %i458, align 4, !tbaa !16
  %i460 = icmp sgt i32 %i407, %i459
  br i1 %i460, label %bb461, label %bb456.bb834_crit_edge

bb456.bb834_crit_edge:                            ; preds = %bb456
  br label %bb834

bb461:                                            ; preds = %bb456
  %i462 = add nsw i64 %i438, 2
  %i463 = getelementptr inbounds i32, ptr %arg1, i64 %i462
  %i464 = load i32, ptr %i463, align 4, !tbaa !16
  %i465 = icmp sgt i32 %i407, %i464
  br i1 %i465, label %bb466, label %bb461.bb834_crit_edge

bb461.bb834_crit_edge:                            ; preds = %bb461
  br label %bb834

bb466:                                            ; preds = %bb461
  %i467 = getelementptr i32, ptr %i439, i64 3
  %i468 = load i32, ptr %i467, align 4, !tbaa !16
  %i469 = icmp sgt i32 %i407, %i468
  br i1 %i469, label %bb470, label %bb466.bb834_crit_edge

bb466.bb834_crit_edge:                            ; preds = %bb466
  br label %bb834

bb470:                                            ; preds = %bb466
  %i471 = add nsw i64 %i403, %i392
  %i472 = getelementptr i32, ptr %arg1, i64 %i471
  %i473 = getelementptr i32, ptr %i472, i64 -3
  %i474 = load i32, ptr %i473, align 4, !tbaa !16
  %i475 = icmp sgt i32 %i407, %i474
  br i1 %i475, label %bb476, label %bb470.bb834_crit_edge

bb470.bb834_crit_edge:                            ; preds = %bb470
  br label %bb834

bb476:                                            ; preds = %bb470
  %i477 = add nsw i64 %i471, -2
  %i478 = getelementptr inbounds i32, ptr %arg1, i64 %i477
  %i479 = load i32, ptr %i478, align 4, !tbaa !16
  %i480 = icmp sgt i32 %i407, %i479
  br i1 %i480, label %bb481, label %bb476.bb834_crit_edge

bb476.bb834_crit_edge:                            ; preds = %bb476
  br label %bb834

bb481:                                            ; preds = %bb476
  %i482 = add nsw i64 %i471, -1
  %i483 = getelementptr inbounds i32, ptr %arg1, i64 %i482
  %i484 = load i32, ptr %i483, align 4, !tbaa !16
  %i485 = icmp sgt i32 %i407, %i484
  br i1 %i485, label %bb486, label %bb481.bb834_crit_edge

bb481.bb834_crit_edge:                            ; preds = %bb481
  br label %bb834

bb486:                                            ; preds = %bb481
  %i487 = load i32, ptr %i472, align 4, !tbaa !16
  %i488 = icmp sgt i32 %i407, %i487
  br i1 %i488, label %bb489, label %bb486.bb834_crit_edge

bb486.bb834_crit_edge:                            ; preds = %bb486
  br label %bb834

bb489:                                            ; preds = %bb486
  %i490 = add nsw i64 %i471, 1
  %i491 = getelementptr inbounds i32, ptr %arg1, i64 %i490
  %i492 = load i32, ptr %i491, align 4, !tbaa !16
  %i493 = icmp sgt i32 %i407, %i492
  br i1 %i493, label %bb494, label %bb489.bb834_crit_edge

bb489.bb834_crit_edge:                            ; preds = %bb489
  br label %bb834

bb494:                                            ; preds = %bb489
  %i495 = add nsw i64 %i471, 2
  %i496 = getelementptr inbounds i32, ptr %arg1, i64 %i495
  %i497 = load i32, ptr %i496, align 4, !tbaa !16
  %i498 = icmp sgt i32 %i407, %i497
  br i1 %i498, label %bb499, label %bb494.bb834_crit_edge

bb494.bb834_crit_edge:                            ; preds = %bb494
  br label %bb834

bb499:                                            ; preds = %bb494
  %i500 = getelementptr i32, ptr %i472, i64 3
  %i501 = load i32, ptr %i500, align 4, !tbaa !16
  %i502 = icmp sgt i32 %i407, %i501
  br i1 %i502, label %bb503, label %bb499.bb834_crit_edge

bb499.bb834_crit_edge:                            ; preds = %bb499
  br label %bb834

bb503:                                            ; preds = %bb499
  %i504 = getelementptr i32, ptr %i406, i64 -3
  %i505 = load i32, ptr %i504, align 4, !tbaa !16
  %i506 = icmp sgt i32 %i407, %i505
  br i1 %i506, label %bb507, label %bb503.bb834_crit_edge

bb503.bb834_crit_edge:                            ; preds = %bb503
  br label %bb834

bb507:                                            ; preds = %bb503
  %i508 = add nsw i64 %i405, -2
  %i509 = getelementptr inbounds i32, ptr %arg1, i64 %i508
  %i510 = load i32, ptr %i509, align 4, !tbaa !16
  %i511 = icmp sgt i32 %i407, %i510
  br i1 %i511, label %bb512, label %bb507.bb834_crit_edge

bb507.bb834_crit_edge:                            ; preds = %bb507
  br label %bb834

bb512:                                            ; preds = %bb507
  %i513 = add nsw i64 %i405, -1
  %i514 = getelementptr inbounds i32, ptr %arg1, i64 %i513
  %i515 = load i32, ptr %i514, align 4, !tbaa !16
  %i516 = icmp sgt i32 %i407, %i515
  br i1 %i516, label %bb517, label %bb512.bb834_crit_edge

bb512.bb834_crit_edge:                            ; preds = %bb512
  br label %bb834

bb517:                                            ; preds = %bb512
  %i518 = add nuw nsw i64 %i405, 1
  %i519 = getelementptr inbounds i32, ptr %arg1, i64 %i518
  %i520 = load i32, ptr %i519, align 4, !tbaa !16
  %i521 = icmp slt i32 %i407, %i520
  br i1 %i521, label %bb517.bb834_crit_edge, label %bb522

bb517.bb834_crit_edge:                            ; preds = %bb517
  br label %bb834

bb522:                                            ; preds = %bb517
  %i523 = add nuw nsw i64 %i405, 2
  %i524 = getelementptr inbounds i32, ptr %arg1, i64 %i523
  %i525 = load i32, ptr %i524, align 4, !tbaa !16
  %i526 = icmp slt i32 %i407, %i525
  br i1 %i526, label %bb522.bb834_crit_edge, label %bb527

bb522.bb834_crit_edge:                            ; preds = %bb522
  br label %bb834

bb527:                                            ; preds = %bb522
  %i528 = getelementptr i32, ptr %i406, i64 3
  %i529 = load i32, ptr %i528, align 4, !tbaa !16
  %i530 = icmp slt i32 %i407, %i529
  br i1 %i530, label %bb527.bb834_crit_edge, label %bb531

bb527.bb834_crit_edge:                            ; preds = %bb527
  br label %bb834

bb531:                                            ; preds = %bb527
  %i532 = add nuw nsw i64 %i403, %i394
  %i533 = getelementptr i32, ptr %arg1, i64 %i532
  %i534 = getelementptr i32, ptr %i533, i64 -3
  %i535 = load i32, ptr %i534, align 4, !tbaa !16
  %i536 = icmp slt i32 %i407, %i535
  br i1 %i536, label %bb531.bb834_crit_edge, label %bb537

bb531.bb834_crit_edge:                            ; preds = %bb531
  br label %bb834

bb537:                                            ; preds = %bb531
  %i538 = add nsw i64 %i532, -2
  %i539 = getelementptr inbounds i32, ptr %arg1, i64 %i538
  %i540 = load i32, ptr %i539, align 4, !tbaa !16
  %i541 = icmp slt i32 %i407, %i540
  br i1 %i541, label %bb537.bb834_crit_edge, label %bb542

bb537.bb834_crit_edge:                            ; preds = %bb537
  br label %bb834

bb542:                                            ; preds = %bb537
  %i543 = add nsw i64 %i532, -1
  %i544 = getelementptr inbounds i32, ptr %arg1, i64 %i543
  %i545 = load i32, ptr %i544, align 4, !tbaa !16
  %i546 = icmp slt i32 %i407, %i545
  br i1 %i546, label %bb542.bb834_crit_edge, label %bb547

bb542.bb834_crit_edge:                            ; preds = %bb542
  br label %bb834

bb547:                                            ; preds = %bb542
  %i548 = load i32, ptr %i533, align 4, !tbaa !16
  %i549 = icmp slt i32 %i407, %i548
  br i1 %i549, label %bb547.bb834_crit_edge, label %bb550

bb547.bb834_crit_edge:                            ; preds = %bb547
  br label %bb834

bb550:                                            ; preds = %bb547
  %i551 = add nuw nsw i64 %i532, 1
  %i552 = getelementptr inbounds i32, ptr %arg1, i64 %i551
  %i553 = load i32, ptr %i552, align 4, !tbaa !16
  %i554 = icmp slt i32 %i407, %i553
  br i1 %i554, label %bb550.bb834_crit_edge, label %bb555

bb550.bb834_crit_edge:                            ; preds = %bb550
  br label %bb834

bb555:                                            ; preds = %bb550
  %i556 = add nuw nsw i64 %i532, 2
  %i557 = getelementptr inbounds i32, ptr %arg1, i64 %i556
  %i558 = load i32, ptr %i557, align 4, !tbaa !16
  %i559 = icmp slt i32 %i407, %i558
  br i1 %i559, label %bb555.bb834_crit_edge, label %bb560

bb555.bb834_crit_edge:                            ; preds = %bb555
  br label %bb834

bb560:                                            ; preds = %bb555
  %i561 = getelementptr i32, ptr %i533, i64 3
  %i562 = load i32, ptr %i561, align 4, !tbaa !16
  %i563 = icmp slt i32 %i407, %i562
  br i1 %i563, label %bb560.bb834_crit_edge, label %bb564

bb560.bb834_crit_edge:                            ; preds = %bb560
  br label %bb834

bb564:                                            ; preds = %bb560
  %i565 = add nuw nsw i64 %i403, %i396
  %i566 = getelementptr i32, ptr %arg1, i64 %i565
  %i567 = getelementptr i32, ptr %i566, i64 -3
  %i568 = load i32, ptr %i567, align 4, !tbaa !16
  %i569 = icmp slt i32 %i407, %i568
  br i1 %i569, label %bb564.bb834_crit_edge, label %bb570

bb564.bb834_crit_edge:                            ; preds = %bb564
  br label %bb834

bb570:                                            ; preds = %bb564
  %i571 = add nsw i64 %i565, -2
  %i572 = getelementptr inbounds i32, ptr %arg1, i64 %i571
  %i573 = load i32, ptr %i572, align 4, !tbaa !16
  %i574 = icmp slt i32 %i407, %i573
  br i1 %i574, label %bb570.bb834_crit_edge, label %bb575

bb570.bb834_crit_edge:                            ; preds = %bb570
  br label %bb834

bb575:                                            ; preds = %bb570
  %i576 = add nsw i64 %i565, -1
  %i577 = getelementptr inbounds i32, ptr %arg1, i64 %i576
  %i578 = load i32, ptr %i577, align 4, !tbaa !16
  %i579 = icmp slt i32 %i407, %i578
  br i1 %i579, label %bb575.bb834_crit_edge, label %bb580

bb575.bb834_crit_edge:                            ; preds = %bb575
  br label %bb834

bb580:                                            ; preds = %bb575
  %i581 = load i32, ptr %i566, align 4, !tbaa !16
  %i582 = icmp slt i32 %i407, %i581
  br i1 %i582, label %bb580.bb834_crit_edge, label %bb583

bb580.bb834_crit_edge:                            ; preds = %bb580
  br label %bb834

bb583:                                            ; preds = %bb580
  %i584 = add nuw nsw i64 %i565, 1
  %i585 = getelementptr inbounds i32, ptr %arg1, i64 %i584
  %i586 = load i32, ptr %i585, align 4, !tbaa !16
  %i587 = icmp slt i32 %i407, %i586
  br i1 %i587, label %bb583.bb834_crit_edge, label %bb588

bb583.bb834_crit_edge:                            ; preds = %bb583
  br label %bb834

bb588:                                            ; preds = %bb583
  %i589 = add nuw nsw i64 %i565, 2
  %i590 = getelementptr inbounds i32, ptr %arg1, i64 %i589
  %i591 = load i32, ptr %i590, align 4, !tbaa !16
  %i592 = icmp slt i32 %i407, %i591
  br i1 %i592, label %bb588.bb834_crit_edge, label %bb593

bb588.bb834_crit_edge:                            ; preds = %bb588
  br label %bb834

bb593:                                            ; preds = %bb588
  %i594 = getelementptr i32, ptr %i566, i64 3
  %i595 = load i32, ptr %i594, align 4, !tbaa !16
  %i596 = icmp slt i32 %i407, %i595
  br i1 %i596, label %bb593.bb834_crit_edge, label %bb597

bb593.bb834_crit_edge:                            ; preds = %bb593
  br label %bb834

bb597:                                            ; preds = %bb593
  %i598 = getelementptr i32, ptr %i400, i64 %i403
  %i599 = getelementptr i32, ptr %i598, i64 -3
  %i600 = load i32, ptr %i599, align 4, !tbaa !16
  %i601 = icmp slt i32 %i407, %i600
  br i1 %i601, label %bb597.bb834_crit_edge, label %bb602

bb597.bb834_crit_edge:                            ; preds = %bb597
  br label %bb834

bb602:                                            ; preds = %bb597
  %i603 = getelementptr i32, ptr %i598, i64 -2
  %i604 = load i32, ptr %i603, align 4, !tbaa !16
  %i605 = icmp slt i32 %i407, %i604
  br i1 %i605, label %bb602.bb834_crit_edge, label %bb606

bb602.bb834_crit_edge:                            ; preds = %bb602
  br label %bb834

bb606:                                            ; preds = %bb602
  %i607 = getelementptr i32, ptr %i598, i64 -1
  %i608 = load i32, ptr %i607, align 4, !tbaa !16
  %i609 = icmp slt i32 %i407, %i608
  br i1 %i609, label %bb606.bb834_crit_edge, label %bb610

bb606.bb834_crit_edge:                            ; preds = %bb606
  br label %bb834

bb610:                                            ; preds = %bb606
  %i611 = load i32, ptr %i598, align 4, !tbaa !16
  %i612 = icmp slt i32 %i407, %i611
  br i1 %i612, label %bb610.bb834_crit_edge, label %bb613

bb610.bb834_crit_edge:                            ; preds = %bb610
  br label %bb834

bb613:                                            ; preds = %bb610
  %i614 = getelementptr i32, ptr %i598, i64 1
  %i615 = load i32, ptr %i614, align 4, !tbaa !16
  %i616 = icmp slt i32 %i407, %i615
  br i1 %i616, label %bb613.bb834_crit_edge, label %bb617

bb613.bb834_crit_edge:                            ; preds = %bb613
  br label %bb834

bb617:                                            ; preds = %bb613
  %i618 = getelementptr i32, ptr %i598, i64 2
  %i619 = load i32, ptr %i618, align 4, !tbaa !16
  %i620 = icmp slt i32 %i407, %i619
  br i1 %i620, label %bb617.bb834_crit_edge, label %bb621

bb617.bb834_crit_edge:                            ; preds = %bb617
  br label %bb834

bb621:                                            ; preds = %bb617
  %i622 = getelementptr i32, ptr %i598, i64 3
  %i623 = load i32, ptr %i622, align 4, !tbaa !16
  %i624 = icmp slt i32 %i407, %i623
  br i1 %i624, label %bb621.bb834_crit_edge, label %bb625

bb621.bb834_crit_edge:                            ; preds = %bb621
  br label %bb834

bb625:                                            ; preds = %bb621
  %i626 = sext i32 %i404 to i64
  %i627 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i626
  %i628 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i626, i32 2
  store i32 0, ptr %i628, align 4, !tbaa !52
  %i629 = trunc i64 %i403 to i32
  store i32 %i629, ptr %i627, align 4, !tbaa !55
  %i630 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i626, i32 1
  store i32 %i401, ptr %i630, align 4, !tbaa !54
  %i631 = getelementptr inbounds i8, ptr %arg, i64 %i444
  %i632 = load i8, ptr %i631, align 1, !tbaa !21
  %i633 = zext i8 %i632 to i16
  %i634 = getelementptr inbounds i8, ptr %arg, i64 %i449
  %i635 = load i8, ptr %i634, align 1, !tbaa !21
  %i636 = zext i8 %i635 to i16
  %i637 = add nuw nsw i16 %i636, %i633
  %i638 = getelementptr inbounds i8, ptr %arg, i64 %i438
  %i639 = load i8, ptr %i638, align 1, !tbaa !21
  %i640 = zext i8 %i639 to i16
  %i641 = add nuw nsw i16 %i637, %i640
  %i642 = getelementptr inbounds i8, ptr %arg, i64 %i457
  %i643 = load i8, ptr %i642, align 1, !tbaa !21
  %i644 = zext i8 %i643 to i16
  %i645 = add nuw nsw i16 %i641, %i644
  %i646 = getelementptr inbounds i8, ptr %arg, i64 %i462
  %i647 = load i8, ptr %i646, align 1, !tbaa !21
  %i648 = zext i8 %i647 to i16
  %i649 = add nuw nsw i16 %i645, %i648
  %i650 = getelementptr inbounds i8, ptr %arg, i64 %i477
  %i651 = load i8, ptr %i650, align 1, !tbaa !21
  %i652 = zext i8 %i651 to i16
  %i653 = add nuw nsw i16 %i649, %i652
  %i654 = getelementptr inbounds i8, ptr %arg, i64 %i482
  %i655 = load i8, ptr %i654, align 1, !tbaa !21
  %i656 = zext i8 %i655 to i16
  %i657 = add nuw nsw i16 %i653, %i656
  %i658 = getelementptr inbounds i8, ptr %arg, i64 %i471
  %i659 = load i8, ptr %i658, align 1, !tbaa !21
  %i660 = zext i8 %i659 to i16
  %i661 = add nuw nsw i16 %i657, %i660
  %i662 = getelementptr inbounds i8, ptr %arg, i64 %i490
  %i663 = load i8, ptr %i662, align 1, !tbaa !21
  %i664 = zext i8 %i663 to i16
  %i665 = add nuw nsw i16 %i661, %i664
  %i666 = getelementptr inbounds i8, ptr %arg, i64 %i495
  %i667 = load i8, ptr %i666, align 1, !tbaa !21
  %i668 = zext i8 %i667 to i16
  %i669 = add nuw nsw i16 %i665, %i668
  %i670 = getelementptr inbounds i8, ptr %arg, i64 %i508
  %i671 = load i8, ptr %i670, align 1, !tbaa !21
  %i672 = zext i8 %i671 to i16
  %i673 = add nuw nsw i16 %i669, %i672
  %i674 = getelementptr inbounds i8, ptr %arg, i64 %i513
  %i675 = load i8, ptr %i674, align 1, !tbaa !21
  %i676 = zext i8 %i675 to i16
  %i677 = add nuw nsw i16 %i673, %i676
  %i678 = getelementptr inbounds i8, ptr %arg, i64 %i405
  %i679 = load i8, ptr %i678, align 1, !tbaa !21
  %i680 = zext i8 %i679 to i16
  %i681 = add nuw nsw i16 %i677, %i680
  %i682 = getelementptr inbounds i8, ptr %arg, i64 %i518
  %i683 = load i8, ptr %i682, align 1, !tbaa !21
  %i684 = zext i8 %i683 to i16
  %i685 = add nuw nsw i16 %i681, %i684
  %i686 = getelementptr inbounds i8, ptr %arg, i64 %i523
  %i687 = load i8, ptr %i686, align 1, !tbaa !21
  %i688 = zext i8 %i687 to i16
  %i689 = add nuw nsw i16 %i685, %i688
  %i690 = getelementptr inbounds i8, ptr %arg, i64 %i538
  %i691 = load i8, ptr %i690, align 1, !tbaa !21
  %i692 = zext i8 %i691 to i16
  %i693 = add nuw nsw i16 %i689, %i692
  %i694 = getelementptr inbounds i8, ptr %arg, i64 %i543
  %i695 = load i8, ptr %i694, align 1, !tbaa !21
  %i696 = zext i8 %i695 to i16
  %i697 = add nuw nsw i16 %i693, %i696
  %i698 = getelementptr inbounds i8, ptr %arg, i64 %i532
  %i699 = load i8, ptr %i698, align 1, !tbaa !21
  %i700 = zext i8 %i699 to i16
  %i701 = add nuw nsw i16 %i697, %i700
  %i702 = getelementptr inbounds i8, ptr %arg, i64 %i551
  %i703 = load i8, ptr %i702, align 1, !tbaa !21
  %i704 = zext i8 %i703 to i16
  %i705 = add nuw nsw i16 %i701, %i704
  %i706 = getelementptr inbounds i8, ptr %arg, i64 %i556
  %i707 = load i8, ptr %i706, align 1, !tbaa !21
  %i708 = zext i8 %i707 to i16
  %i709 = add nuw nsw i16 %i705, %i708
  %i710 = getelementptr inbounds i8, ptr %arg, i64 %i571
  %i711 = load i8, ptr %i710, align 1, !tbaa !21
  %i712 = zext i8 %i711 to i16
  %i713 = add nuw nsw i16 %i709, %i712
  %i714 = getelementptr inbounds i8, ptr %arg, i64 %i576
  %i715 = load i8, ptr %i714, align 1, !tbaa !21
  %i716 = zext i8 %i715 to i16
  %i717 = add nuw nsw i16 %i713, %i716
  %i718 = getelementptr inbounds i8, ptr %arg, i64 %i565
  %i719 = load i8, ptr %i718, align 1, !tbaa !21
  %i720 = zext i8 %i719 to i16
  %i721 = add nuw nsw i16 %i717, %i720
  %i722 = getelementptr inbounds i8, ptr %arg, i64 %i584
  %i723 = load i8, ptr %i722, align 1, !tbaa !21
  %i724 = zext i8 %i723 to i16
  %i725 = add nuw nsw i16 %i721, %i724
  %i726 = getelementptr inbounds i8, ptr %arg, i64 %i589
  %i727 = load i8, ptr %i726, align 1, !tbaa !21
  %i728 = zext i8 %i727 to i16
  %i729 = add nuw nsw i16 %i725, %i728
  %i730 = udiv i16 %i729, 25
  %i731 = zext nneg i16 %i730 to i32
  %i732 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i626, i32 5
  store i32 %i731, ptr %i732, align 4, !tbaa !61
  %i733 = load i8, ptr %i646, align 1, !tbaa !21
  %i734 = zext i8 %i733 to i32
  %i735 = load i8, ptr %i666, align 1, !tbaa !21
  %i736 = zext i8 %i735 to i32
  %i737 = load i8, ptr %i686, align 1, !tbaa !21
  %i738 = zext i8 %i737 to i32
  %i739 = load i8, ptr %i706, align 1, !tbaa !21
  %i740 = zext i8 %i739 to i32
  %i741 = load i8, ptr %i726, align 1, !tbaa !21
  %i742 = zext i8 %i741 to i32
  %i743 = load i8, ptr %i631, align 1, !tbaa !21
  %i744 = zext i8 %i743 to i32
  %i745 = load i8, ptr %i650, align 1, !tbaa !21
  %i746 = zext i8 %i745 to i32
  %i747 = load i8, ptr %i670, align 1, !tbaa !21
  %i748 = zext i8 %i747 to i32
  %i749 = load i8, ptr %i690, align 1, !tbaa !21
  %i750 = zext i8 %i749 to i32
  %i751 = load i8, ptr %i710, align 1, !tbaa !21
  %i752 = zext i8 %i751 to i32
  %i753 = add nuw nsw i32 %i736, %i734
  %i754 = add nuw nsw i32 %i753, %i738
  %i755 = add nuw nsw i32 %i754, %i740
  %i756 = add nuw nsw i32 %i755, %i742
  %i757 = add nuw nsw i32 %i744, %i746
  %i758 = add nuw nsw i32 %i757, %i748
  %i759 = add nuw nsw i32 %i758, %i750
  %i760 = add nuw nsw i32 %i759, %i752
  %i761 = sub nsw i32 %i756, %i760
  %i762 = load i8, ptr %i642, align 1, !tbaa !21
  %i763 = zext i8 %i762 to i32
  %i764 = load i8, ptr %i662, align 1, !tbaa !21
  %i765 = zext i8 %i764 to i32
  %i766 = load i8, ptr %i682, align 1, !tbaa !21
  %i767 = zext i8 %i766 to i32
  %i768 = load i8, ptr %i702, align 1, !tbaa !21
  %i769 = zext i8 %i768 to i32
  %i770 = load i8, ptr %i722, align 1, !tbaa !21
  %i771 = zext i8 %i770 to i32
  %i772 = load i8, ptr %i634, align 1, !tbaa !21
  %i773 = zext i8 %i772 to i32
  %i774 = load i8, ptr %i654, align 1, !tbaa !21
  %i775 = zext i8 %i774 to i32
  %i776 = load i8, ptr %i674, align 1, !tbaa !21
  %i777 = zext i8 %i776 to i32
  %i778 = load i8, ptr %i694, align 1, !tbaa !21
  %i779 = zext i8 %i778 to i32
  %i780 = load i8, ptr %i714, align 1, !tbaa !21
  %i781 = zext i8 %i780 to i32
  %i782 = shl nsw i32 %i761, 1
  %i783 = add nuw nsw i32 %i765, %i763
  %i784 = add i32 %i783, %i782
  %i785 = add i32 %i784, %i767
  %i786 = add i32 %i785, %i769
  %i787 = add i32 %i786, %i771
  %i788 = add nuw nsw i32 %i773, %i775
  %i789 = add nuw nsw i32 %i788, %i777
  %i790 = add nuw nsw i32 %i789, %i779
  %i791 = add nuw nsw i32 %i790, %i781
  %i792 = sub i32 %i787, %i791
  %i793 = load i8, ptr %i718, align 1, !tbaa !21
  %i794 = zext i8 %i793 to i32
  %i795 = load i8, ptr %i638, align 1, !tbaa !21
  %i796 = zext i8 %i795 to i32
  %i797 = add nuw nsw i32 %i734, %i744
  %i798 = add nuw nsw i32 %i742, %i752
  %i799 = add nuw nsw i32 %i797, %i763
  %i800 = add nuw nsw i32 %i798, %i771
  %i801 = add nuw nsw i32 %i799, %i773
  %i802 = sub nsw i32 %i800, %i801
  %i803 = add nsw i32 %i802, %i781
  %i804 = add nsw i32 %i803, %i794
  %i805 = sub nsw i32 %i804, %i796
  %i806 = load i8, ptr %i698, align 1, !tbaa !21
  %i807 = zext i8 %i806 to i32
  %i808 = load i8, ptr %i658, align 1, !tbaa !21
  %i809 = zext i8 %i808 to i32
  %i810 = shl nsw i32 %i805, 1
  %i811 = add nuw nsw i32 %i736, %i746
  %i812 = add nuw nsw i32 %i740, %i750
  %i813 = add nuw nsw i32 %i811, %i765
  %i814 = add nuw nsw i32 %i812, %i769
  %i815 = add nuw nsw i32 %i813, %i775
  %i816 = sub nsw i32 %i814, %i815
  %i817 = add nsw i32 %i816, %i779
  %i818 = add nsw i32 %i817, %i807
  %i819 = sub nsw i32 %i818, %i809
  %i820 = add i32 %i819, %i810
  %i821 = trunc i32 %i792 to i16
  %i822 = sdiv i16 %i821, 15
  %i823 = sext i16 %i822 to i32
  %i824 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i626, i32 3
  store i32 %i823, ptr %i824, align 4, !tbaa !59
  %i825 = trunc i32 %i820 to i16
  %i826 = sdiv i16 %i825, 15
  %i827 = sext i16 %i826 to i32
  %i828 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i626, i32 4
  store i32 %i827, ptr %i828, align 4, !tbaa !60
  %i829 = add nsw i32 %i404, 1
  %i830 = icmp eq i32 %i829, 15000
  br i1 %i830, label %bb831, label %bb625.bb834_crit_edge

bb625.bb834_crit_edge:                            ; preds = %bb625
  br label %bb834

bb831:                                            ; preds = %bb625
  %i832 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i833 = tail call i64 @fwrite(ptr nonnull @.str.29, i64 18, i64 1, ptr %i832) #22
  tail call void @exit(i32 noundef 1) #23
  unreachable

bb834:                                            ; preds = %bb625.bb834_crit_edge, %bb621.bb834_crit_edge, %bb617.bb834_crit_edge, %bb613.bb834_crit_edge, %bb610.bb834_crit_edge, %bb606.bb834_crit_edge, %bb602.bb834_crit_edge, %bb597.bb834_crit_edge, %bb593.bb834_crit_edge, %bb588.bb834_crit_edge, %bb583.bb834_crit_edge, %bb580.bb834_crit_edge, %bb575.bb834_crit_edge, %bb570.bb834_crit_edge, %bb564.bb834_crit_edge, %bb560.bb834_crit_edge, %bb555.bb834_crit_edge, %bb550.bb834_crit_edge, %bb547.bb834_crit_edge, %bb542.bb834_crit_edge, %bb537.bb834_crit_edge, %bb531.bb834_crit_edge, %bb527.bb834_crit_edge, %bb522.bb834_crit_edge, %bb517.bb834_crit_edge, %bb512.bb834_crit_edge, %bb507.bb834_crit_edge, %bb503.bb834_crit_edge, %bb499.bb834_crit_edge, %bb494.bb834_crit_edge, %bb489.bb834_crit_edge, %bb486.bb834_crit_edge, %bb481.bb834_crit_edge, %bb476.bb834_crit_edge, %bb470.bb834_crit_edge, %bb466.bb834_crit_edge, %bb461.bb834_crit_edge, %bb456.bb834_crit_edge, %bb453.bb834_crit_edge, %bb448.bb834_crit_edge, %bb443.bb834_crit_edge, %bb437.bb834_crit_edge, %bb433.bb834_crit_edge, %bb429.bb834_crit_edge, %bb425.bb834_crit_edge, %bb422.bb834_crit_edge, %bb418.bb834_crit_edge, %bb414.bb834_crit_edge, %bb409.bb834_crit_edge, %bb402.bb834_crit_edge
  %i835 = phi i32 [ %i829, %bb625.bb834_crit_edge ], [ %i404, %bb621.bb834_crit_edge ], [ %i404, %bb617.bb834_crit_edge ], [ %i404, %bb613.bb834_crit_edge ], [ %i404, %bb610.bb834_crit_edge ], [ %i404, %bb606.bb834_crit_edge ], [ %i404, %bb602.bb834_crit_edge ], [ %i404, %bb597.bb834_crit_edge ], [ %i404, %bb593.bb834_crit_edge ], [ %i404, %bb588.bb834_crit_edge ], [ %i404, %bb583.bb834_crit_edge ], [ %i404, %bb580.bb834_crit_edge ], [ %i404, %bb575.bb834_crit_edge ], [ %i404, %bb570.bb834_crit_edge ], [ %i404, %bb564.bb834_crit_edge ], [ %i404, %bb560.bb834_crit_edge ], [ %i404, %bb555.bb834_crit_edge ], [ %i404, %bb550.bb834_crit_edge ], [ %i404, %bb547.bb834_crit_edge ], [ %i404, %bb542.bb834_crit_edge ], [ %i404, %bb537.bb834_crit_edge ], [ %i404, %bb531.bb834_crit_edge ], [ %i404, %bb527.bb834_crit_edge ], [ %i404, %bb522.bb834_crit_edge ], [ %i404, %bb517.bb834_crit_edge ], [ %i404, %bb512.bb834_crit_edge ], [ %i404, %bb507.bb834_crit_edge ], [ %i404, %bb503.bb834_crit_edge ], [ %i404, %bb499.bb834_crit_edge ], [ %i404, %bb494.bb834_crit_edge ], [ %i404, %bb489.bb834_crit_edge ], [ %i404, %bb486.bb834_crit_edge ], [ %i404, %bb481.bb834_crit_edge ], [ %i404, %bb476.bb834_crit_edge ], [ %i404, %bb470.bb834_crit_edge ], [ %i404, %bb466.bb834_crit_edge ], [ %i404, %bb461.bb834_crit_edge ], [ %i404, %bb456.bb834_crit_edge ], [ %i404, %bb453.bb834_crit_edge ], [ %i404, %bb448.bb834_crit_edge ], [ %i404, %bb443.bb834_crit_edge ], [ %i404, %bb437.bb834_crit_edge ], [ %i404, %bb433.bb834_crit_edge ], [ %i404, %bb429.bb834_crit_edge ], [ %i404, %bb425.bb834_crit_edge ], [ %i404, %bb422.bb834_crit_edge ], [ %i404, %bb418.bb834_crit_edge ], [ %i404, %bb414.bb834_crit_edge ], [ %i404, %bb409.bb834_crit_edge ], [ %i404, %bb402.bb834_crit_edge ]
  %i836 = add nuw nsw i64 %i403, 1
  %i837 = icmp eq i64 %i836, %i38
  br i1 %i837, label %bb838.loopexit, label %bb834.bb402_crit_edge, !llvm.loop !66

bb834.bb402_crit_edge:                            ; preds = %bb834
  br label %bb402

bb838.loopexit:                                   ; preds = %bb834
  br label %bb838

bb838:                                            ; preds = %bb838.loopexit, %bb383
  %i839 = phi i64 [ %i384, %bb383 ], [ %i393, %bb838.loopexit ]
  %i840 = phi i32 [ %i382, %bb383 ], [ %i835, %bb838.loopexit ]
  %i841 = icmp eq i64 %i839, %i37
  br i1 %i841, label %bb842, label %bb838.bb380_crit_edge, !llvm.loop !67

bb838.bb380_crit_edge:                            ; preds = %bb838
  br label %bb380

bb842:                                            ; preds = %bb838
  %i843 = sext i32 %i840 to i64
  br label %bb844

bb844:                                            ; preds = %bb842, %bb32.bb844_crit_edge, %bb.bb844_crit_edge
  %i845 = phi i64 [ 0, %bb32.bb844_crit_edge ], [ %i843, %bb842 ], [ 0, %bb.bb844_crit_edge ]
  %i846 = getelementptr inbounds %struct.anon, ptr %arg4, i64 %i845, i32 2
  store i32 7, ptr %i846, align 4, !tbaa !52
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
  switch i32 %i86, label %bb490 [
    i32 0, label %bb87
    i32 1, label %bb109
    i32 2, label %bb318
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
  br label %bb491

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
  store i8 %i131, ptr %i132, align 1, !tbaa !21
  %i133 = add nsw i64 %i120, 1
  %i134 = icmp eq i64 %i133, 257
  br i1 %i134, label %bb135, label %bb119.bb119_crit_edge, !llvm.loop !23

bb119.bb119_crit_edge:                            ; preds = %bb119
  br label %bb119

bb135:                                            ; preds = %bb119
  %i136 = icmp eq i32 %i76, 0
  br i1 %i136, label %bb226, label %bb137

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
  %i143 = icmp sgt i32 %i112, 0
  br i1 %i143, label %bb144, label %bb142.bb317_crit_edge

bb142.bb317_crit_edge:                            ; preds = %bb142
  br label %bb317

bb144:                                            ; preds = %bb142
  %i145 = load i32, ptr %i115, align 4, !tbaa !16
  %i146 = zext nneg i32 %i112 to i64
  %i147 = and i64 %i146, 3
  %i148 = icmp ult i32 %i112, 4
  br i1 %i148, label %bb144.bb178_crit_edge, label %bb149

bb144.bb178_crit_edge:                            ; preds = %bb144
  br label %bb178

bb149:                                            ; preds = %bb144
  %i150 = and i64 %i146, 2147483644
  br label %bb151

bb151:                                            ; preds = %bb151.bb151_crit_edge, %bb149
  %i152 = phi i64 [ 0, %bb149 ], [ %i175, %bb151.bb151_crit_edge ]
  %i153 = phi i32 [ %i145, %bb149 ], [ %i174, %bb151.bb151_crit_edge ]
  %i154 = phi i32 [ %i145, %bb149 ], [ %i173, %bb151.bb151_crit_edge ]
  %i155 = phi i64 [ 0, %bb149 ], [ %i176, %bb151.bb151_crit_edge ]
  %i156 = getelementptr inbounds i32, ptr %i115, i64 %i152
  %i157 = load i32, ptr %i156, align 4, !tbaa !16
  %i158 = tail call i32 @llvm.smax.i32(i32 %i157, i32 %i154)
  %i159 = tail call i32 @llvm.smin.i32(i32 %i157, i32 %i153)
  %i160 = or disjoint i64 %i152, 1
  %i161 = getelementptr inbounds i32, ptr %i115, i64 %i160
  %i162 = load i32, ptr %i161, align 4, !tbaa !16
  %i163 = tail call i32 @llvm.smax.i32(i32 %i162, i32 %i158)
  %i164 = tail call i32 @llvm.smin.i32(i32 %i162, i32 %i159)
  %i165 = or disjoint i64 %i152, 2
  %i166 = getelementptr inbounds i32, ptr %i115, i64 %i165
  %i167 = load i32, ptr %i166, align 4, !tbaa !16
  %i168 = tail call i32 @llvm.smax.i32(i32 %i167, i32 %i163)
  %i169 = tail call i32 @llvm.smin.i32(i32 %i167, i32 %i164)
  %i170 = or disjoint i64 %i152, 3
  %i171 = getelementptr inbounds i32, ptr %i115, i64 %i170
  %i172 = load i32, ptr %i171, align 4, !tbaa !16
  %i173 = tail call i32 @llvm.smax.i32(i32 %i172, i32 %i168)
  %i174 = tail call i32 @llvm.smin.i32(i32 %i172, i32 %i169)
  %i175 = add nuw nsw i64 %i152, 4
  %i176 = add i64 %i155, 4
  %i177 = icmp eq i64 %i176, %i150
  br i1 %i177, label %bb178.loopexit, label %bb151.bb151_crit_edge, !llvm.loop !18

bb151.bb151_crit_edge:                            ; preds = %bb151
  br label %bb151

bb178.loopexit:                                   ; preds = %bb151
  br label %bb178

bb178:                                            ; preds = %bb178.loopexit, %bb144.bb178_crit_edge
  %i179 = phi i32 [ undef, %bb144.bb178_crit_edge ], [ %i173, %bb178.loopexit ]
  %i180 = phi i32 [ undef, %bb144.bb178_crit_edge ], [ %i174, %bb178.loopexit ]
  %i181 = phi i64 [ 0, %bb144.bb178_crit_edge ], [ %i175, %bb178.loopexit ]
  %i182 = phi i32 [ %i145, %bb144.bb178_crit_edge ], [ %i174, %bb178.loopexit ]
  %i183 = phi i32 [ %i145, %bb144.bb178_crit_edge ], [ %i173, %bb178.loopexit ]
  %i184 = icmp eq i64 %i147, 0
  br i1 %i184, label %bb178.bb197_crit_edge, label %bb185.preheader

bb178.bb197_crit_edge:                            ; preds = %bb178
  br label %bb197

bb185.preheader:                                  ; preds = %bb178
  br label %bb185

bb185:                                            ; preds = %bb185.bb185_crit_edge, %bb185.preheader
  %i186 = phi i64 [ %i194, %bb185.bb185_crit_edge ], [ %i181, %bb185.preheader ]
  %i187 = phi i32 [ %i193, %bb185.bb185_crit_edge ], [ %i182, %bb185.preheader ]
  %i188 = phi i32 [ %i192, %bb185.bb185_crit_edge ], [ %i183, %bb185.preheader ]
  %i189 = phi i64 [ %i195, %bb185.bb185_crit_edge ], [ 0, %bb185.preheader ]
  %i190 = getelementptr inbounds i32, ptr %i115, i64 %i186
  %i191 = load i32, ptr %i190, align 4, !tbaa !16
  %i192 = tail call i32 @llvm.smax.i32(i32 %i191, i32 %i188)
  %i193 = tail call i32 @llvm.smin.i32(i32 %i191, i32 %i187)
  %i194 = add nuw nsw i64 %i186, 1
  %i195 = add i64 %i189, 1
  %i196 = icmp eq i64 %i195, %i147
  br i1 %i196, label %bb197.loopexit, label %bb185.bb185_crit_edge, !llvm.loop !69

bb185.bb185_crit_edge:                            ; preds = %bb185
  br label %bb185

bb197.loopexit:                                   ; preds = %bb185
  br label %bb197

bb197:                                            ; preds = %bb197.loopexit, %bb178.bb197_crit_edge
  %i198 = phi i32 [ %i179, %bb178.bb197_crit_edge ], [ %i192, %bb197.loopexit ]
  %i199 = phi i32 [ %i180, %bb178.bb197_crit_edge ], [ %i193, %bb197.loopexit ]
  %i200 = sub nsw i32 %i198, %i199
  %i201 = and i64 %i146, 1
  %i202 = icmp eq i32 %i112, 1
  br i1 %i202, label %bb197.bb306_crit_edge, label %bb203

bb197.bb306_crit_edge:                            ; preds = %bb197
  br label %bb306

bb203:                                            ; preds = %bb197
  %i204 = and i64 %i146, 2147483646
  br label %bb205

bb205:                                            ; preds = %bb205.bb205_crit_edge, %bb203
  %i206 = phi i64 [ 0, %bb203 ], [ %i223, %bb205.bb205_crit_edge ]
  %i207 = phi i64 [ 0, %bb203 ], [ %i224, %bb205.bb205_crit_edge ]
  %i208 = getelementptr inbounds i32, ptr %i115, i64 %i206
  %i209 = load i32, ptr %i208, align 4, !tbaa !16
  %i210 = sub nsw i32 %i209, %i199
  %i211 = mul nsw i32 %i210, 255
  %i212 = sdiv i32 %i211, %i200
  %i213 = trunc i32 %i212 to i8
  %i214 = getelementptr inbounds i8, ptr %i139, i64 %i206
  store i8 %i213, ptr %i214, align 1, !tbaa !21
  %i215 = or disjoint i64 %i206, 1
  %i216 = getelementptr inbounds i32, ptr %i115, i64 %i215
  %i217 = load i32, ptr %i216, align 4, !tbaa !16
  %i218 = sub nsw i32 %i217, %i199
  %i219 = mul nsw i32 %i218, 255
  %i220 = sdiv i32 %i219, %i200
  %i221 = trunc i32 %i220 to i8
  %i222 = getelementptr inbounds i8, ptr %i139, i64 %i215
  store i8 %i221, ptr %i222, align 1, !tbaa !21
  %i223 = add nuw nsw i64 %i206, 2
  %i224 = add i64 %i207, 2
  %i225 = icmp eq i64 %i224, %i204
  br i1 %i225, label %bb306.loopexit, label %bb205.bb205_crit_edge, !llvm.loop !22

bb205.bb205_crit_edge:                            ; preds = %bb205
  br label %bb205

bb226:                                            ; preds = %bb135
  %i227 = tail call noalias ptr @malloc(i64 noundef %i113) #24
  tail call void @llvm.memset.p0.i64(ptr align 1 %i227, i8 100, i64 %i113, i1 false)
  %i228 = icmp eq i32 %i78, 0
  %i229 = load ptr, ptr %i, align 8, !tbaa !8
  br i1 %i228, label %bb231, label %bb230

bb230:                                            ; preds = %bb226
  tail call void @susan_edges_small(ptr noundef %i229, ptr noundef %i115, ptr noundef %i227, ptr noundef nonnull %i117, i32 poison, i32 noundef %i110, i32 noundef %i111)
  br label %bb232

bb231:                                            ; preds = %bb226
  tail call void @susan_edges(ptr noundef %i229, ptr noundef %i115, ptr noundef %i227, ptr noundef nonnull %i117, i32 noundef 2650, i32 noundef %i110, i32 noundef %i111)
  br label %bb232

bb232:                                            ; preds = %bb231, %bb230
  %i233 = icmp eq i32 %i77, 0
  br i1 %i233, label %bb232.bb235_crit_edge, label %bb234

bb232.bb235_crit_edge:                            ; preds = %bb232
  br label %bb235

bb234:                                            ; preds = %bb232
  tail call void @susan_thin(ptr noundef %i115, ptr noundef %i227, i32 noundef %i110, i32 noundef %i111)
  br label %bb235

bb235:                                            ; preds = %bb234, %bb232.bb235_crit_edge
  %i236 = icmp eq i32 %i79, 0
  br i1 %i236, label %bb237, label %bb235.bb266_crit_edge

bb235.bb266_crit_edge:                            ; preds = %bb235
  br label %bb266

bb237:                                            ; preds = %bb235
  %i238 = icmp sgt i32 %i112, 0
  br i1 %i238, label %bb239, label %bb237.bb305_crit_edge

bb237.bb305_crit_edge:                            ; preds = %bb237
  br label %bb305

bb239:                                            ; preds = %bb237
  %i240 = ptrtoint ptr %i227 to i64
  %i241 = sext i32 %i110 to i64
  %i242 = sub nsw i64 0, %i241
  %i243 = getelementptr i8, ptr %i229, i64 %i242
  %i244 = add nsw i32 %i110, -2
  %i245 = sext i32 %i244 to i64
  br label %bb246

bb246:                                            ; preds = %bb262.bb246_crit_edge, %bb239
  %i247 = phi ptr [ %i227, %bb239 ], [ %i263, %bb262.bb246_crit_edge ]
  %i248 = phi i32 [ 0, %bb239 ], [ %i264, %bb262.bb246_crit_edge ]
  %i249 = load i8, ptr %i247, align 1, !tbaa !21
  %i250 = icmp ult i8 %i249, 8
  br i1 %i250, label %bb251, label %bb246.bb262_crit_edge

bb246.bb262_crit_edge:                            ; preds = %bb246
  br label %bb262

bb251:                                            ; preds = %bb246
  %i252 = ptrtoint ptr %i247 to i64
  %i253 = sub i64 %i252, %i240
  %i254 = getelementptr i8, ptr %i243, i64 %i253
  %i255 = getelementptr inbounds i8, ptr %i254, i64 -1
  store i8 -1, ptr %i255, align 1, !tbaa !21
  %i256 = getelementptr inbounds i8, ptr %i254, i64 1
  store i8 -1, ptr %i254, align 1, !tbaa !21
  store i8 -1, ptr %i256, align 1, !tbaa !21
  %i257 = getelementptr inbounds i8, ptr %i256, i64 %i245
  store i8 -1, ptr %i257, align 1, !tbaa !21
  %i258 = getelementptr inbounds i8, ptr %i257, i64 2
  store i8 -1, ptr %i258, align 1, !tbaa !21
  %i259 = getelementptr inbounds i8, ptr %i258, i64 %i245
  %i260 = getelementptr inbounds i8, ptr %i259, i64 1
  store i8 -1, ptr %i259, align 1, !tbaa !21
  %i261 = getelementptr inbounds i8, ptr %i259, i64 2
  store i8 -1, ptr %i260, align 1, !tbaa !21
  store i8 -1, ptr %i261, align 1, !tbaa !21
  br label %bb262

bb262:                                            ; preds = %bb251, %bb246.bb262_crit_edge
  %i263 = getelementptr inbounds i8, ptr %i247, i64 1
  %i264 = add nuw nsw i32 %i248, 1
  %i265 = icmp eq i32 %i264, %i112
  br i1 %i265, label %bb266.loopexit, label %bb262.bb246_crit_edge, !llvm.loop !40

bb262.bb246_crit_edge:                            ; preds = %bb262
  br label %bb246

bb266.loopexit:                                   ; preds = %bb262
  br label %bb266

bb266:                                            ; preds = %bb266.loopexit, %bb235.bb266_crit_edge
  %i267 = icmp sgt i32 %i112, 0
  br i1 %i267, label %bb268, label %bb266.bb305_crit_edge

bb266.bb305_crit_edge:                            ; preds = %bb266
  br label %bb305

bb268:                                            ; preds = %bb266
  %i269 = ptrtoint ptr %i227 to i64
  %i270 = and i32 %i112, 1
  %i271 = icmp eq i32 %i112, 1
  br i1 %i271, label %bb268.bb295_crit_edge, label %bb272

bb268.bb295_crit_edge:                            ; preds = %bb268
  br label %bb295

bb272:                                            ; preds = %bb268
  %i273 = and i32 %i112, 2147483646
  br label %bb274

bb274:                                            ; preds = %bb291.bb274_crit_edge, %bb272
  %i275 = phi ptr [ %i227, %bb272 ], [ %i292, %bb291.bb274_crit_edge ]
  %i276 = phi i32 [ 0, %bb272 ], [ %i293, %bb291.bb274_crit_edge ]
  %i277 = load i8, ptr %i275, align 1, !tbaa !21
  %i278 = icmp ult i8 %i277, 8
  br i1 %i278, label %bb279, label %bb274.bb283_crit_edge

bb274.bb283_crit_edge:                            ; preds = %bb274
  br label %bb283

bb279:                                            ; preds = %bb274
  %i280 = ptrtoint ptr %i275 to i64
  %i281 = sub i64 %i280, %i269
  %i282 = getelementptr inbounds i8, ptr %i229, i64 %i281
  store i8 0, ptr %i282, align 1, !tbaa !21
  br label %bb283

bb283:                                            ; preds = %bb279, %bb274.bb283_crit_edge
  %i284 = getelementptr inbounds i8, ptr %i275, i64 1
  %i285 = load i8, ptr %i284, align 1, !tbaa !21
  %i286 = icmp ult i8 %i285, 8
  br i1 %i286, label %bb287, label %bb283.bb291_crit_edge

bb283.bb291_crit_edge:                            ; preds = %bb283
  br label %bb291

bb287:                                            ; preds = %bb283
  %i288 = ptrtoint ptr %i284 to i64
  %i289 = sub i64 %i288, %i269
  %i290 = getelementptr inbounds i8, ptr %i229, i64 %i289
  store i8 0, ptr %i290, align 1, !tbaa !21
  br label %bb291

bb291:                                            ; preds = %bb287, %bb283.bb291_crit_edge
  %i292 = getelementptr inbounds i8, ptr %i275, i64 2
  %i293 = add i32 %i276, 2
  %i294 = icmp eq i32 %i293, %i273
  br i1 %i294, label %bb295.loopexit, label %bb291.bb274_crit_edge, !llvm.loop !41

bb291.bb274_crit_edge:                            ; preds = %bb291
  br label %bb274

bb295.loopexit:                                   ; preds = %bb291
  br label %bb295

bb295:                                            ; preds = %bb295.loopexit, %bb268.bb295_crit_edge
  %i296 = phi ptr [ %i227, %bb268.bb295_crit_edge ], [ %i292, %bb295.loopexit ]
  %i297 = icmp eq i32 %i270, 0
  br i1 %i297, label %bb295.bb305_crit_edge, label %bb298

bb295.bb305_crit_edge:                            ; preds = %bb295
  br label %bb305

bb298:                                            ; preds = %bb295
  %i299 = load i8, ptr %i296, align 1, !tbaa !21
  %i300 = icmp ult i8 %i299, 8
  br i1 %i300, label %bb301, label %bb298.bb305_crit_edge

bb298.bb305_crit_edge:                            ; preds = %bb298
  br label %bb305

bb301:                                            ; preds = %bb298
  %i302 = ptrtoint ptr %i296 to i64
  %i303 = sub i64 %i302, %i269
  %i304 = getelementptr inbounds i8, ptr %i229, i64 %i303
  store i8 0, ptr %i304, align 1, !tbaa !21
  br label %bb305

bb305:                                            ; preds = %bb301, %bb298.bb305_crit_edge, %bb295.bb305_crit_edge, %bb266.bb305_crit_edge, %bb237.bb305_crit_edge
  tail call void @free(ptr noundef %i227) #21
  br label %bb317

bb306.loopexit:                                   ; preds = %bb205
  br label %bb306

bb306:                                            ; preds = %bb306.loopexit, %bb197.bb306_crit_edge
  %i307 = phi i64 [ 0, %bb197.bb306_crit_edge ], [ %i223, %bb306.loopexit ]
  %i308 = icmp eq i64 %i201, 0
  br i1 %i308, label %bb306.bb317_crit_edge, label %bb309

bb306.bb317_crit_edge:                            ; preds = %bb306
  br label %bb317

bb309:                                            ; preds = %bb306
  %i310 = getelementptr inbounds i32, ptr %i115, i64 %i307
  %i311 = load i32, ptr %i310, align 4, !tbaa !16
  %i312 = sub nsw i32 %i311, %i199
  %i313 = mul nsw i32 %i312, 255
  %i314 = sdiv i32 %i313, %i200
  %i315 = trunc i32 %i314 to i8
  %i316 = getelementptr inbounds i8, ptr %i139, i64 %i307
  store i8 %i315, ptr %i316, align 1, !tbaa !21
  br label %bb317

bb317:                                            ; preds = %bb309, %bb306.bb317_crit_edge, %bb305, %bb142.bb317_crit_edge
  tail call void @free(ptr noundef nonnull %i116) #21
  tail call void @free(ptr noundef %i115) #21
  br label %bb491

bb318:                                            ; preds = %bb74
  %i319 = load i32, ptr %i2, align 4, !tbaa !16
  %i320 = load i32, ptr %i3, align 4, !tbaa !16
  %i321 = mul nsw i32 %i320, %i319
  %i322 = sext i32 %i321 to i64
  %i323 = shl nsw i64 %i322, 2
  %i324 = tail call noalias ptr @malloc(i64 noundef %i323) #24
  %i325 = tail call noalias dereferenceable_or_null(516) ptr @malloc(i64 noundef 516) #24
  %i326 = getelementptr inbounds i8, ptr %i325, i64 258
  %i327 = sitofp i32 %i75 to float
  br label %bb328

bb328:                                            ; preds = %bb328.bb328_crit_edge, %bb318
  %i329 = phi i64 [ -256, %bb318 ], [ %i342, %bb328.bb328_crit_edge ]
  %i330 = trunc i64 %i329 to i32
  %i331 = sitofp i32 %i330 to float
  %i332 = fdiv float %i331, %i327
  %i333 = fpext float %i332 to double
  %i334 = fmul double %i333, %i333
  %i335 = fmul double %i334, %i334
  %i336 = fneg double %i334
  %i337 = fmul double %i335, %i336
  %i338 = tail call double @exp(double noundef %i337) #21
  %i339 = fmul double %i338, 1.000000e+02
  %i340 = fptoui double %i339 to i8
  %i341 = getelementptr inbounds i8, ptr %i326, i64 %i329
  store i8 %i340, ptr %i341, align 1, !tbaa !21
  %i342 = add nsw i64 %i329, 1
  %i343 = icmp eq i64 %i342, 257
  br i1 %i343, label %bb344, label %bb328.bb328_crit_edge, !llvm.loop !23

bb328.bb328_crit_edge:                            ; preds = %bb328
  br label %bb328

bb344:                                            ; preds = %bb328
  %i345 = icmp eq i32 %i76, 0
  br i1 %i345, label %bb431, label %bb346

bb346:                                            ; preds = %bb344
  %i347 = load ptr, ptr %i, align 8, !tbaa !8
  tail call void @susan_principle(ptr noundef %i347, ptr noundef %i324, ptr noundef nonnull %i326, i32 noundef 1850, i32 noundef %i319, i32 noundef %i320)
  %i348 = icmp sgt i32 %i321, 0
  br i1 %i348, label %bb349, label %bb346.bb489_crit_edge

bb346.bb489_crit_edge:                            ; preds = %bb346
  br label %bb489

bb349:                                            ; preds = %bb346
  %i350 = load i32, ptr %i324, align 4, !tbaa !16
  %i351 = zext nneg i32 %i321 to i64
  %i352 = and i64 %i351, 3
  %i353 = icmp ult i32 %i321, 4
  br i1 %i353, label %bb349.bb383_crit_edge, label %bb354

bb349.bb383_crit_edge:                            ; preds = %bb349
  br label %bb383

bb354:                                            ; preds = %bb349
  %i355 = and i64 %i351, 2147483644
  br label %bb356

bb356:                                            ; preds = %bb356.bb356_crit_edge, %bb354
  %i357 = phi i64 [ 0, %bb354 ], [ %i380, %bb356.bb356_crit_edge ]
  %i358 = phi i32 [ %i350, %bb354 ], [ %i379, %bb356.bb356_crit_edge ]
  %i359 = phi i32 [ %i350, %bb354 ], [ %i378, %bb356.bb356_crit_edge ]
  %i360 = phi i64 [ 0, %bb354 ], [ %i381, %bb356.bb356_crit_edge ]
  %i361 = getelementptr inbounds i32, ptr %i324, i64 %i357
  %i362 = load i32, ptr %i361, align 4, !tbaa !16
  %i363 = tail call i32 @llvm.smax.i32(i32 %i362, i32 %i359)
  %i364 = tail call i32 @llvm.smin.i32(i32 %i362, i32 %i358)
  %i365 = or disjoint i64 %i357, 1
  %i366 = getelementptr inbounds i32, ptr %i324, i64 %i365
  %i367 = load i32, ptr %i366, align 4, !tbaa !16
  %i368 = tail call i32 @llvm.smax.i32(i32 %i367, i32 %i363)
  %i369 = tail call i32 @llvm.smin.i32(i32 %i367, i32 %i364)
  %i370 = or disjoint i64 %i357, 2
  %i371 = getelementptr inbounds i32, ptr %i324, i64 %i370
  %i372 = load i32, ptr %i371, align 4, !tbaa !16
  %i373 = tail call i32 @llvm.smax.i32(i32 %i372, i32 %i368)
  %i374 = tail call i32 @llvm.smin.i32(i32 %i372, i32 %i369)
  %i375 = or disjoint i64 %i357, 3
  %i376 = getelementptr inbounds i32, ptr %i324, i64 %i375
  %i377 = load i32, ptr %i376, align 4, !tbaa !16
  %i378 = tail call i32 @llvm.smax.i32(i32 %i377, i32 %i373)
  %i379 = tail call i32 @llvm.smin.i32(i32 %i377, i32 %i374)
  %i380 = add nuw nsw i64 %i357, 4
  %i381 = add i64 %i360, 4
  %i382 = icmp eq i64 %i381, %i355
  br i1 %i382, label %bb383.loopexit, label %bb356.bb356_crit_edge, !llvm.loop !18

bb356.bb356_crit_edge:                            ; preds = %bb356
  br label %bb356

bb383.loopexit:                                   ; preds = %bb356
  br label %bb383

bb383:                                            ; preds = %bb383.loopexit, %bb349.bb383_crit_edge
  %i384 = phi i32 [ undef, %bb349.bb383_crit_edge ], [ %i378, %bb383.loopexit ]
  %i385 = phi i32 [ undef, %bb349.bb383_crit_edge ], [ %i379, %bb383.loopexit ]
  %i386 = phi i64 [ 0, %bb349.bb383_crit_edge ], [ %i380, %bb383.loopexit ]
  %i387 = phi i32 [ %i350, %bb349.bb383_crit_edge ], [ %i379, %bb383.loopexit ]
  %i388 = phi i32 [ %i350, %bb349.bb383_crit_edge ], [ %i378, %bb383.loopexit ]
  %i389 = icmp eq i64 %i352, 0
  br i1 %i389, label %bb383.bb402_crit_edge, label %bb390.preheader

bb383.bb402_crit_edge:                            ; preds = %bb383
  br label %bb402

bb390.preheader:                                  ; preds = %bb383
  br label %bb390

bb390:                                            ; preds = %bb390.bb390_crit_edge, %bb390.preheader
  %i391 = phi i64 [ %i399, %bb390.bb390_crit_edge ], [ %i386, %bb390.preheader ]
  %i392 = phi i32 [ %i398, %bb390.bb390_crit_edge ], [ %i387, %bb390.preheader ]
  %i393 = phi i32 [ %i397, %bb390.bb390_crit_edge ], [ %i388, %bb390.preheader ]
  %i394 = phi i64 [ %i400, %bb390.bb390_crit_edge ], [ 0, %bb390.preheader ]
  %i395 = getelementptr inbounds i32, ptr %i324, i64 %i391
  %i396 = load i32, ptr %i395, align 4, !tbaa !16
  %i397 = tail call i32 @llvm.smax.i32(i32 %i396, i32 %i393)
  %i398 = tail call i32 @llvm.smin.i32(i32 %i396, i32 %i392)
  %i399 = add nuw nsw i64 %i391, 1
  %i400 = add i64 %i394, 1
  %i401 = icmp eq i64 %i400, %i352
  br i1 %i401, label %bb402.loopexit, label %bb390.bb390_crit_edge, !llvm.loop !70

bb390.bb390_crit_edge:                            ; preds = %bb390
  br label %bb390

bb402.loopexit:                                   ; preds = %bb390
  br label %bb402

bb402:                                            ; preds = %bb402.loopexit, %bb383.bb402_crit_edge
  %i403 = phi i32 [ %i384, %bb383.bb402_crit_edge ], [ %i397, %bb402.loopexit ]
  %i404 = phi i32 [ %i385, %bb383.bb402_crit_edge ], [ %i398, %bb402.loopexit ]
  %i405 = sub nsw i32 %i403, %i404
  %i406 = and i64 %i351, 1
  %i407 = icmp eq i32 %i321, 1
  br i1 %i407, label %bb402.bb478_crit_edge, label %bb408

bb402.bb478_crit_edge:                            ; preds = %bb402
  br label %bb478

bb408:                                            ; preds = %bb402
  %i409 = and i64 %i351, 2147483646
  br label %bb410

bb410:                                            ; preds = %bb410.bb410_crit_edge, %bb408
  %i411 = phi i64 [ 0, %bb408 ], [ %i428, %bb410.bb410_crit_edge ]
  %i412 = phi i64 [ 0, %bb408 ], [ %i429, %bb410.bb410_crit_edge ]
  %i413 = getelementptr inbounds i32, ptr %i324, i64 %i411
  %i414 = load i32, ptr %i413, align 4, !tbaa !16
  %i415 = sub nsw i32 %i414, %i404
  %i416 = mul nsw i32 %i415, 255
  %i417 = sdiv i32 %i416, %i405
  %i418 = trunc i32 %i417 to i8
  %i419 = getelementptr inbounds i8, ptr %i347, i64 %i411
  store i8 %i418, ptr %i419, align 1, !tbaa !21
  %i420 = or disjoint i64 %i411, 1
  %i421 = getelementptr inbounds i32, ptr %i324, i64 %i420
  %i422 = load i32, ptr %i421, align 4, !tbaa !16
  %i423 = sub nsw i32 %i422, %i404
  %i424 = mul nsw i32 %i423, 255
  %i425 = sdiv i32 %i424, %i405
  %i426 = trunc i32 %i425 to i8
  %i427 = getelementptr inbounds i8, ptr %i347, i64 %i420
  store i8 %i426, ptr %i427, align 1, !tbaa !21
  %i428 = add nuw nsw i64 %i411, 2
  %i429 = add i64 %i412, 2
  %i430 = icmp eq i64 %i429, %i409
  br i1 %i430, label %bb478.loopexit, label %bb410.bb410_crit_edge, !llvm.loop !22

bb410.bb410_crit_edge:                            ; preds = %bb410
  br label %bb410

bb431:                                            ; preds = %bb344
  %i432 = icmp eq i32 %i80, 0
  %i433 = load ptr, ptr %i, align 8, !tbaa !8
  br i1 %i432, label %bb435, label %bb434

bb434:                                            ; preds = %bb431
  call void @susan_corners_quick(ptr noundef %i433, ptr noundef %i324, ptr noundef nonnull %i326, i32 noundef 1850, ptr noundef nonnull %i4, i32 noundef %i319, i32 noundef %i320)
  br label %bb436

bb435:                                            ; preds = %bb431
  call void @susan_corners(ptr noundef %i433, ptr noundef %i324, ptr noundef nonnull %i326, i32 noundef 1850, ptr noundef nonnull %i4, i32 noundef %i319, i32 noundef %i320)
  br label %bb436

bb436:                                            ; preds = %bb435, %bb434
  %i437 = getelementptr inbounds %struct.anon, ptr %i4, i64 0, i32 2
  %i438 = load i32, ptr %i437, align 8, !tbaa !52
  %i439 = icmp eq i32 %i438, 7
  br i1 %i439, label %bb436.bb489_crit_edge, label %bb440

bb436.bb489_crit_edge:                            ; preds = %bb436
  br label %bb489

bb440:                                            ; preds = %bb436
  %i441 = icmp eq i32 %i79, 0
  %i442 = add nsw i32 %i319, -2
  %i443 = sext i32 %i442 to i64
  br label %bb444

bb444:                                            ; preds = %bb472.bb444_crit_edge, %bb440
  %i445 = phi i64 [ 0, %bb440 ], [ %i473, %bb472.bb444_crit_edge ]
  %i446 = phi ptr [ %i4, %bb440 ], [ %i474, %bb472.bb444_crit_edge ]
  %i447 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i445, i32 1
  %i448 = load i32, ptr %i447, align 4, !tbaa !54
  br i1 %i441, label %bb449, label %bb465

bb449:                                            ; preds = %bb444
  %i450 = add nsw i32 %i448, -1
  %i451 = mul nsw i32 %i450, %i319
  %i452 = sext i32 %i451 to i64
  %i453 = getelementptr inbounds i8, ptr %i433, i64 %i452
  %i454 = load i32, ptr %i446, align 4, !tbaa !55
  %i455 = sext i32 %i454 to i64
  %i456 = getelementptr inbounds i8, ptr %i453, i64 %i455
  %i457 = getelementptr inbounds i8, ptr %i456, i64 -1
  store i8 -1, ptr %i457, align 1, !tbaa !21
  %i458 = getelementptr inbounds i8, ptr %i456, i64 1
  store i8 -1, ptr %i456, align 1, !tbaa !21
  store i8 -1, ptr %i458, align 1, !tbaa !21
  %i459 = getelementptr inbounds i8, ptr %i458, i64 %i443
  %i460 = getelementptr inbounds i8, ptr %i459, i64 1
  store i8 -1, ptr %i459, align 1, !tbaa !21
  %i461 = getelementptr inbounds i8, ptr %i459, i64 2
  store i8 0, ptr %i460, align 1, !tbaa !21
  store i8 -1, ptr %i461, align 1, !tbaa !21
  %i462 = getelementptr inbounds i8, ptr %i461, i64 %i443
  %i463 = getelementptr inbounds i8, ptr %i462, i64 1
  store i8 -1, ptr %i462, align 1, !tbaa !21
  %i464 = getelementptr inbounds i8, ptr %i462, i64 2
  store i8 -1, ptr %i463, align 1, !tbaa !21
  store i8 -1, ptr %i464, align 1, !tbaa !21
  br label %bb472

bb465:                                            ; preds = %bb444
  %i466 = mul nsw i32 %i448, %i319
  %i467 = sext i32 %i466 to i64
  %i468 = getelementptr inbounds i8, ptr %i433, i64 %i467
  %i469 = load i32, ptr %i446, align 4, !tbaa !55
  %i470 = sext i32 %i469 to i64
  %i471 = getelementptr inbounds i8, ptr %i468, i64 %i470
  store i8 0, ptr %i471, align 1, !tbaa !21
  br label %bb472

bb472:                                            ; preds = %bb465, %bb449
  %i473 = add nuw nsw i64 %i445, 1
  %i474 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i473
  %i475 = getelementptr inbounds %struct.anon, ptr %i4, i64 %i473, i32 2
  %i476 = load i32, ptr %i475, align 8, !tbaa !52
  %i477 = icmp eq i32 %i476, 7
  br i1 %i477, label %bb489.loopexit, label %bb472.bb444_crit_edge, !llvm.loop !56

bb472.bb444_crit_edge:                            ; preds = %bb472
  br label %bb444

bb478.loopexit:                                   ; preds = %bb410
  br label %bb478

bb478:                                            ; preds = %bb478.loopexit, %bb402.bb478_crit_edge
  %i479 = phi i64 [ 0, %bb402.bb478_crit_edge ], [ %i428, %bb478.loopexit ]
  %i480 = icmp eq i64 %i406, 0
  br i1 %i480, label %bb478.bb489_crit_edge, label %bb481

bb478.bb489_crit_edge:                            ; preds = %bb478
  br label %bb489

bb481:                                            ; preds = %bb478
  %i482 = getelementptr inbounds i32, ptr %i324, i64 %i479
  %i483 = load i32, ptr %i482, align 4, !tbaa !16
  %i484 = sub nsw i32 %i483, %i404
  %i485 = mul nsw i32 %i484, 255
  %i486 = sdiv i32 %i485, %i405
  %i487 = trunc i32 %i486 to i8
  %i488 = getelementptr inbounds i8, ptr %i347, i64 %i479
  store i8 %i487, ptr %i488, align 1, !tbaa !21
  br label %bb489

bb489.loopexit:                                   ; preds = %bb472
  br label %bb489

bb489:                                            ; preds = %bb489.loopexit, %bb481, %bb478.bb489_crit_edge, %bb436.bb489_crit_edge, %bb346.bb489_crit_edge
  tail call void @free(ptr noundef nonnull %i325) #21
  tail call void @free(ptr noundef %i324) #21
  br label %bb491

bb490:                                            ; preds = %bb74
  unreachable

bb491:                                            ; preds = %bb489, %bb317, %bb105
  %i492 = getelementptr inbounds ptr, ptr %arg1, i64 2
  %i493 = load ptr, ptr %i492, align 8, !tbaa !8
  %i494 = load ptr, ptr %i, align 8, !tbaa !8
  %i495 = load i32, ptr %i2, align 4, !tbaa !16
  %i496 = load i32, ptr %i3, align 4, !tbaa !16
  tail call void @put_image(ptr noundef %i493, ptr noundef %i494, i32 noundef %i495, i32 noundef %i496)
  tail call void @free(ptr noundef %i494) #21
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
!39 = distinct !{!39, !15}
!40 = distinct !{!40, !15}
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
