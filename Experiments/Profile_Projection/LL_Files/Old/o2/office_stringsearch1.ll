; ModuleID = 'office_stringsearch1.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@lowervec = dso_local local_unnamed_addr global [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\7Fcueaaaaceeeiiiaae\91\92ooouuyou\9B\9C\9D\9E\9Faiounn\A6\A7\A8\A9\AA\AB\AC\AD\AE\AF\B0\B1\B2\B3\B4\B5\B6\B7\B8\B9\BA\BB\BC\BD\BE\BF\C0\C1\C2\C3\C4\C5\C6\C7\C8\C9\CA\CB\CC\CD\CE\CF\D0\D1\D2\D3\D4\D5\D6\D7\D8\D9\DA\DB\DC\DD\DE\DF\E0\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\EB\EC\ED\EE\EF\F0\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA\FB\FC\FD\FE\FF", align 16
@pat = internal unnamed_addr global ptr null, align 8
@patlen = internal unnamed_addr global i32 0, align 4
@skip = internal unnamed_addr global [256 x i32] zeroinitializer, align 16
@skip2 = internal unnamed_addr global i32 0, align 4
@patlen.1 = internal unnamed_addr global i32 0, align 4
@pat.2 = internal unnamed_addr global ptr null, align 8
@skip.3 = internal unnamed_addr global [256 x i32] zeroinitializer, align 16
@skip2.4 = internal unnamed_addr global i32 0, align 4
@pat.5 = internal unnamed_addr global ptr null, align 8
@patlen.6 = internal unnamed_addr global i32 0, align 4
@skip.7 = internal unnamed_addr global [256 x i32] zeroinitializer, align 16
@skip2.8 = internal unnamed_addr global i32 0, align 4
@len = internal unnamed_addr global i64 0, align 8
@table = internal unnamed_addr global [256 x i64] zeroinitializer, align 16
@findme = internal unnamed_addr global ptr null, align 8
@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Error: too few parameters!\0A\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"\0AError: Can't find text!\0A\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"\0AError: Can't find search strings!\0A\00", align 1
@str_misc = internal global [1024 x i8] zeroinitializer, align 16
@.str.7 = private unnamed_addr constant [22 x i8] c"Size1=%lu, size2=%lu\0A\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.9 = private unnamed_addr constant [38 x i8] c"\0AError: Can't open file for writing!\0A\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"\22%s\22 is%s in \22%s\22\00", align 1
@.str.11 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.12 = private unnamed_addr constant [5 x i8] c" not\00", align 1
@.str.13 = private unnamed_addr constant [8 x i8] c" [\22%s\22]\00", align 1

; Function Attrs: nofree nounwind memory(readwrite, argmem: read, inaccessiblemem: none) uwtable
define dso_local void @bmha_init(ptr noundef %arg) local_unnamed_addr #0 {
bb:
  store ptr %arg, ptr @pat, align 8, !tbaa !8
  %i = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %arg) #19
  %i1 = trunc i64 %i to i32
  store i32 %i1, ptr @patlen, align 4, !tbaa !12
  %i2 = and i64 %i, 4294967295
  br label %bb3

bb3:                                              ; preds = %bb25.bb3_crit_edge, %bb
  %i4 = phi i64 [ 0, %bb ], [ %i26, %bb25.bb3_crit_edge ]
  %i5 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %i4
  store i32 %i1, ptr %i5, align 4, !tbaa !12
  %i6 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i4
  br label %bb7

bb7:                                              ; preds = %bb11.bb7_crit_edge, %bb3
  %i8 = phi i64 [ %i12, %bb11.bb7_crit_edge ], [ %i2, %bb3 ]
  %i9 = trunc i64 %i8 to i32
  %i10 = icmp sgt i32 %i9, 0
  br i1 %i10, label %bb11, label %bb22.loopexit

bb11:                                             ; preds = %bb7
  %i12 = add nsw i64 %i8, -1
  %i13 = load i8, ptr %i6, align 1, !tbaa !14
  %i14 = getelementptr inbounds i8, ptr %arg, i64 %i12
  %i15 = load i8, ptr %i14, align 1, !tbaa !14
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i16
  %i18 = load i8, ptr %i17, align 1, !tbaa !14
  %i19 = icmp eq i8 %i13, %i18
  br i1 %i19, label %bb20, label %bb11.bb7_crit_edge, !llvm.loop !15

bb11.bb7_crit_edge:                               ; preds = %bb11
  br label %bb7

bb20:                                             ; preds = %bb11
  %i21 = sub i32 %i1, %i9
  store i32 %i21, ptr %i5, align 4, !tbaa !12
  br label %bb22

bb22.loopexit:                                    ; preds = %bb7
  br label %bb22

bb22:                                             ; preds = %bb22.loopexit, %bb20
  %i23 = icmp eq i32 %i9, %i1
  br i1 %i23, label %bb24, label %bb22.bb25_crit_edge

bb22.bb25_crit_edge:                              ; preds = %bb22
  br label %bb25

bb24:                                             ; preds = %bb22
  store i32 32767, ptr %i5, align 4, !tbaa !12
  br label %bb25

bb25:                                             ; preds = %bb24, %bb22.bb25_crit_edge
  %i26 = add nuw nsw i64 %i4, 1
  %i27 = icmp eq i64 %i26, 256
  br i1 %i27, label %bb28, label %bb25.bb3_crit_edge, !llvm.loop !17

bb25.bb3_crit_edge:                               ; preds = %bb25
  br label %bb3

bb28:                                             ; preds = %bb25
  store i32 %i1, ptr @skip2, align 4, !tbaa !12
  %i29 = icmp sgt i32 %i1, 1
  br i1 %i29, label %bb30, label %bb28.bb86_crit_edge

bb28.bb86_crit_edge:                              ; preds = %bb28
  br label %bb86

bb30:                                             ; preds = %bb28
  %i31 = add nsw i32 %i1, -1
  %i32 = zext nneg i32 %i31 to i64
  %i33 = getelementptr inbounds i8, ptr %arg, i64 %i32
  %i34 = load i8, ptr %i33, align 1, !tbaa !14
  %i35 = zext i8 %i34 to i64
  %i36 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i35
  %i37 = load i8, ptr %i36, align 1, !tbaa !14
  %i38 = zext i32 %i31 to i64
  %i39 = and i64 %i38, 1
  %i40 = icmp eq i32 %i31, 1
  br i1 %i40, label %bb30.bb72_crit_edge, label %bb41

bb30.bb72_crit_edge:                              ; preds = %bb30
  br label %bb72

bb41:                                             ; preds = %bb30
  %i42 = and i64 %i38, 4294967294
  br label %bb43

bb43:                                             ; preds = %bb68.bb43_crit_edge, %bb41
  %i44 = phi i64 [ 0, %bb41 ], [ %i69, %bb68.bb43_crit_edge ]
  %i45 = phi i64 [ 0, %bb41 ], [ %i70, %bb68.bb43_crit_edge ]
  %i46 = getelementptr inbounds i8, ptr %arg, i64 %i44
  %i47 = load i8, ptr %i46, align 1, !tbaa !14
  %i48 = zext i8 %i47 to i64
  %i49 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i48
  %i50 = load i8, ptr %i49, align 1, !tbaa !14
  %i51 = icmp eq i8 %i50, %i37
  br i1 %i51, label %bb52, label %bb43.bb56_crit_edge

bb43.bb56_crit_edge:                              ; preds = %bb43
  br label %bb56

bb52:                                             ; preds = %bb43
  %i53 = trunc i64 %i44 to i32
  %i54 = xor i32 %i53, -1
  %i55 = add nsw i32 %i54, %i1
  store i32 %i55, ptr @skip2, align 4, !tbaa !12
  br label %bb56

bb56:                                             ; preds = %bb52, %bb43.bb56_crit_edge
  %i57 = or disjoint i64 %i44, 1
  %i58 = getelementptr inbounds i8, ptr %arg, i64 %i57
  %i59 = load i8, ptr %i58, align 1, !tbaa !14
  %i60 = zext i8 %i59 to i64
  %i61 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i60
  %i62 = load i8, ptr %i61, align 1, !tbaa !14
  %i63 = icmp eq i8 %i62, %i37
  br i1 %i63, label %bb64, label %bb56.bb68_crit_edge

bb56.bb68_crit_edge:                              ; preds = %bb56
  br label %bb68

bb64:                                             ; preds = %bb56
  %i65 = trunc i64 %i57 to i32
  %i66 = xor i32 %i65, -1
  %i67 = add nsw i32 %i66, %i1
  store i32 %i67, ptr @skip2, align 4, !tbaa !12
  br label %bb68

bb68:                                             ; preds = %bb64, %bb56.bb68_crit_edge
  %i69 = add nuw nsw i64 %i44, 2
  %i70 = add i64 %i45, 2
  %i71 = icmp eq i64 %i70, %i42
  br i1 %i71, label %bb72.loopexit, label %bb68.bb43_crit_edge, !llvm.loop !18

bb68.bb43_crit_edge:                              ; preds = %bb68
  br label %bb43

bb72.loopexit:                                    ; preds = %bb68
  br label %bb72

bb72:                                             ; preds = %bb72.loopexit, %bb30.bb72_crit_edge
  %i73 = phi i64 [ 0, %bb30.bb72_crit_edge ], [ %i69, %bb72.loopexit ]
  %i74 = icmp eq i64 %i39, 0
  br i1 %i74, label %bb72.bb86_crit_edge, label %bb75

bb72.bb86_crit_edge:                              ; preds = %bb72
  br label %bb86

bb75:                                             ; preds = %bb72
  %i76 = getelementptr inbounds i8, ptr %arg, i64 %i73
  %i77 = load i8, ptr %i76, align 1, !tbaa !14
  %i78 = zext i8 %i77 to i64
  %i79 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i78
  %i80 = load i8, ptr %i79, align 1, !tbaa !14
  %i81 = icmp eq i8 %i80, %i37
  br i1 %i81, label %bb82, label %bb75.bb86_crit_edge

bb75.bb86_crit_edge:                              ; preds = %bb75
  br label %bb86

bb82:                                             ; preds = %bb75
  %i83 = trunc i64 %i73 to i32
  %i84 = xor i32 %i83, -1
  %i85 = add nsw i32 %i84, %i1
  store i32 %i85, ptr @skip2, align 4, !tbaa !12
  br label %bb86

bb86:                                             ; preds = %bb82, %bb75.bb86_crit_edge, %bb72.bb86_crit_edge, %bb28.bb86_crit_edge
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i64 @strlen(ptr nocapture noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local ptr @bmha_search(ptr noundef readonly %arg, i32 noundef %arg1) local_unnamed_addr #2 {
bb:
  %i = load i32, ptr @patlen, align 4, !tbaa !12
  %i2 = xor i32 %arg1, -1
  %i3 = add i32 %i, %i2
  %i4 = icmp sgt i32 %i3, -1
  br i1 %i4, label %bb.bb52_crit_edge, label %bb5

bb.bb52_crit_edge:                                ; preds = %bb
  br label %bb52

bb5:                                              ; preds = %bb
  %i6 = sext i32 %arg1 to i64
  %i7 = getelementptr inbounds i8, ptr %arg, i64 %i6
  %i8 = sub nsw i32 32767, %arg1
  %i9 = add i32 %i, -1
  %i10 = load ptr, ptr @pat, align 8
  %i11 = load i32, ptr @skip2, align 4
  %i12 = zext i32 %i9 to i64
  br label %bb13

bb13:                                             ; preds = %bb23, %bb5
  %i14 = phi i32 [ %i3, %bb5 ], [ %i24, %bb23 ]
  %i15 = sext i32 %i14 to i64
  %i16 = getelementptr inbounds i8, ptr %i7, i64 %i15
  %i17 = load i8, ptr %i16, align 1, !tbaa !14
  %i18 = zext i8 %i17 to i64
  %i19 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %i18
  %i20 = load i32, ptr %i19, align 4, !tbaa !12
  %i21 = add nsw i32 %i20, %i14
  %i22 = icmp slt i32 %i21, 0
  br i1 %i22, label %bb13.bb23_crit_edge, label %bb25

bb13.bb23_crit_edge:                              ; preds = %bb13
  br label %bb23

bb23:                                             ; preds = %bb49.bb23_crit_edge, %bb13.bb23_crit_edge
  %i24 = phi i32 [ %i21, %bb13.bb23_crit_edge ], [ %i50, %bb49.bb23_crit_edge ]
  br label %bb13, !llvm.loop !19

bb25:                                             ; preds = %bb13
  %i26 = icmp slt i32 %i21, %i8
  br i1 %i26, label %bb25.bb52.loopexit1_crit_edge, label %bb27

bb25.bb52.loopexit1_crit_edge:                    ; preds = %bb25
  br label %bb52.loopexit1

bb27:                                             ; preds = %bb25
  %i28 = add nsw i32 %i21, -32767
  %i29 = sub nsw i32 %i28, %i9
  %i30 = sext i32 %i29 to i64
  %i31 = getelementptr inbounds i8, ptr %i7, i64 %i30
  br label %bb32

bb32:                                             ; preds = %bb36.bb32_crit_edge, %bb27
  %i33 = phi i64 [ %i37, %bb36.bb32_crit_edge ], [ %i12, %bb27 ]
  %i34 = trunc i64 %i33 to i32
  %i35 = icmp sgt i32 %i34, 0
  br i1 %i35, label %bb36, label %bb52.loopexit

bb36:                                             ; preds = %bb32
  %i37 = add nsw i64 %i33, -1
  %i38 = getelementptr inbounds i8, ptr %i31, i64 %i37
  %i39 = load i8, ptr %i38, align 1, !tbaa !14
  %i40 = zext i8 %i39 to i64
  %i41 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i40
  %i42 = load i8, ptr %i41, align 1, !tbaa !14
  %i43 = getelementptr inbounds i8, ptr %i10, i64 %i37
  %i44 = load i8, ptr %i43, align 1, !tbaa !14
  %i45 = zext i8 %i44 to i64
  %i46 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i45
  %i47 = load i8, ptr %i46, align 1, !tbaa !14
  %i48 = icmp eq i8 %i42, %i47
  br i1 %i48, label %bb36.bb32_crit_edge, label %bb49, !llvm.loop !20

bb36.bb32_crit_edge:                              ; preds = %bb36
  br label %bb32

bb49:                                             ; preds = %bb36
  %i50 = add nsw i32 %i11, %i28
  %i51 = icmp sgt i32 %i50, -1
  br i1 %i51, label %bb52.loopexit1split, label %bb49.bb23_crit_edge

bb49.bb23_crit_edge:                              ; preds = %bb49
  br label %bb23

bb52.loopexit:                                    ; preds = %bb32
  br label %bb52

bb52.loopexit1split:                              ; preds = %bb49
  br label %bb52.loopexit1

bb52.loopexit1:                                   ; preds = %bb52.loopexit1split, %bb25.bb52.loopexit1_crit_edge
  br label %bb52

bb52:                                             ; preds = %bb52.loopexit1, %bb52.loopexit, %bb.bb52_crit_edge
  %i53 = phi ptr [ null, %bb.bb52_crit_edge ], [ %i31, %bb52.loopexit ], [ null, %bb52.loopexit1 ]
  ret ptr %i53
}

; Function Attrs: nounwind uwtable
define dso_local void @bmhi_init(ptr nocapture noundef readonly %arg) local_unnamed_addr #3 {
bb:
  %i = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %arg) #19
  %i1 = trunc i64 %i to i32
  store i32 %i1, ptr @patlen.1, align 4, !tbaa !12
  %i2 = load ptr, ptr @pat.2, align 8, !tbaa !8
  %i3 = shl i64 %i, 32
  %i4 = ashr exact i64 %i3, 32
  %i5 = tail call ptr @realloc(ptr noundef %i2, i64 noundef %i4) #20
  store ptr %i5, ptr @pat.2, align 8, !tbaa !8
  %i6 = icmp eq ptr %i5, null
  br i1 %i6, label %bb7, label %bb8

bb7:                                              ; preds = %bb
  tail call void @exit(i32 noundef 1) #21
  unreachable

bb8:                                              ; preds = %bb
  %i9 = tail call i32 @atexit(ptr noundef nonnull @bhmi_cleanup) #22
  %i10 = load i32, ptr @patlen.1, align 4, !tbaa !12
  %i11 = icmp sgt i32 %i10, 0
  br i1 %i11, label %bb30, label %bb8.bb29_crit_edge

bb8.bb29_crit_edge:                               ; preds = %bb8
  br label %bb29

bb12.loopexit:                                    ; preds = %bb38
  br label %bb12

bb12:                                             ; preds = %bb30.bb12_crit_edge, %bb12.loopexit
  %i13 = phi i64 [ 0, %bb30.bb12_crit_edge ], [ %i76, %bb12.loopexit ]
  %i14 = icmp eq i64 %i34, 0
  br i1 %i14, label %bb12.bb29_crit_edge, label %bb15.preheader

bb12.bb29_crit_edge:                              ; preds = %bb12
  br label %bb29

bb15.preheader:                                   ; preds = %bb12
  br label %bb15

bb15:                                             ; preds = %bb15.bb15_crit_edge, %bb15.preheader
  %i16 = phi i64 [ %i26, %bb15.bb15_crit_edge ], [ %i13, %bb15.preheader ]
  %i17 = phi i64 [ %i27, %bb15.bb15_crit_edge ], [ 0, %bb15.preheader ]
  %i18 = load ptr, ptr %i31, align 8, !tbaa !8
  %i19 = getelementptr inbounds i8, ptr %arg, i64 %i16
  %i20 = load i8, ptr %i19, align 1, !tbaa !14
  %i21 = sext i8 %i20 to i64
  %i22 = getelementptr inbounds i32, ptr %i18, i64 %i21
  %i23 = load i32, ptr %i22, align 4, !tbaa !12
  %i24 = trunc i32 %i23 to i8
  %i25 = getelementptr inbounds i8, ptr %i32, i64 %i16
  store i8 %i24, ptr %i25, align 1, !tbaa !14
  %i26 = add nuw nsw i64 %i16, 1
  %i27 = add i64 %i17, 1
  %i28 = icmp eq i64 %i27, %i34
  br i1 %i28, label %bb29.loopexit, label %bb15.bb15_crit_edge, !llvm.loop !21

bb15.bb15_crit_edge:                              ; preds = %bb15
  br label %bb15

bb29.loopexit:                                    ; preds = %bb15
  br label %bb29

bb29:                                             ; preds = %bb29.loopexit, %bb12.bb29_crit_edge, %bb8.bb29_crit_edge
  br label %bb91

bb30:                                             ; preds = %bb8
  %i31 = tail call ptr @__ctype_toupper_loc() #23
  %i32 = load ptr, ptr @pat.2, align 8, !tbaa !8
  %i33 = zext nneg i32 %i10 to i64
  %i34 = and i64 %i33, 3
  %i35 = icmp ult i32 %i10, 4
  br i1 %i35, label %bb30.bb12_crit_edge, label %bb36

bb30.bb12_crit_edge:                              ; preds = %bb30
  br label %bb12

bb36:                                             ; preds = %bb30
  %i37 = and i64 %i33, 2147483644
  br label %bb38

bb38:                                             ; preds = %bb38.bb38_crit_edge, %bb36
  %i39 = phi i64 [ 0, %bb36 ], [ %i76, %bb38.bb38_crit_edge ]
  %i40 = phi i64 [ 0, %bb36 ], [ %i77, %bb38.bb38_crit_edge ]
  %i41 = load ptr, ptr %i31, align 8, !tbaa !8
  %i42 = getelementptr inbounds i8, ptr %arg, i64 %i39
  %i43 = load i8, ptr %i42, align 1, !tbaa !14
  %i44 = sext i8 %i43 to i64
  %i45 = getelementptr inbounds i32, ptr %i41, i64 %i44
  %i46 = load i32, ptr %i45, align 4, !tbaa !12
  %i47 = trunc i32 %i46 to i8
  %i48 = getelementptr inbounds i8, ptr %i32, i64 %i39
  store i8 %i47, ptr %i48, align 1, !tbaa !14
  %i49 = or disjoint i64 %i39, 1
  %i50 = load ptr, ptr %i31, align 8, !tbaa !8
  %i51 = getelementptr inbounds i8, ptr %arg, i64 %i49
  %i52 = load i8, ptr %i51, align 1, !tbaa !14
  %i53 = sext i8 %i52 to i64
  %i54 = getelementptr inbounds i32, ptr %i50, i64 %i53
  %i55 = load i32, ptr %i54, align 4, !tbaa !12
  %i56 = trunc i32 %i55 to i8
  %i57 = getelementptr inbounds i8, ptr %i32, i64 %i49
  store i8 %i56, ptr %i57, align 1, !tbaa !14
  %i58 = or disjoint i64 %i39, 2
  %i59 = load ptr, ptr %i31, align 8, !tbaa !8
  %i60 = getelementptr inbounds i8, ptr %arg, i64 %i58
  %i61 = load i8, ptr %i60, align 1, !tbaa !14
  %i62 = sext i8 %i61 to i64
  %i63 = getelementptr inbounds i32, ptr %i59, i64 %i62
  %i64 = load i32, ptr %i63, align 4, !tbaa !12
  %i65 = trunc i32 %i64 to i8
  %i66 = getelementptr inbounds i8, ptr %i32, i64 %i58
  store i8 %i65, ptr %i66, align 1, !tbaa !14
  %i67 = or disjoint i64 %i39, 3
  %i68 = load ptr, ptr %i31, align 8, !tbaa !8
  %i69 = getelementptr inbounds i8, ptr %arg, i64 %i67
  %i70 = load i8, ptr %i69, align 1, !tbaa !14
  %i71 = sext i8 %i70 to i64
  %i72 = getelementptr inbounds i32, ptr %i68, i64 %i71
  %i73 = load i32, ptr %i72, align 4, !tbaa !12
  %i74 = trunc i32 %i73 to i8
  %i75 = getelementptr inbounds i8, ptr %i32, i64 %i67
  store i8 %i74, ptr %i75, align 1, !tbaa !14
  %i76 = add nuw nsw i64 %i39, 4
  %i77 = add i64 %i40, 4
  %i78 = icmp eq i64 %i77, %i37
  br i1 %i78, label %bb12.loopexit, label %bb38.bb38_crit_edge, !llvm.loop !23

bb38.bb38_crit_edge:                              ; preds = %bb38
  br label %bb38

bb79:                                             ; preds = %bb91
  %i80 = add i32 %i10, -1
  %i81 = icmp sgt i32 %i10, 1
  %i82 = load ptr, ptr @pat.2, align 8, !tbaa !8
  br i1 %i81, label %bb83, label %bb79.bb146_crit_edge

bb79.bb146_crit_edge:                             ; preds = %bb79
  br label %bb146

bb83:                                             ; preds = %bb79
  %i84 = tail call ptr @__ctype_tolower_loc() #23
  %i85 = load ptr, ptr %i84, align 8, !tbaa !8
  %i86 = zext nneg i32 %i80 to i64
  %i87 = and i64 %i86, 1
  %i88 = icmp eq i32 %i80, 1
  br i1 %i88, label %bb83.bb131_crit_edge, label %bb89

bb83.bb131_crit_edge:                             ; preds = %bb83
  br label %bb131

bb89:                                             ; preds = %bb83
  %i90 = and i64 %i86, 2147483646
  br label %bb102

bb91:                                             ; preds = %bb91.bb91_crit_edge, %bb29
  %i92 = phi i64 [ 0, %bb29 ], [ %i100, %bb91.bb91_crit_edge ]
  %i93 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i92
  store i32 %i10, ptr %i93, align 16, !tbaa !12
  %i94 = or disjoint i64 %i92, 1
  %i95 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i94
  store i32 %i10, ptr %i95, align 4, !tbaa !12
  %i96 = or disjoint i64 %i92, 2
  %i97 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i96
  store i32 %i10, ptr %i97, align 8, !tbaa !12
  %i98 = or disjoint i64 %i92, 3
  %i99 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i98
  store i32 %i10, ptr %i99, align 4, !tbaa !12
  %i100 = add nuw nsw i64 %i92, 4
  %i101 = icmp eq i64 %i100, 256
  br i1 %i101, label %bb79, label %bb91.bb91_crit_edge, !llvm.loop !24

bb91.bb91_crit_edge:                              ; preds = %bb91
  br label %bb91

bb102:                                            ; preds = %bb102.bb102_crit_edge, %bb89
  %i103 = phi i64 [ 0, %bb89 ], [ %i128, %bb102.bb102_crit_edge ]
  %i104 = phi i64 [ 0, %bb89 ], [ %i129, %bb102.bb102_crit_edge ]
  %i105 = trunc i64 %i103 to i32
  %i106 = xor i32 %i105, -1
  %i107 = add nsw i32 %i10, %i106
  %i108 = getelementptr inbounds i8, ptr %i82, i64 %i103
  %i109 = load i8, ptr %i108, align 1, !tbaa !14
  %i110 = zext i8 %i109 to i64
  %i111 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i110
  store i32 %i107, ptr %i111, align 4, !tbaa !12
  %i112 = getelementptr inbounds i32, ptr %i85, i64 %i110
  %i113 = load i32, ptr %i112, align 4, !tbaa !12
  %i114 = sext i32 %i113 to i64
  %i115 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i114
  store i32 %i107, ptr %i115, align 4, !tbaa !12
  %i116 = or disjoint i64 %i103, 1
  %i117 = trunc i64 %i116 to i32
  %i118 = xor i32 %i117, -1
  %i119 = add nsw i32 %i10, %i118
  %i120 = getelementptr inbounds i8, ptr %i82, i64 %i116
  %i121 = load i8, ptr %i120, align 1, !tbaa !14
  %i122 = zext i8 %i121 to i64
  %i123 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i122
  store i32 %i119, ptr %i123, align 4, !tbaa !12
  %i124 = getelementptr inbounds i32, ptr %i85, i64 %i122
  %i125 = load i32, ptr %i124, align 4, !tbaa !12
  %i126 = sext i32 %i125 to i64
  %i127 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i126
  store i32 %i119, ptr %i127, align 4, !tbaa !12
  %i128 = add nuw nsw i64 %i103, 2
  %i129 = add i64 %i104, 2
  %i130 = icmp eq i64 %i129, %i90
  br i1 %i130, label %bb131.loopexit, label %bb102.bb102_crit_edge, !llvm.loop !25

bb102.bb102_crit_edge:                            ; preds = %bb102
  br label %bb102

bb131.loopexit:                                   ; preds = %bb102
  br label %bb131

bb131:                                            ; preds = %bb131.loopexit, %bb83.bb131_crit_edge
  %i132 = phi i64 [ 0, %bb83.bb131_crit_edge ], [ %i128, %bb131.loopexit ]
  %i133 = icmp eq i64 %i87, 0
  br i1 %i133, label %bb131.bb146_crit_edge, label %bb134

bb131.bb146_crit_edge:                            ; preds = %bb131
  br label %bb146

bb134:                                            ; preds = %bb131
  %i135 = trunc i64 %i132 to i32
  %i136 = xor i32 %i135, -1
  %i137 = add nsw i32 %i10, %i136
  %i138 = getelementptr inbounds i8, ptr %i82, i64 %i132
  %i139 = load i8, ptr %i138, align 1, !tbaa !14
  %i140 = zext i8 %i139 to i64
  %i141 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i140
  store i32 %i137, ptr %i141, align 4, !tbaa !12
  %i142 = getelementptr inbounds i32, ptr %i85, i64 %i140
  %i143 = load i32, ptr %i142, align 4, !tbaa !12
  %i144 = sext i32 %i143 to i64
  %i145 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i144
  store i32 %i137, ptr %i145, align 4, !tbaa !12
  br label %bb146

bb146:                                            ; preds = %bb134, %bb131.bb146_crit_edge, %bb79.bb146_crit_edge
  %i147 = sext i32 %i80 to i64
  %i148 = getelementptr inbounds i8, ptr %i82, i64 %i147
  %i149 = load i8, ptr %i148, align 1, !tbaa !14
  %i150 = zext i8 %i149 to i64
  %i151 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i150
  store i32 32767, ptr %i151, align 4, !tbaa !12
  %i152 = tail call ptr @__ctype_tolower_loc() #23
  %i153 = load ptr, ptr %i152, align 8, !tbaa !8
  %i154 = getelementptr inbounds i32, ptr %i153, i64 %i150
  %i155 = load i32, ptr %i154, align 4, !tbaa !12
  %i156 = sext i32 %i155 to i64
  %i157 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i156
  store i32 32767, ptr %i157, align 4, !tbaa !12
  store i32 %i10, ptr @skip2.4, align 4, !tbaa !12
  br i1 %i81, label %bb158, label %bb146.bb198_crit_edge

bb146.bb198_crit_edge:                            ; preds = %bb146
  br label %bb198

bb158:                                            ; preds = %bb146
  %i159 = zext i32 %i80 to i64
  %i160 = and i64 %i159, 1
  %i161 = icmp eq i32 %i80, 1
  br i1 %i161, label %bb158.bb187_crit_edge, label %bb162

bb158.bb187_crit_edge:                            ; preds = %bb158
  br label %bb187

bb162:                                            ; preds = %bb158
  %i163 = and i64 %i159, 4294967294
  br label %bb164

bb164:                                            ; preds = %bb183.bb164_crit_edge, %bb162
  %i165 = phi i64 [ 0, %bb162 ], [ %i184, %bb183.bb164_crit_edge ]
  %i166 = phi i64 [ 0, %bb162 ], [ %i185, %bb183.bb164_crit_edge ]
  %i167 = getelementptr inbounds i8, ptr %i82, i64 %i165
  %i168 = load i8, ptr %i167, align 1, !tbaa !14
  %i169 = icmp eq i8 %i168, %i149
  br i1 %i169, label %bb170, label %bb164.bb174_crit_edge

bb164.bb174_crit_edge:                            ; preds = %bb164
  br label %bb174

bb170:                                            ; preds = %bb164
  %i171 = trunc i64 %i165 to i32
  %i172 = xor i32 %i171, -1
  %i173 = add nsw i32 %i10, %i172
  store i32 %i173, ptr @skip2.4, align 4, !tbaa !12
  br label %bb174

bb174:                                            ; preds = %bb170, %bb164.bb174_crit_edge
  %i175 = or disjoint i64 %i165, 1
  %i176 = getelementptr inbounds i8, ptr %i82, i64 %i175
  %i177 = load i8, ptr %i176, align 1, !tbaa !14
  %i178 = icmp eq i8 %i177, %i149
  br i1 %i178, label %bb179, label %bb174.bb183_crit_edge

bb174.bb183_crit_edge:                            ; preds = %bb174
  br label %bb183

bb179:                                            ; preds = %bb174
  %i180 = trunc i64 %i175 to i32
  %i181 = xor i32 %i180, -1
  %i182 = add nsw i32 %i10, %i181
  store i32 %i182, ptr @skip2.4, align 4, !tbaa !12
  br label %bb183

bb183:                                            ; preds = %bb179, %bb174.bb183_crit_edge
  %i184 = add nuw nsw i64 %i165, 2
  %i185 = add i64 %i166, 2
  %i186 = icmp eq i64 %i185, %i163
  br i1 %i186, label %bb187.loopexit, label %bb183.bb164_crit_edge, !llvm.loop !26

bb183.bb164_crit_edge:                            ; preds = %bb183
  br label %bb164

bb187.loopexit:                                   ; preds = %bb183
  br label %bb187

bb187:                                            ; preds = %bb187.loopexit, %bb158.bb187_crit_edge
  %i188 = phi i64 [ 0, %bb158.bb187_crit_edge ], [ %i184, %bb187.loopexit ]
  %i189 = icmp eq i64 %i160, 0
  br i1 %i189, label %bb187.bb198_crit_edge, label %bb190

bb187.bb198_crit_edge:                            ; preds = %bb187
  br label %bb198

bb190:                                            ; preds = %bb187
  %i191 = getelementptr inbounds i8, ptr %i82, i64 %i188
  %i192 = load i8, ptr %i191, align 1, !tbaa !14
  %i193 = icmp eq i8 %i192, %i149
  br i1 %i193, label %bb194, label %bb190.bb198_crit_edge

bb190.bb198_crit_edge:                            ; preds = %bb190
  br label %bb198

bb194:                                            ; preds = %bb190
  %i195 = trunc i64 %i188 to i32
  %i196 = xor i32 %i195, -1
  %i197 = add nsw i32 %i10, %i196
  store i32 %i197, ptr @skip2.4, align 4, !tbaa !12
  br label %bb198

bb198:                                            ; preds = %bb194, %bb190.bb198_crit_edge, %bb187.bb198_crit_edge, %bb146.bb198_crit_edge
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite)
declare noalias noundef ptr @realloc(ptr allocptr nocapture noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nounwind willreturn uwtable
define dso_local void @bhmi_cleanup() #6 {
bb:
  %i = load ptr, ptr @pat.2, align 8, !tbaa !8
  tail call void @free(ptr noundef %i) #22
  ret void
}

; Function Attrs: nounwind
declare i32 @atexit(ptr noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare ptr @__ctype_toupper_loc() local_unnamed_addr #8

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare ptr @__ctype_tolower_loc() local_unnamed_addr #8

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #9

; Function Attrs: nofree nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local ptr @bmhi_search(ptr noundef readonly %arg, i32 noundef %arg1) local_unnamed_addr #10 {
bb:
  %i = load i32, ptr @patlen.1, align 4, !tbaa !12
  %i2 = xor i32 %arg1, -1
  %i3 = add i32 %i, %i2
  %i4 = icmp sgt i32 %i3, -1
  br i1 %i4, label %bb.bb52_crit_edge, label %bb5

bb.bb52_crit_edge:                                ; preds = %bb
  br label %bb52

bb5:                                              ; preds = %bb
  %i6 = sext i32 %arg1 to i64
  %i7 = getelementptr inbounds i8, ptr %arg, i64 %i6
  %i8 = sub nsw i32 32767, %arg1
  %i9 = add i32 %i, -1
  %i10 = load ptr, ptr @pat.2, align 8
  %i11 = load i32, ptr @skip2.4, align 4
  %i12 = zext i32 %i9 to i64
  br label %bb13

bb13:                                             ; preds = %bb23, %bb5
  %i14 = phi i32 [ %i3, %bb5 ], [ %i24, %bb23 ]
  %i15 = sext i32 %i14 to i64
  %i16 = getelementptr inbounds i8, ptr %i7, i64 %i15
  %i17 = load i8, ptr %i16, align 1, !tbaa !14
  %i18 = zext i8 %i17 to i64
  %i19 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i18
  %i20 = load i32, ptr %i19, align 4, !tbaa !12
  %i21 = add nsw i32 %i20, %i14
  %i22 = icmp slt i32 %i21, 0
  br i1 %i22, label %bb13.bb23_crit_edge, label %bb25

bb13.bb23_crit_edge:                              ; preds = %bb13
  br label %bb23

bb23:                                             ; preds = %bb49.bb23_crit_edge, %bb13.bb23_crit_edge
  %i24 = phi i32 [ %i21, %bb13.bb23_crit_edge ], [ %i50, %bb49.bb23_crit_edge ]
  br label %bb13, !llvm.loop !27

bb25:                                             ; preds = %bb13
  %i26 = icmp slt i32 %i21, %i8
  br i1 %i26, label %bb25.bb52.loopexit1_crit_edge, label %bb27

bb25.bb52.loopexit1_crit_edge:                    ; preds = %bb25
  br label %bb52.loopexit1

bb27:                                             ; preds = %bb25
  %i28 = add nsw i32 %i21, -32767
  %i29 = sub nsw i32 %i28, %i9
  %i30 = sext i32 %i29 to i64
  %i31 = getelementptr inbounds i8, ptr %i7, i64 %i30
  br label %bb32

bb32:                                             ; preds = %bb36.bb32_crit_edge, %bb27
  %i33 = phi i64 [ %i37, %bb36.bb32_crit_edge ], [ %i12, %bb27 ]
  %i34 = trunc i64 %i33 to i32
  %i35 = icmp sgt i32 %i34, 0
  br i1 %i35, label %bb36, label %bb52.loopexit

bb36:                                             ; preds = %bb32
  %i37 = add nsw i64 %i33, -1
  %i38 = tail call ptr @__ctype_toupper_loc() #23
  %i39 = load ptr, ptr %i38, align 8, !tbaa !8
  %i40 = getelementptr inbounds i8, ptr %i31, i64 %i37
  %i41 = load i8, ptr %i40, align 1, !tbaa !14
  %i42 = sext i8 %i41 to i64
  %i43 = getelementptr inbounds i32, ptr %i39, i64 %i42
  %i44 = load i32, ptr %i43, align 4, !tbaa !12
  %i45 = getelementptr inbounds i8, ptr %i10, i64 %i37
  %i46 = load i8, ptr %i45, align 1, !tbaa !14
  %i47 = zext i8 %i46 to i32
  %i48 = icmp eq i32 %i44, %i47
  br i1 %i48, label %bb36.bb32_crit_edge, label %bb49, !llvm.loop !28

bb36.bb32_crit_edge:                              ; preds = %bb36
  br label %bb32

bb49:                                             ; preds = %bb36
  %i50 = add nsw i32 %i11, %i28
  %i51 = icmp sgt i32 %i50, -1
  br i1 %i51, label %bb52.loopexit1split, label %bb49.bb23_crit_edge

bb49.bb23_crit_edge:                              ; preds = %bb49
  br label %bb23

bb52.loopexit:                                    ; preds = %bb32
  br label %bb52

bb52.loopexit1split:                              ; preds = %bb49
  br label %bb52.loopexit1

bb52.loopexit1:                                   ; preds = %bb52.loopexit1split, %bb25.bb52.loopexit1_crit_edge
  br label %bb52

bb52:                                             ; preds = %bb52.loopexit1, %bb52.loopexit, %bb.bb52_crit_edge
  %i53 = phi ptr [ null, %bb.bb52_crit_edge ], [ %i31, %bb52.loopexit ], [ null, %bb52.loopexit1 ]
  ret ptr %i53
}

; Function Attrs: nofree nounwind memory(write, argmem: read, inaccessiblemem: none) uwtable
define dso_local void @bmh_init(ptr noundef %arg) local_unnamed_addr #11 {
bb:
  store ptr %arg, ptr @pat.5, align 8, !tbaa !8
  %i = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %arg) #19
  %i1 = trunc i64 %i to i32
  store i32 %i1, ptr @patlen.6, align 4, !tbaa !12
  br label %bb10

bb2:                                              ; preds = %bb10
  %i3 = icmp sgt i32 %i1, 0
  br i1 %i3, label %bb4, label %bb2.bb53_crit_edge

bb2.bb53_crit_edge:                               ; preds = %bb2
  br label %bb53

bb4:                                              ; preds = %bb2
  %i5 = and i64 %i, 4294967295
  %i6 = and i64 %i, 1
  %i7 = icmp eq i64 %i5, 1
  br i1 %i7, label %bb4.bb42_crit_edge, label %bb8

bb4.bb42_crit_edge:                               ; preds = %bb4
  br label %bb42

bb8:                                              ; preds = %bb4
  %i9 = sub nsw i64 %i5, %i6
  br label %bb21

bb10:                                             ; preds = %bb10.bb10_crit_edge, %bb
  %i11 = phi i64 [ 0, %bb ], [ %i19, %bb10.bb10_crit_edge ]
  %i12 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i11
  store i32 %i1, ptr %i12, align 16, !tbaa !12
  %i13 = or disjoint i64 %i11, 1
  %i14 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i13
  store i32 %i1, ptr %i14, align 4, !tbaa !12
  %i15 = or disjoint i64 %i11, 2
  %i16 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i15
  store i32 %i1, ptr %i16, align 8, !tbaa !12
  %i17 = or disjoint i64 %i11, 3
  %i18 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i17
  store i32 %i1, ptr %i18, align 4, !tbaa !12
  %i19 = add nuw nsw i64 %i11, 4
  %i20 = icmp eq i64 %i19, 256
  br i1 %i20, label %bb2, label %bb10.bb10_crit_edge, !llvm.loop !29

bb10.bb10_crit_edge:                              ; preds = %bb10
  br label %bb10

bb21:                                             ; preds = %bb21.bb21_crit_edge, %bb8
  %i22 = phi i64 [ 0, %bb8 ], [ %i39, %bb21.bb21_crit_edge ]
  %i23 = phi i64 [ 0, %bb8 ], [ %i40, %bb21.bb21_crit_edge ]
  %i24 = trunc i64 %i22 to i32
  %i25 = xor i32 %i24, -1
  %i26 = add nsw i32 %i25, %i1
  %i27 = getelementptr inbounds i8, ptr %arg, i64 %i22
  %i28 = load i8, ptr %i27, align 1, !tbaa !14
  %i29 = zext i8 %i28 to i64
  %i30 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i29
  store i32 %i26, ptr %i30, align 4, !tbaa !12
  %i31 = or disjoint i64 %i22, 1
  %i32 = trunc i64 %i31 to i32
  %i33 = xor i32 %i32, -1
  %i34 = add nsw i32 %i33, %i1
  %i35 = getelementptr inbounds i8, ptr %arg, i64 %i31
  %i36 = load i8, ptr %i35, align 1, !tbaa !14
  %i37 = zext i8 %i36 to i64
  %i38 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i37
  store i32 %i34, ptr %i38, align 4, !tbaa !12
  %i39 = add nuw nsw i64 %i22, 2
  %i40 = add i64 %i23, 2
  %i41 = icmp eq i64 %i40, %i9
  br i1 %i41, label %bb42.loopexit, label %bb21.bb21_crit_edge, !llvm.loop !30

bb21.bb21_crit_edge:                              ; preds = %bb21
  br label %bb21

bb42.loopexit:                                    ; preds = %bb21
  br label %bb42

bb42:                                             ; preds = %bb42.loopexit, %bb4.bb42_crit_edge
  %i43 = phi i64 [ 0, %bb4.bb42_crit_edge ], [ %i39, %bb42.loopexit ]
  %i44 = icmp eq i64 %i6, 0
  br i1 %i44, label %bb42.bb53_crit_edge, label %bb45

bb42.bb53_crit_edge:                              ; preds = %bb42
  br label %bb53

bb45:                                             ; preds = %bb42
  %i46 = trunc i64 %i43 to i32
  %i47 = xor i32 %i46, -1
  %i48 = add nsw i32 %i47, %i1
  %i49 = getelementptr inbounds i8, ptr %arg, i64 %i43
  %i50 = load i8, ptr %i49, align 1, !tbaa !14
  %i51 = zext i8 %i50 to i64
  %i52 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i51
  store i32 %i48, ptr %i52, align 4, !tbaa !12
  br label %bb53

bb53:                                             ; preds = %bb45, %bb42.bb53_crit_edge, %bb2.bb53_crit_edge
  %i54 = shl i64 %i, 32
  %i55 = ashr exact i64 %i54, 32
  %i56 = getelementptr i8, ptr %arg, i64 %i55
  %i57 = getelementptr i8, ptr %i56, i64 -1
  %i58 = load i8, ptr %i57, align 1, !tbaa !14
  %i59 = zext i8 %i58 to i64
  %i60 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i59
  store i32 32767, ptr %i60, align 4, !tbaa !12
  store i32 %i1, ptr @skip2.8, align 4, !tbaa !12
  %i61 = icmp sgt i32 %i1, 1
  br i1 %i61, label %bb62, label %bb53.bb103_crit_edge

bb53.bb103_crit_edge:                             ; preds = %bb53
  br label %bb103

bb62:                                             ; preds = %bb53
  %i63 = add i64 %i, 4294967295
  %i64 = and i64 %i63, 4294967295
  %i65 = and i64 %i63, 1
  %i66 = icmp eq i64 %i64, 1
  br i1 %i66, label %bb62.bb92_crit_edge, label %bb67

bb62.bb92_crit_edge:                              ; preds = %bb62
  br label %bb92

bb67:                                             ; preds = %bb62
  %i68 = sub nsw i64 %i64, %i65
  br label %bb69

bb69:                                             ; preds = %bb88.bb69_crit_edge, %bb67
  %i70 = phi i64 [ 0, %bb67 ], [ %i89, %bb88.bb69_crit_edge ]
  %i71 = phi i64 [ 0, %bb67 ], [ %i90, %bb88.bb69_crit_edge ]
  %i72 = getelementptr inbounds i8, ptr %arg, i64 %i70
  %i73 = load i8, ptr %i72, align 1, !tbaa !14
  %i74 = icmp eq i8 %i73, %i58
  br i1 %i74, label %bb75, label %bb69.bb79_crit_edge

bb69.bb79_crit_edge:                              ; preds = %bb69
  br label %bb79

bb75:                                             ; preds = %bb69
  %i76 = trunc i64 %i70 to i32
  %i77 = xor i32 %i76, -1
  %i78 = add nsw i32 %i77, %i1
  store i32 %i78, ptr @skip2.8, align 4, !tbaa !12
  br label %bb79

bb79:                                             ; preds = %bb75, %bb69.bb79_crit_edge
  %i80 = or disjoint i64 %i70, 1
  %i81 = getelementptr inbounds i8, ptr %arg, i64 %i80
  %i82 = load i8, ptr %i81, align 1, !tbaa !14
  %i83 = icmp eq i8 %i82, %i58
  br i1 %i83, label %bb84, label %bb79.bb88_crit_edge

bb79.bb88_crit_edge:                              ; preds = %bb79
  br label %bb88

bb84:                                             ; preds = %bb79
  %i85 = trunc i64 %i80 to i32
  %i86 = xor i32 %i85, -1
  %i87 = add nsw i32 %i86, %i1
  store i32 %i87, ptr @skip2.8, align 4, !tbaa !12
  br label %bb88

bb88:                                             ; preds = %bb84, %bb79.bb88_crit_edge
  %i89 = add nuw nsw i64 %i70, 2
  %i90 = add i64 %i71, 2
  %i91 = icmp eq i64 %i90, %i68
  br i1 %i91, label %bb92.loopexit, label %bb88.bb69_crit_edge, !llvm.loop !31

bb88.bb69_crit_edge:                              ; preds = %bb88
  br label %bb69

bb92.loopexit:                                    ; preds = %bb88
  br label %bb92

bb92:                                             ; preds = %bb92.loopexit, %bb62.bb92_crit_edge
  %i93 = phi i64 [ 0, %bb62.bb92_crit_edge ], [ %i89, %bb92.loopexit ]
  %i94 = icmp eq i64 %i65, 0
  br i1 %i94, label %bb92.bb103_crit_edge, label %bb95

bb92.bb103_crit_edge:                             ; preds = %bb92
  br label %bb103

bb95:                                             ; preds = %bb92
  %i96 = getelementptr inbounds i8, ptr %arg, i64 %i93
  %i97 = load i8, ptr %i96, align 1, !tbaa !14
  %i98 = icmp eq i8 %i97, %i58
  br i1 %i98, label %bb99, label %bb95.bb103_crit_edge

bb95.bb103_crit_edge:                             ; preds = %bb95
  br label %bb103

bb99:                                             ; preds = %bb95
  %i100 = trunc i64 %i93 to i32
  %i101 = xor i32 %i100, -1
  %i102 = add nsw i32 %i101, %i1
  store i32 %i102, ptr @skip2.8, align 4, !tbaa !12
  br label %bb103

bb103:                                            ; preds = %bb99, %bb95.bb103_crit_edge, %bb92.bb103_crit_edge, %bb53.bb103_crit_edge
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local ptr @bmh_search(ptr noundef readonly %arg, i32 noundef %arg1) local_unnamed_addr #2 {
bb:
  %i = load i32, ptr @patlen.6, align 4, !tbaa !12
  %i2 = xor i32 %arg1, -1
  %i3 = add i32 %i, %i2
  %i4 = icmp sgt i32 %i3, -1
  br i1 %i4, label %bb.bb48_crit_edge, label %bb5

bb.bb48_crit_edge:                                ; preds = %bb
  br label %bb48

bb5:                                              ; preds = %bb
  %i6 = sext i32 %arg1 to i64
  %i7 = getelementptr inbounds i8, ptr %arg, i64 %i6
  %i8 = sub nsw i32 32767, %arg1
  %i9 = add i32 %i, -1
  %i10 = load ptr, ptr @pat.5, align 8
  %i11 = load i32, ptr @skip2.8, align 4
  %i12 = zext i32 %i9 to i64
  br label %bb13

bb13:                                             ; preds = %bb23, %bb5
  %i14 = phi i32 [ %i3, %bb5 ], [ %i24, %bb23 ]
  %i15 = sext i32 %i14 to i64
  %i16 = getelementptr inbounds i8, ptr %i7, i64 %i15
  %i17 = load i8, ptr %i16, align 1, !tbaa !14
  %i18 = zext i8 %i17 to i64
  %i19 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i18
  %i20 = load i32, ptr %i19, align 4, !tbaa !12
  %i21 = add nsw i32 %i20, %i14
  %i22 = icmp slt i32 %i21, 0
  br i1 %i22, label %bb13.bb23_crit_edge, label %bb25

bb13.bb23_crit_edge:                              ; preds = %bb13
  br label %bb23

bb23:                                             ; preds = %bb45.bb23_crit_edge, %bb13.bb23_crit_edge
  %i24 = phi i32 [ %i21, %bb13.bb23_crit_edge ], [ %i46, %bb45.bb23_crit_edge ]
  br label %bb13, !llvm.loop !32

bb25:                                             ; preds = %bb13
  %i26 = icmp slt i32 %i21, %i8
  br i1 %i26, label %bb25.bb48.loopexit1_crit_edge, label %bb27

bb25.bb48.loopexit1_crit_edge:                    ; preds = %bb25
  br label %bb48.loopexit1

bb27:                                             ; preds = %bb25
  %i28 = add nsw i32 %i21, -32767
  %i29 = sub nsw i32 %i28, %i9
  %i30 = sext i32 %i29 to i64
  %i31 = getelementptr inbounds i8, ptr %i7, i64 %i30
  br label %bb32

bb32:                                             ; preds = %bb36.bb32_crit_edge, %bb27
  %i33 = phi i64 [ %i37, %bb36.bb32_crit_edge ], [ %i12, %bb27 ]
  %i34 = trunc i64 %i33 to i32
  %i35 = icmp sgt i32 %i34, 0
  br i1 %i35, label %bb36, label %bb48.loopexit

bb36:                                             ; preds = %bb32
  %i37 = add nsw i64 %i33, -1
  %i38 = getelementptr inbounds i8, ptr %i31, i64 %i37
  %i39 = load i8, ptr %i38, align 1, !tbaa !14
  %i40 = sext i8 %i39 to i32
  %i41 = getelementptr inbounds i8, ptr %i10, i64 %i37
  %i42 = load i8, ptr %i41, align 1, !tbaa !14
  %i43 = zext i8 %i42 to i32
  %i44 = icmp eq i32 %i40, %i43
  br i1 %i44, label %bb36.bb32_crit_edge, label %bb45, !llvm.loop !33

bb36.bb32_crit_edge:                              ; preds = %bb36
  br label %bb32

bb45:                                             ; preds = %bb36
  %i46 = add nsw i32 %i11, %i28
  %i47 = icmp sgt i32 %i46, -1
  br i1 %i47, label %bb48.loopexit1split, label %bb45.bb23_crit_edge

bb45.bb23_crit_edge:                              ; preds = %bb45
  br label %bb23

bb48.loopexit:                                    ; preds = %bb32
  br label %bb48

bb48.loopexit1split:                              ; preds = %bb45
  br label %bb48.loopexit1

bb48.loopexit1:                                   ; preds = %bb48.loopexit1split, %bb25.bb48.loopexit1_crit_edge
  br label %bb48

bb48:                                             ; preds = %bb48.loopexit1, %bb48.loopexit, %bb.bb48_crit_edge
  %i49 = phi ptr [ null, %bb.bb48_crit_edge ], [ %i31, %bb48.loopexit ], [ null, %bb48.loopexit1 ]
  ret ptr %i49
}

; Function Attrs: nofree nounwind memory(write, argmem: read, inaccessiblemem: none) uwtable
define dso_local void @init_search(ptr noundef %arg) local_unnamed_addr #11 {
bb:
  %i = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %arg) #19
  store i64 %i, ptr @len, align 8, !tbaa !34
  br label %bb8

bb1:                                              ; preds = %bb8
  %i2 = icmp eq i64 %i, 0
  br i1 %i2, label %bb1.bb48_crit_edge, label %bb3

bb1.bb48_crit_edge:                               ; preds = %bb1
  br label %bb48

bb3:                                              ; preds = %bb1
  %i4 = and i64 %i, 1
  %i5 = icmp eq i64 %i, 1
  br i1 %i5, label %bb3.bb38_crit_edge, label %bb6

bb3.bb38_crit_edge:                               ; preds = %bb3
  br label %bb38

bb6:                                              ; preds = %bb3
  %i7 = and i64 %i, -2
  br label %bb19

bb8:                                              ; preds = %bb8.bb8_crit_edge, %bb
  %i9 = phi i64 [ 0, %bb ], [ %i17, %bb8.bb8_crit_edge ]
  %i10 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i9
  store i64 %i, ptr %i10, align 16, !tbaa !34
  %i11 = or disjoint i64 %i9, 1
  %i12 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i11
  store i64 %i, ptr %i12, align 8, !tbaa !34
  %i13 = or disjoint i64 %i9, 2
  %i14 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i13
  store i64 %i, ptr %i14, align 16, !tbaa !34
  %i15 = or disjoint i64 %i9, 3
  %i16 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i15
  store i64 %i, ptr %i16, align 8, !tbaa !34
  %i17 = add nuw nsw i64 %i9, 4
  %i18 = icmp eq i64 %i17, 256
  br i1 %i18, label %bb1, label %bb8.bb8_crit_edge, !llvm.loop !36

bb8.bb8_crit_edge:                                ; preds = %bb8
  br label %bb8

bb19:                                             ; preds = %bb19.bb19_crit_edge, %bb6
  %i20 = phi i64 [ 0, %bb6 ], [ %i35, %bb19.bb19_crit_edge ]
  %i21 = phi i64 [ 0, %bb6 ], [ %i36, %bb19.bb19_crit_edge ]
  %i22 = xor i64 %i20, -1
  %i23 = add i64 %i, %i22
  %i24 = getelementptr inbounds i8, ptr %arg, i64 %i20
  %i25 = load i8, ptr %i24, align 1, !tbaa !14
  %i26 = zext i8 %i25 to i64
  %i27 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i26
  store i64 %i23, ptr %i27, align 8, !tbaa !34
  %i28 = or disjoint i64 %i20, 1
  %i29 = xor i64 %i20, -2
  %i30 = add i64 %i, %i29
  %i31 = getelementptr inbounds i8, ptr %arg, i64 %i28
  %i32 = load i8, ptr %i31, align 1, !tbaa !14
  %i33 = zext i8 %i32 to i64
  %i34 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i33
  store i64 %i30, ptr %i34, align 8, !tbaa !34
  %i35 = add nuw i64 %i20, 2
  %i36 = add i64 %i21, 2
  %i37 = icmp eq i64 %i36, %i7
  br i1 %i37, label %bb38.loopexit, label %bb19.bb19_crit_edge, !llvm.loop !37

bb19.bb19_crit_edge:                              ; preds = %bb19
  br label %bb19

bb38.loopexit:                                    ; preds = %bb19
  br label %bb38

bb38:                                             ; preds = %bb38.loopexit, %bb3.bb38_crit_edge
  %i39 = phi i64 [ 0, %bb3.bb38_crit_edge ], [ %i35, %bb38.loopexit ]
  %i40 = icmp eq i64 %i4, 0
  br i1 %i40, label %bb38.bb48_crit_edge, label %bb41

bb38.bb48_crit_edge:                              ; preds = %bb38
  br label %bb48

bb41:                                             ; preds = %bb38
  %i42 = xor i64 %i39, -1
  %i43 = add i64 %i, %i42
  %i44 = getelementptr inbounds i8, ptr %arg, i64 %i39
  %i45 = load i8, ptr %i44, align 1, !tbaa !14
  %i46 = zext i8 %i45 to i64
  %i47 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i46
  store i64 %i43, ptr %i47, align 8, !tbaa !34
  br label %bb48

bb48:                                             ; preds = %bb41, %bb38.bb48_crit_edge, %bb1.bb48_crit_edge
  store ptr %arg, ptr @findme, align 8, !tbaa !8
  ret void
}

; Function Attrs: nofree nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local noundef ptr @strsearch(ptr noundef readonly %arg) local_unnamed_addr #12 {
bb:
  %i = load i64, ptr @len, align 8, !tbaa !34
  %i1 = add i64 %i, -1
  %i2 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %arg) #19
  %i3 = getelementptr i8, ptr %arg, i64 1
  %i4 = icmp ult i64 %i1, %i2
  br i1 %i4, label %bb5, label %bb.bb30_crit_edge

bb.bb30_crit_edge:                                ; preds = %bb
  br label %bb30

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @findme, align 8
  br label %bb12

bb7:                                              ; preds = %bb12
  %i8 = add i64 %i18, %i13
  %i9 = icmp ult i64 %i8, %i2
  br i1 %i9, label %bb7.bb10_crit_edge, label %bb7.bb27_crit_edge

bb7.bb27_crit_edge:                               ; preds = %bb7
  br label %bb27

bb7.bb10_crit_edge:                               ; preds = %bb7
  br label %bb10

bb10:                                             ; preds = %bb27.bb10_crit_edge, %bb7.bb10_crit_edge
  %i11 = phi i64 [ %i8, %bb7.bb10_crit_edge ], [ %i28, %bb27.bb10_crit_edge ]
  br label %bb12, !llvm.loop !38

bb12:                                             ; preds = %bb10, %bb5
  %i13 = phi i64 [ %i1, %bb5 ], [ %i11, %bb10 ]
  %i14 = getelementptr inbounds i8, ptr %arg, i64 %i13
  %i15 = load i8, ptr %i14, align 1, !tbaa !14
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i16
  %i18 = load i64, ptr %i17, align 8, !tbaa !34
  %i19 = icmp eq i64 %i18, 0
  br i1 %i19, label %bb20, label %bb7

bb20:                                             ; preds = %bb12
  %i21 = sub i64 %i13, %i
  %i22 = getelementptr i8, ptr %i3, i64 %i21
  %i23 = tail call i32 @strncmp(ptr noundef %i6, ptr noundef %i22, i64 noundef %i) #19
  %i24 = icmp eq i32 %i23, 0
  br i1 %i24, label %bb20.bb30.loopexit_crit_edge, label %bb25

bb20.bb30.loopexit_crit_edge:                     ; preds = %bb20
  br label %bb30.loopexit

bb25:                                             ; preds = %bb20
  %i26 = add i64 %i13, 1
  br label %bb27

bb27:                                             ; preds = %bb25, %bb7.bb27_crit_edge
  %i28 = phi i64 [ %i26, %bb25 ], [ %i8, %bb7.bb27_crit_edge ]
  %i29 = icmp ult i64 %i28, %i2
  br i1 %i29, label %bb27.bb10_crit_edge, label %bb30.loopexitsplit

bb27.bb10_crit_edge:                              ; preds = %bb27
  br label %bb10

bb30.loopexitsplit:                               ; preds = %bb27
  br label %bb30.loopexit

bb30.loopexit:                                    ; preds = %bb30.loopexitsplit, %bb20.bb30.loopexit_crit_edge
  %i31.ph = phi ptr [ %i22, %bb20.bb30.loopexit_crit_edge ], [ null, %bb30.loopexitsplit ]
  br label %bb30

bb30:                                             ; preds = %bb30.loopexit, %bb.bb30_crit_edge
  %i31 = phi ptr [ null, %bb.bb30_crit_edge ], [ %i31.ph, %bb30.loopexit ]
  ret ptr %i31
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @strncmp(ptr nocapture noundef, ptr nocapture noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr nocapture noundef readonly %arg1) local_unnamed_addr #3 {
bb:
  %i = alloca i64, align 8
  %i2 = alloca [128000 x ptr], align 16
  %i3 = alloca [128000 x ptr], align 16
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #22
  call void @llvm.lifetime.start.p0(i64 1024000, ptr nonnull %i2) #22
  call void @llvm.lifetime.start.p0(i64 1024000, ptr nonnull %i3) #22
  %i4 = tail call noalias ptr @fopen(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1)
  %i5 = icmp eq ptr %i4, null
  br i1 %i5, label %bb6, label %bb9

bb6:                                              ; preds = %bb
  %i7 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i8 = tail call i64 @fwrite(ptr nonnull @.str.2, i64 28, i64 1, ptr %i7) #24
  tail call void @exit(i32 noundef 1) #21
  unreachable

bb9:                                              ; preds = %bb
  %i10 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i4, ptr noundef nonnull @.str.3, ptr noundef nonnull %i) #22
  %i11 = call i32 @fclose(ptr noundef nonnull %i4)
  %i12 = icmp slt i32 %arg, 3
  br i1 %i12, label %bb13, label %bb16

bb13:                                             ; preds = %bb9
  %i14 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i15 = call i64 @fwrite(ptr nonnull @.str.4, i64 27, i64 1, ptr %i14) #24
  call void @exit(i32 noundef 1) #21
  unreachable

bb16:                                             ; preds = %bb9
  %i17 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i18 = load ptr, ptr %i17, align 8, !tbaa !8
  %i19 = call noalias ptr @fopen(ptr noundef %i18, ptr noundef nonnull @.str.1)
  %i20 = icmp eq ptr %i19, null
  br i1 %i20, label %bb21, label %bb24

bb21:                                             ; preds = %bb16
  %i22 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i23 = call i64 @fwrite(ptr nonnull @.str.5, i64 25, i64 1, ptr %i22) #24
  call void @exit(i32 noundef 1) #21
  unreachable

bb24:                                             ; preds = %bb16
  %i25 = getelementptr inbounds ptr, ptr %arg1, i64 2
  %i26 = load ptr, ptr %i25, align 8, !tbaa !8
  %i27 = call noalias ptr @fopen(ptr noundef %i26, ptr noundef nonnull @.str.1)
  %i28 = icmp eq ptr %i27, null
  br i1 %i28, label %bb29, label %bb32.preheader

bb32.preheader:                                   ; preds = %bb24
  br label %bb32

bb29:                                             ; preds = %bb24
  %i30 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i31 = call i64 @fwrite(ptr nonnull @.str.6, i64 35, i64 1, ptr %i30) #24
  call void @exit(i32 noundef 1) #21
  unreachable

bb32:                                             ; preds = %bb40, %bb32.preheader
  %i33 = phi i64 [ %i43, %bb40 ], [ 0, %bb32.preheader ]
  %i34 = call ptr @fgets(ptr noundef nonnull @str_misc, i32 noundef 1024, ptr noundef nonnull %i19)
  %i35 = icmp eq ptr %i34, null
  br i1 %i35, label %bb32.bb39_crit_edge, label %bb36

bb32.bb39_crit_edge:                              ; preds = %bb32
  br label %bb39

bb36:                                             ; preds = %bb32
  %i37 = call i32 @feof(ptr noundef nonnull %i19) #22
  %i38 = icmp eq i32 %i37, 0
  br i1 %i38, label %bb40, label %bb39split

bb39split:                                        ; preds = %bb36
  br label %bb39

bb39:                                             ; preds = %bb39split, %bb32.bb39_crit_edge
  br label %bb44

bb40:                                             ; preds = %bb36
  %i41 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #19
  %i42 = add i64 %i33, 1
  %i43 = add i64 %i42, %i41
  br label %bb32, !llvm.loop !39

bb44:                                             ; preds = %bb51, %bb39
  %i45 = phi i64 [ %i54, %bb51 ], [ 0, %bb39 ]
  %i46 = call ptr @fgets(ptr noundef nonnull @str_misc, i32 noundef 1024, ptr noundef nonnull %i27)
  %i47 = icmp eq ptr %i46, null
  br i1 %i47, label %bb44.bb55_crit_edge, label %bb48

bb44.bb55_crit_edge:                              ; preds = %bb44
  br label %bb55

bb48:                                             ; preds = %bb44
  %i49 = call i32 @feof(ptr noundef nonnull %i27) #22
  %i50 = icmp eq i32 %i49, 0
  br i1 %i50, label %bb51, label %bb55split

bb51:                                             ; preds = %bb48
  %i52 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #19
  %i53 = add i64 %i45, 1
  %i54 = add i64 %i53, %i52
  br label %bb44, !llvm.loop !40

bb55split:                                        ; preds = %bb48
  br label %bb55

bb55:                                             ; preds = %bb55split, %bb44.bb55_crit_edge
  %i56 = call i32 @fclose(ptr noundef nonnull %i19)
  %i57 = call i32 @fclose(ptr noundef nonnull %i27)
  %i58 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i64 noundef %i33, i64 noundef %i45)
  %i59 = call noalias ptr @malloc(i64 noundef %i33) #25
  %i60 = call noalias ptr @malloc(i64 noundef %i45) #25
  %i61 = load ptr, ptr %i17, align 8, !tbaa !8
  %i62 = call noalias ptr @fopen(ptr noundef %i61, ptr noundef nonnull @.str.1)
  %i63 = icmp eq ptr %i62, null
  br i1 %i63, label %bb64, label %bb67

bb64:                                             ; preds = %bb55
  %i65 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i66 = call i64 @fwrite(ptr nonnull @.str.5, i64 25, i64 1, ptr %i65) #24
  call void @exit(i32 noundef 1) #21
  unreachable

bb67:                                             ; preds = %bb55
  %i68 = load ptr, ptr %i25, align 8, !tbaa !8
  %i69 = call noalias ptr @fopen(ptr noundef %i68, ptr noundef nonnull @.str.1)
  %i70 = icmp eq ptr %i69, null
  br i1 %i70, label %bb71, label %bb74.preheader

bb74.preheader:                                   ; preds = %bb67
  br label %bb74

bb71:                                             ; preds = %bb67
  %i72 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i73 = call i64 @fwrite(ptr nonnull @.str.6, i64 35, i64 1, ptr %i72) #24
  call void @exit(i32 noundef 1) #21
  unreachable

bb74:                                             ; preds = %bb88, %bb74.preheader
  %i75 = phi i64 [ %i95, %bb88 ], [ 0, %bb74.preheader ]
  %i76 = phi i64 [ %i92, %bb88 ], [ 0, %bb74.preheader ]
  %i77 = call ptr @fgets(ptr noundef nonnull @str_misc, i32 noundef 1024, ptr noundef nonnull %i62)
  %i78 = icmp eq ptr %i77, null
  br i1 %i78, label %bb74.bb96_crit_edge, label %bb79

bb74.bb96_crit_edge:                              ; preds = %bb74
  br label %bb96

bb79:                                             ; preds = %bb74
  %i80 = call i32 @feof(ptr noundef nonnull %i62) #22
  %i81 = icmp eq i32 %i80, 0
  br i1 %i81, label %bb82, label %bb96split

bb82:                                             ; preds = %bb79
  %i83 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #19
  %i84 = icmp eq i64 %i83, 0
  br i1 %i84, label %bb82.bb88_crit_edge, label %bb85

bb82.bb88_crit_edge:                              ; preds = %bb82
  br label %bb88

bb85:                                             ; preds = %bb82
  %i86 = add i64 %i83, -1
  %i87 = getelementptr inbounds [1024 x i8], ptr @str_misc, i64 0, i64 %i86
  store i8 0, ptr %i87, align 1, !tbaa !14
  br label %bb88

bb88:                                             ; preds = %bb85, %bb82.bb88_crit_edge
  %i89 = getelementptr inbounds i8, ptr %i59, i64 %i75
  %i90 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %i89, ptr noundef nonnull dereferenceable(1) @str_misc) #22
  %i91 = getelementptr inbounds [128000 x ptr], ptr %i2, i64 0, i64 %i76
  store ptr %i89, ptr %i91, align 8, !tbaa !8
  %i92 = add nuw nsw i64 %i76, 1
  %i93 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #19
  %i94 = add i64 %i75, 1
  %i95 = add i64 %i94, %i93
  br label %bb74, !llvm.loop !41

bb96split:                                        ; preds = %bb79
  br label %bb96

bb96:                                             ; preds = %bb96split, %bb74.bb96_crit_edge
  %i97 = getelementptr inbounds [128000 x ptr], ptr %i2, i64 0, i64 %i76
  store ptr null, ptr %i97, align 8, !tbaa !8
  br label %bb98

bb98:                                             ; preds = %bb112, %bb96
  %i99 = phi i64 [ 0, %bb96 ], [ %i119, %bb112 ]
  %i100 = phi i64 [ 0, %bb96 ], [ %i116, %bb112 ]
  %i101 = call ptr @fgets(ptr noundef nonnull @str_misc, i32 noundef 1024, ptr noundef nonnull %i69)
  %i102 = icmp eq ptr %i101, null
  br i1 %i102, label %bb98.bb120_crit_edge, label %bb103

bb98.bb120_crit_edge:                             ; preds = %bb98
  br label %bb120

bb103:                                            ; preds = %bb98
  %i104 = call i32 @feof(ptr noundef nonnull %i69) #22
  %i105 = icmp eq i32 %i104, 0
  br i1 %i105, label %bb106, label %bb120split

bb106:                                            ; preds = %bb103
  %i107 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #19
  %i108 = icmp eq i64 %i107, 0
  br i1 %i108, label %bb106.bb112_crit_edge, label %bb109

bb106.bb112_crit_edge:                            ; preds = %bb106
  br label %bb112

bb109:                                            ; preds = %bb106
  %i110 = add i64 %i107, -1
  %i111 = getelementptr inbounds [1024 x i8], ptr @str_misc, i64 0, i64 %i110
  store i8 0, ptr %i111, align 1, !tbaa !14
  br label %bb112

bb112:                                            ; preds = %bb109, %bb106.bb112_crit_edge
  %i113 = getelementptr inbounds i8, ptr %i60, i64 %i99
  %i114 = call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %i113, ptr noundef nonnull dereferenceable(1) @str_misc) #22
  %i115 = getelementptr inbounds [128000 x ptr], ptr %i3, i64 0, i64 %i100
  store ptr %i113, ptr %i115, align 8, !tbaa !8
  %i116 = add nuw nsw i64 %i100, 1
  %i117 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) @str_misc) #19
  %i118 = add i64 %i99, 1
  %i119 = add i64 %i118, %i117
  br label %bb98, !llvm.loop !42

bb120split:                                       ; preds = %bb103
  br label %bb120

bb120:                                            ; preds = %bb120split, %bb98.bb120_crit_edge
  %i121 = getelementptr inbounds [128000 x ptr], ptr %i3, i64 0, i64 %i100
  store ptr null, ptr %i121, align 8, !tbaa !8
  %i122 = call i32 @fclose(ptr noundef nonnull %i62)
  %i123 = call i32 @fclose(ptr noundef nonnull %i69)
  %i124 = getelementptr inbounds ptr, ptr %arg1, i64 3
  %i125 = load ptr, ptr %i124, align 8, !tbaa !8
  %i126 = call noalias ptr @fopen(ptr noundef %i125, ptr noundef nonnull @.str.8)
  %i127 = icmp eq ptr %i126, null
  br i1 %i127, label %bb131, label %bb128

bb128:                                            ; preds = %bb120
  %i129 = load ptr, ptr %i3, align 16, !tbaa !8
  %i130 = icmp eq ptr %i129, null
  br i1 %i130, label %bb128.bb238_crit_edge, label %bb134.preheader

bb128.bb238_crit_edge:                            ; preds = %bb128
  br label %bb238

bb134.preheader:                                  ; preds = %bb128
  br label %bb134

bb131:                                            ; preds = %bb120
  %i132 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i133 = call i64 @fwrite(ptr nonnull @.str.9, i64 37, i64 1, ptr %i132) #24
  call void @exit(i32 noundef 1) #21
  unreachable

bb134:                                            ; preds = %bb232.bb134_crit_edge, %bb134.preheader
  %i135 = phi i64 [ %i234, %bb232.bb134_crit_edge ], [ 0, %bb134.preheader ]
  %i136 = phi ptr [ %i236, %bb232.bb134_crit_edge ], [ %i129, %bb134.preheader ]
  %i137 = phi ptr [ %i226, %bb232.bb134_crit_edge ], [ null, %bb134.preheader ]
  %i138 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %i136) #19
  store i64 %i138, ptr @len, align 8, !tbaa !34
  br label %bb146

bb139:                                            ; preds = %bb146
  %i140 = icmp eq i64 %i138, 0
  br i1 %i140, label %bb139.bb186_crit_edge, label %bb141

bb139.bb186_crit_edge:                            ; preds = %bb139
  br label %bb186

bb141:                                            ; preds = %bb139
  %i142 = and i64 %i138, 1
  %i143 = icmp eq i64 %i138, 1
  br i1 %i143, label %bb141.bb176_crit_edge, label %bb144

bb141.bb176_crit_edge:                            ; preds = %bb141
  br label %bb176

bb144:                                            ; preds = %bb141
  %i145 = and i64 %i138, -2
  br label %bb157

bb146:                                            ; preds = %bb146.bb146_crit_edge, %bb134
  %i147 = phi i64 [ 0, %bb134 ], [ %i155, %bb146.bb146_crit_edge ]
  %i148 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i147
  store i64 %i138, ptr %i148, align 16, !tbaa !34
  %i149 = or disjoint i64 %i147, 1
  %i150 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i149
  store i64 %i138, ptr %i150, align 8, !tbaa !34
  %i151 = or disjoint i64 %i147, 2
  %i152 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i151
  store i64 %i138, ptr %i152, align 16, !tbaa !34
  %i153 = or disjoint i64 %i147, 3
  %i154 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i153
  store i64 %i138, ptr %i154, align 8, !tbaa !34
  %i155 = add nuw nsw i64 %i147, 4
  %i156 = icmp eq i64 %i155, 256
  br i1 %i156, label %bb139, label %bb146.bb146_crit_edge, !llvm.loop !36

bb146.bb146_crit_edge:                            ; preds = %bb146
  br label %bb146

bb157:                                            ; preds = %bb157.bb157_crit_edge, %bb144
  %i158 = phi i64 [ 0, %bb144 ], [ %i173, %bb157.bb157_crit_edge ]
  %i159 = phi i64 [ 0, %bb144 ], [ %i174, %bb157.bb157_crit_edge ]
  %i160 = xor i64 %i158, -1
  %i161 = add i64 %i138, %i160
  %i162 = getelementptr inbounds i8, ptr %i136, i64 %i158
  %i163 = load i8, ptr %i162, align 1, !tbaa !14
  %i164 = zext i8 %i163 to i64
  %i165 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i164
  store i64 %i161, ptr %i165, align 8, !tbaa !34
  %i166 = or disjoint i64 %i158, 1
  %i167 = xor i64 %i158, -2
  %i168 = add i64 %i138, %i167
  %i169 = getelementptr inbounds i8, ptr %i136, i64 %i166
  %i170 = load i8, ptr %i169, align 1, !tbaa !14
  %i171 = zext i8 %i170 to i64
  %i172 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i171
  store i64 %i168, ptr %i172, align 8, !tbaa !34
  %i173 = add nuw i64 %i158, 2
  %i174 = add i64 %i159, 2
  %i175 = icmp eq i64 %i174, %i145
  br i1 %i175, label %bb176.loopexit, label %bb157.bb157_crit_edge, !llvm.loop !37

bb157.bb157_crit_edge:                            ; preds = %bb157
  br label %bb157

bb176.loopexit:                                   ; preds = %bb157
  br label %bb176

bb176:                                            ; preds = %bb176.loopexit, %bb141.bb176_crit_edge
  %i177 = phi i64 [ 0, %bb141.bb176_crit_edge ], [ %i173, %bb176.loopexit ]
  %i178 = icmp eq i64 %i142, 0
  br i1 %i178, label %bb176.bb186_crit_edge, label %bb179

bb176.bb186_crit_edge:                            ; preds = %bb176
  br label %bb186

bb179:                                            ; preds = %bb176
  %i180 = xor i64 %i177, -1
  %i181 = add i64 %i138, %i180
  %i182 = getelementptr inbounds i8, ptr %i136, i64 %i177
  %i183 = load i8, ptr %i182, align 1, !tbaa !14
  %i184 = zext i8 %i183 to i64
  %i185 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i184
  store i64 %i181, ptr %i185, align 8, !tbaa !34
  br label %bb186

bb186:                                            ; preds = %bb179, %bb176.bb186_crit_edge, %bb139.bb186_crit_edge
  store ptr %i136, ptr @findme, align 8, !tbaa !8
  %i187 = load i64, ptr %i, align 8, !tbaa !34
  %i188 = icmp sgt i64 %i187, 0
  %i189 = getelementptr inbounds [128000 x ptr], ptr %i2, i64 0, i64 %i135
  %i190 = load ptr, ptr %i189, align 8, !tbaa !8
  br i1 %i188, label %bb191, label %bb186.bb225_crit_edge

bb186.bb225_crit_edge:                            ; preds = %bb186
  br label %bb225

bb191:                                            ; preds = %bb186
  %i192 = add i64 %i138, -1
  %i193 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %i190) #19
  %i194 = getelementptr i8, ptr %i190, i64 1
  %i195 = icmp ult i64 %i192, %i193
  br label %bb196

bb196:                                            ; preds = %bb221.bb196_crit_edge, %bb191
  %i197 = phi i64 [ 0, %bb191 ], [ %i223, %bb221.bb196_crit_edge ]
  br i1 %i195, label %bb203.preheader, label %bb196.bb221_crit_edge

bb196.bb221_crit_edge:                            ; preds = %bb196
  br label %bb221

bb203.preheader:                                  ; preds = %bb196
  br label %bb203

bb198:                                            ; preds = %bb203
  %i199 = add i64 %i209, %i204
  %i200 = icmp ult i64 %i199, %i193
  br i1 %i200, label %bb198.bb201_crit_edge, label %bb198.bb218_crit_edge

bb198.bb218_crit_edge:                            ; preds = %bb198
  br label %bb218

bb198.bb201_crit_edge:                            ; preds = %bb198
  br label %bb201

bb201:                                            ; preds = %bb218.bb201_crit_edge, %bb198.bb201_crit_edge
  %i202 = phi i64 [ %i199, %bb198.bb201_crit_edge ], [ %i219, %bb218.bb201_crit_edge ]
  br label %bb203, !llvm.loop !38

bb203:                                            ; preds = %bb201, %bb203.preheader
  %i204 = phi i64 [ %i202, %bb201 ], [ %i192, %bb203.preheader ]
  %i205 = getelementptr inbounds i8, ptr %i190, i64 %i204
  %i206 = load i8, ptr %i205, align 1, !tbaa !14
  %i207 = zext i8 %i206 to i64
  %i208 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i207
  %i209 = load i64, ptr %i208, align 8, !tbaa !34
  %i210 = icmp eq i64 %i209, 0
  br i1 %i210, label %bb211, label %bb198

bb211:                                            ; preds = %bb203
  %i212 = sub i64 %i204, %i138
  %i213 = getelementptr i8, ptr %i194, i64 %i212
  %i214 = call i32 @strncmp(ptr noundef nonnull %i136, ptr noundef %i213, i64 noundef %i138) #19
  %i215 = icmp eq i32 %i214, 0
  br i1 %i215, label %bb211.bb221.loopexit_crit_edge, label %bb216

bb211.bb221.loopexit_crit_edge:                   ; preds = %bb211
  br label %bb221.loopexit

bb216:                                            ; preds = %bb211
  %i217 = add i64 %i204, 1
  br label %bb218

bb218:                                            ; preds = %bb216, %bb198.bb218_crit_edge
  %i219 = phi i64 [ %i217, %bb216 ], [ %i199, %bb198.bb218_crit_edge ]
  %i220 = icmp ult i64 %i219, %i193
  br i1 %i220, label %bb218.bb201_crit_edge, label %bb221.loopexitsplit

bb218.bb201_crit_edge:                            ; preds = %bb218
  br label %bb201

bb221.loopexitsplit:                              ; preds = %bb218
  br label %bb221.loopexit

bb221.loopexit:                                   ; preds = %bb221.loopexitsplit, %bb211.bb221.loopexit_crit_edge
  %i222.ph = phi ptr [ %i213, %bb211.bb221.loopexit_crit_edge ], [ null, %bb221.loopexitsplit ]
  br label %bb221

bb221:                                            ; preds = %bb221.loopexit, %bb196.bb221_crit_edge
  %i222 = phi ptr [ null, %bb196.bb221_crit_edge ], [ %i222.ph, %bb221.loopexit ]
  %i223 = add nuw nsw i64 %i197, 1
  %i224 = icmp eq i64 %i223, %i187
  br i1 %i224, label %bb225.loopexit, label %bb221.bb196_crit_edge, !llvm.loop !43

bb221.bb196_crit_edge:                            ; preds = %bb221
  br label %bb196

bb225.loopexit:                                   ; preds = %bb221
  br label %bb225

bb225:                                            ; preds = %bb225.loopexit, %bb186.bb225_crit_edge
  %i226 = phi ptr [ %i137, %bb186.bb225_crit_edge ], [ %i222, %bb225.loopexit ]
  %i227 = icmp eq ptr %i226, null
  %i228 = select i1 %i227, ptr @.str.12, ptr @.str.11
  %i229 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef nonnull %i126, ptr noundef nonnull @.str.10, ptr noundef nonnull %i136, ptr noundef nonnull %i228, ptr noundef %i190)
  br i1 %i227, label %bb225.bb232_crit_edge, label %bb230

bb225.bb232_crit_edge:                            ; preds = %bb225
  br label %bb232

bb230:                                            ; preds = %bb225
  %i231 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef nonnull %i126, ptr noundef nonnull @.str.13, ptr noundef nonnull %i226)
  br label %bb232

bb232:                                            ; preds = %bb230, %bb225.bb232_crit_edge
  %i233 = call i32 @fputc(i32 10, ptr nonnull %i126)
  %i234 = add nuw i64 %i135, 1
  %i235 = getelementptr inbounds [128000 x ptr], ptr %i3, i64 0, i64 %i234
  %i236 = load ptr, ptr %i235, align 8, !tbaa !8
  %i237 = icmp eq ptr %i236, null
  br i1 %i237, label %bb238.loopexit, label %bb232.bb134_crit_edge, !llvm.loop !44

bb232.bb134_crit_edge:                            ; preds = %bb232
  br label %bb134

bb238.loopexit:                                   ; preds = %bb232
  br label %bb238

bb238:                                            ; preds = %bb238.loopexit, %bb128.bb238_crit_edge
  %i239 = call i32 @fclose(ptr noundef nonnull %i126)
  call void @llvm.lifetime.end.p0(i64 1024000, ptr nonnull %i3) #22
  call void @llvm.lifetime.end.p0(i64 1024000, ptr nonnull %i2) #22
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #22
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #13

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #14

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #15

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #16

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #14

; Function Attrs: nofree nounwind
declare noundef ptr @fgets(ptr noundef, i32 noundef, ptr nocapture noundef) local_unnamed_addr #14

; Function Attrs: nofree nounwind
declare noundef i32 @feof(ptr nocapture noundef) local_unnamed_addr #14

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #14

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #17

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: readwrite)
declare ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias nocapture noundef readonly) local_unnamed_addr #18

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #14

; Function Attrs: nofree nounwind
declare noundef i32 @fputc(i32 noundef, ptr nocapture noundef) local_unnamed_addr #15

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #13

attributes #0 = { nofree nounwind memory(readwrite, argmem: read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(argmem: read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nounwind willreturn uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree nosync nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree nosync nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree nounwind memory(write, argmem: read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #14 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nofree nounwind }
attributes #16 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { mustprogress nofree nounwind willreturn memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #19 = { nounwind willreturn memory(read) }
attributes #20 = { nounwind allocsize(1) }
attributes #21 = { noreturn nounwind }
attributes #22 = { nounwind }
attributes #23 = { nounwind willreturn memory(none) }
attributes #24 = { cold }
attributes #25 = { nounwind allocsize(0) }

!llvm.ident = !{!0, !0, !0, !0}
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
!13 = !{!"int", !10, i64 0}
!14 = !{!10, !10, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !16}
!20 = distinct !{!20, !16}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.unroll.disable"}
!23 = distinct !{!23, !16}
!24 = distinct !{!24, !16}
!25 = distinct !{!25, !16}
!26 = distinct !{!26, !16}
!27 = distinct !{!27, !16}
!28 = distinct !{!28, !16}
!29 = distinct !{!29, !16}
!30 = distinct !{!30, !16}
!31 = distinct !{!31, !16}
!32 = distinct !{!32, !16}
!33 = distinct !{!33, !16}
!34 = !{!35, !35, i64 0}
!35 = !{!"long", !10, i64 0}
!36 = distinct !{!36, !16}
!37 = distinct !{!37, !16}
!38 = distinct !{!38, !16}
!39 = distinct !{!39, !16}
!40 = distinct !{!40, !16}
!41 = distinct !{!41, !16}
!42 = distinct !{!42, !16}
!43 = distinct !{!43, !16}
!44 = distinct !{!44, !16}
