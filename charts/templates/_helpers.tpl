
{{- define "go-echof40ec274-716c-4d5b-a91a-194179c2aabd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof40ec274-716c-4d5b-a91a-194179c2aabd.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echof40ec274-716c-4d5b-a91a-194179c2aabd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof40ec274-716c-4d5b-a91a-194179c2aabd.labels" -}}
helm.sh/chart: {{ include "go-echof40ec274-716c-4d5b-a91a-194179c2aabd.chart" . }}
{{ include "go-echof40ec274-716c-4d5b-a91a-194179c2aabd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof40ec274-716c-4d5b-a91a-194179c2aabd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof40ec274-716c-4d5b-a91a-194179c2aabd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}